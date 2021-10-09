const { myModel } = require('../model')
const Sequelize = require('sequelize');
const Op = Sequelize.Op

class myController {
    // 添加文章
    static async add(ctx) {
        let data= await myModel.findAll({})
        await ctx.render('admin/my/add',{data:data})
    }

    static async doadd(ctx) {
        let params = ctx.req.body  
        params.imgurl =ctx.req.file.filename;
        await myModel.create(params)
        ctx.redirect('/admin/my') 
        
    }
    static async list(ctx) {
        let { currentPage, keyword} = ctx.query
        currentPage = currentPage===undefined? 1 : Number(currentPage)  // 当前页码
        let pageSize = 3  // 每页条数
        let where = {},
            include = [];
            if(keyword){
                where = {
                name: {
                    [Op.like]: '%'+keyword+'%'
                }
            }
            }
            
        let allResponse = await myModel.findAll({ where})
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let prev = currentPage - 1 <= 1 ? 1 : currentPage - 1;
        let next = currentPage + 1 >= totalPage ? totalPage : currentPage + 1;
        let response = await myModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            where,
            include,
            order: [['id', 'DESC']]
        })
        console.log(response);
        await ctx.render('admin/my/list', {data:response,totalPage,currentPage,next,prev,keyword})

    }
   
    // 更新文章
    static async edit(ctx) {
        let id = ctx.params.id;  
        let data = await myModel.findAll(); 
        let dataone = await myModel.findOne({where:{id}}) // 更新拿旧值
        await ctx.render('admin/my/edit',{dataone:dataone,data:data})
    }
    static async doedit(ctx) {
        let id = ctx.query.id;
        let params = ctx.req.body  // ctx.request.body 因为有上传所以 ctx.req.body
        console.log(id);
        console.log(ctx.req.body);
        if(ctx.req.file){
            // 有图的修改
            params.imgurl =ctx.req.file.filename;
        }
        console.log(params);
       await myModel.update(params, { where: { id } })
        ctx.redirect('/admin/my');
    }

     // 删除文章
     static async del(ctx) {
        let id  = ctx.params.id
        await myModel.destroy({
            where: { id },
        }) 
        ctx.redirect('/admin/my') 
    }
   
}

module.exports = myController