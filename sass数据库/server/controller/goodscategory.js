const { goodscategoryModel, goodscolomnModel } = require('../model')
const Sequelize = require('sequelize');

const Op = Sequelize.Op
class goodscategoryController {
    //添加商品栏目
    static async add(ctx) {
        let data = await goodscategoryModel.findAll({})
        await ctx.render('admin/goodscategory/add', { data: data })
    }
    static async doadd(ctx) {
        let params = ctx.req.body
        params.imgurl = ctx.req.file.filename;
        await goodscategoryModel.create(params)
        ctx.redirect('/admin/goodscategory')
    }

    static async list(ctx) {
        let { currentPage, keyword } = ctx.query
        currentPage = currentPage === undefined ? 1 : Number(currentPage)  // 当前页码
        let pageSize = 3  // 每页条数
        let where = {},
            include = [];

        // 没有指定返回字段的情况下返回全部字段
        if (keyword) {
            where = {
                name: {
                    [Op.like]: '%' + keyword + '%'
                }
            }
        }

        include = [
            { model: goodscolomnModel, attributes: ['name'] },
        ]
        let allResponse = await goodscategoryModel.findAll({ where, include })
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let prev = currentPage - 1 <= 1 ? 1 : currentPage - 1;
        let next = currentPage + 1 >= totalPage ? totalPage : currentPage + 1;
        let response = await goodscategoryModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            where,
            include,
            order: [['id', 'DESC']]
        })
        // console.log(response);
        await ctx.render("admin/goodscategory/list", {
            data: response,
            totalPage,
            currentPage,
            next,
            prev,
            keyword,
        });

    }
    // 更新文章
    static async edit(ctx) {
        let id = ctx.params.id;  
        console.log(id);
        //  ctx.query.id(?get传), ctx.request.body.id(表单post传值), ctx.params.id(get动态传值)
        let data = await goodscolomnModel.findAll(); 
        // console.log(data);// category分类名称
        let dataone = await goodscategoryModel.findOne({where:{id}}) // 更新拿旧值
        console.log(dataone);
        await ctx.render('admin/goodscategory/edit',{dataone:dataone,data:data})
    }
    static async doedit(ctx) {
        let id = ctx.query.id;
        let params = ctx.req.body  // ctx.request.body 因为有上传所以 ctx.req.body
        // console.log(id);
        console.log(ctx.req.body);
        if(ctx.req.file){
            // 有图的修改
            params.imgurl =ctx.req.file.filename;
        }
        // console.log(params);
       await goodscategoryModel.update(params, { where: { id } })
        ctx.redirect('/admin/goodscategory');
    }


      // 删除文章
      static async del(ctx) {
        let id = ctx.params.id
        await goodscategoryModel.destroy({
            where: { id },
        })
        ctx.redirect('/admin/goodscategory')
    }
  


}
module.exports = goodscategoryController