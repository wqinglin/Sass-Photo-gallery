const { createToken } = require("../lib/token");
const md5 = require("md5");
const { 
    userModel,
    swiperModel, 
    courseModel,
     categoryModel, 
     goodscolomnModel,
     goodscategoryModel,
     myModel,
     activitiesModel,
     couponModel,
     course_orderModel,
     coupon_userModel,
     catlogModel,
     sequelize 
    } = require('../model')
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
class apiController {
    // 轮播图接口
    static async getswiper(ctx) {
        let results = await swiperModel.findAll({});
        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results
            };
        } else {
            ctx.body = {
                code: 800,
                msg: "没有查询到轮播图",
                data: []
            };
        }
    }
    // 获得所有分类名称信息
    static async cates(ctx) {
        var results = await categoryModel.findAll({
            order: [['order', 'DESC']]
        });
        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results
            };
        } else {
            ctx.body = {
                code: 800,
                msg: "没有查询分类内容",
                data: []
            };
        }
    }

    // 推荐商品
    static async recommend(ctx) {
        let { currentPage } = ctx.query;
        currentPage = currentPage === undefined ? 1 : Number(currentPage)  // 当前页码
        let pageSize = 10// 每页条数

        let allResponse = await courseModel.findAll({})
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let results = await courseModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            order: [['id', 'DESC']]
        })

        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results,
                totalPage: totalPage,
                currentPage: currentPage
            };
        } else {
            ctx.body = {
                code: 1,
                msg: "没有查询到内容",
                data: []
            };
        }
    }

    static async catesAndGoods(ctx) {
        let include = [
            { model: courseModel },
        ]
        let results = await categoryModel.findAll({
            include,
            order: [['id', 'DESC']],
            limit: 5
        })
        console.log(results);
        if (results.length > 0) {
            ctx.body = {
                code: 0,
                msg: "OK",
                data: results
            }
        } else {
            ctx.body = {
                code: 800,
                msg: "没数据",
                data: []
            }
        }


    }

    static async upload(ctx) {
        let params = ctx.req.body  // 注意注意注意注意注意注意注意 不是  ctx.request.body
        // 把用户上传的图片路径写到 req.body 里
        console.log(ctx.req.body);
        console.log(ctx.req.file);  // 注意注意注意注意注意注意


    }

    static async goodDetail(ctx) {

        var id = ctx.params.id;
        var result = await courseModel.findAll({ where: { id } });
        if (result.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: result
            };
        } else {
            ctx.body = {
                code: 1,
                msg: "没有查询到具体商品",
                data: []
            };
        }

    }

    //搜索商品接口
    static async search(ctx) {
        var keyword = ctx.params.keyword;
        let where = {};
        // 没有指定返回字段的情况下返回全部字段
        if (keyword) {
            where = {
                title: {
                    [Op.like]: "%" + keyword + "%",
                },
            };
        }
        var result = await courseModel.findAll({ where });
        if (result.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: result,
            };
        } else {
            ctx.body = {
                code: 1,
                msg: "没有查询到具体商品",
                data: [],
            };
        }
    }
    // 通过分类编号查询对应商品
    static async goodsbycateId(ctx) {
        var cateId = ctx.params.cateId;
        var result = await courseModel.findAll({ where: { categoryId: cateId } });
        if (result.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: result,
            };
        } else {
            ctx.body = {
                code: 1,
                msg: "没有查询到具体商品",
                data: [],
            };
        }
    }
    static async goodscolomn(ctx) {
        let { currentPage } = ctx.query;
        currentPage = currentPage === undefined ? 1 : Number(currentPage)  // 当前页码
        let pageSize = 10// 每页条数

        let allResponse = await goodscolomnModel.findAll({})
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let results = await goodscolomnModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            order: [['id', 'DESC']]
        })

        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results,
                totalPage: totalPage,
                currentPage: currentPage
            };
        } else {
            ctx.body = {
                code: 1,
                msg: "没有查询到内容",
                data: []
            };
        }
    }

    static async goodscategory(ctx) {
        let { currentPage } = ctx.query;
        currentPage = currentPage === undefined ? 1 : Number(currentPage)  // 当前页码
        let pageSize = 10// 每页条数

        let allResponse = await goodscategoryModel.findAll({})
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let results = await goodscategoryModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            order: [['id', 'DESC']]
        })

        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results,
                totalPage: totalPage,
                currentPage: currentPage
            };
        } else {
            ctx.body = {
                code: 1,
                msg: "没有查询到内容",
                data: []
            };
        }
    }

    static async mylist(ctx) {
        let { currentPage } = ctx.query;
        currentPage = currentPage === undefined ? 1 : Number(currentPage)  // 当前页码
        let pageSize = 8  // 每页条数

        let allResponse = await myModel.findAll({})
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let results = await myModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            order: [['id', 'ASC']]
        })
        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results,
                totalPage: totalPage,
                currentPage: currentPage
            };
        } else {
            ctx.body = {
                code: 801,
                msg: "没有查询到我的列表信息",
                data: []
            };
        }
    }

    static async all(ctx) {
        let include = [
            { model: goodscolomnModel},
        ]
        let results = await goodscategoryModel.findAll({
            include,
            order: [['id', 'DESC']],
            limit: 5
        })
        console.log(results);
        if (results.length > 0) {
            ctx.body = {
                code: 0,
                msg: "OK",
                data: results
            }
        } else {
            ctx.body = {
                code: 800,
                msg: "没数据",
                data: []
            }
        }
    }

    static async activities(ctx) {
        let { currentPage } = ctx.query;
        currentPage = currentPage === undefined ? 1 : Number(currentPage)  // 当前页码
        let pageSize = 4   // 每页条数

        let allResponse = await activitiesModel.findAll({})
        let total = allResponse.length // 全部条数
        let totalPage = Math.ceil(total / pageSize)   // 页数
        let results = await activitiesModel.findAll({
            offset: (currentPage - 1) * pageSize,
            limit: pageSize,
            order: [['id', 'ASC']]
        })
        if (results.length > 0) {
            ctx.body = {
                code: 1,
                msg: "OK",
                data: results
            };
        } else {
            ctx.body = {
                code: 801,
                msg: "没有查询到我的列表信息",
                data: []
            };
        }
    }

     // 会员登录和注册
  static async login(ctx) {
    let { mobile, password } = ctx.request.body;
    password = md5(password);
    // 是否已经存在手机号了
    let mobileRes = await userModel.findAll({ where:{mobile}});
    //console.log(mobileRes);
    if(mobileRes.length >0){
      // 登录
        var user = await userModel.findAll({ where: { mobile, password } });
        //console.log(user[0].mobile);
        if (user.length > 0) {
          let token = await createToken(user[0].mobile);
          ctx.body = {
            code: 1,
            msg: "登录成功",
            data: {
              user,
              token,
            },
          };
        } else {
          ctx.body = {
            code: 800,
            msg: "登录失败",
            data: [],
          };
        }
    }else{
       // 注册
       let username = Math.floor(Math.random(0,1)*9999) +'xyz'; //随机产生了一个用户名
       console.log(username);
       await userModel.create({
         username,
         password,
         mobile
       });
  
         var user = await userModel.findAll({ where: { mobile, password } });
         let token = await createToken(mobile);
         ctx.body = {
           code: 1,
           msg: "注册成功",
           data: {
             user,
             token,
           },
         };
    }
  }
  // 会员退出
  static async logout(ctx) {
    console.log(ctx.state);
    await createToken(ctx.state.mobile, -1);

    ctx.body = {
      code: 1,
      msg: "退出成功",
      data: [],
    };
  }

   // 获得课程信息
   static async getCourseDetail(ctx) {
    var id = ctx.params.id;
    // 通过课程编号找课程详情
    var result = await courseModel.findAll({ where: { id } });
    // a. 给图加域名 
    result[0].content = result[0].content.replace(/(<img.+?src=")(.*?)/,"$1"+'http://localhost:3000'+"$2");
    // b  找目录中指定课程中不是章而是节中第一个视频
    var result2 = await catlogModel.findAll({
      where: { courseId: id, [Op.not]: [{ pid: [0] }] }
    });
   
    let video_src = "";
    if (result2.length > 0) {
      video_src = result2[0].video_url;
    }
     let now = new Date().getTime();//时间戳
     console.log(now);
     let result3 = await couponModel.findAll({
       where: {
         from_time: {
           [Op.lt]: now
         },
         to_time: {
           [Op.gt]: now
         }
       },
     });
    let obj = Object.assign(  // 对象的合并
      {},
      {
        id: 3,
        title: result[0].title,
        // content: result[0].content,
        imgurl: result[0].imgurl,
        readCount: result[0].readCount,
        price: result[0].price,
        ori_price: result[0].ori_price,
        is_special: result[0].is_special,
        order: result[0].order,
        categoryId: result[0].categoryId
      },
      { video_src: video_src },
      { coupon: result3 }
    );
    if (result.length > 0) {
      ctx.body = {
        code: 1,
        msg: "OK",
        data: obj
      };
    } else {
      ctx.body = {
        code: 800,
        msg: "没有课程",
        data: [],
      };
    }
  }
  static async getCourseCatlog(ctx) {
    var id = ctx.params.id;
    var result = await catlogModel.findAll({ where: { courseId: id } });
   
    let catlogsP = [];
    for (let k in result) {
      // 先拿到 所有章
      if (result[k]["pid"] == 0) {
        catlogsP.push({
        title:result[k]["catlog_title"],
        id:result[k]["id"]})
      }
    }
    for (let k in catlogsP) {
      catlogsP[k].catlog = [];
      for (let j in result) {
        
        if (catlogsP[k]["id"] == result[j]["pid"]) {
          
          // 每章下的节
          catlogsP[k].catlog.push(result[j]);
        }
      }
    }
    ctx.body = {
      code: 1,
      msg: "OK",
      data: catlogsP,
    };
  }

  static async getVideoUrl(ctx){
     let id = ctx.params.catlogId;
		 //用户是否购买课程  此节课程是否可以试看
     let mobile = ctx.state.mobile; // token 登录可以拿到全局的用户信息的手机号
     let user= await userModel.findOne({where:{
       mobile:mobile
     },attriblutes:["id"]})
     
     let courseId = await catlogModel.findOne({where:{
       id
     },attriblutes:["courseId"]});

     let order = await course_orderModel.findOne({
      where:{
       user_id:user.id,
       courseId,
       is_pay:1
     }
     });
     //console.log('==============eihei============================');
     //console.log(user,courseId,order);
     //console.log('==============eihei============================');
		 let video = await catlogModel.findOne({where:{id}})
		 if(!order && !video.is_free){
       ctx.body = {
        code: 803,
        msg: "还没有购买课程不能看"
       }
		 }else{
        ctx.body = {
        code: 1,
        msg: "查询视频成功",
        data:{
          video_url:video.video_url
        }
       }
     }	
  }

  // 领取优惠卷
  static async  storeCoupon(ctx){
		let coupon_id = ctx.params.couponId;
    console.log(coupon_id)
    let mobile = ctx.state.mobile;
		let user = await userModel.findOne({where:{
       mobile:mobile
     },attriblutes:["id"]})
    let result = await coupon_userModel.create({
      userId:user.id,
      couponId:coupon_id
    });
		  	
    if (result) {
      ctx.body = {
        code: 1,
        msg: "领取成功"
      };
    } else {
      ctx.body = {
        code: 800,
        msg: "领取失败"
      };
    }
	}

  static async getCoupon(ctx){
      let mobile = ctx.state.mobile;
      let user = await userModel.findAll({where:{
       mobile:mobile
      },attriblutes:["id"]})
      console.log(mobile);
     
      let result = await coupon_userModel.findAll({where:{
       userId:user.id
      }
      })
      if (result.length>0) {
      ctx.body = {
        code: 1,
        msg: "查询优惠卷成功",
        data:result
      };
    } else {
      ctx.body = {
        code: 800,
        msg: "失败"
      };
    }

      
  }
  
  // 生成订单
  static async getPayCourse(ctx){
    // 1. 没有优惠劵的订单， 2有优惠劵的订单(过期还是没过去)
    let id = ctx.params.courseId;
    // (1)查询的课程
    let course = await courseModel.findOne({
      where: {
        id,
      },
      attriblutes: ["id", "course_title", "imgurl", "price"],
    });

    // (2) 用户信息
    let mobile = ctx.state.mobile;
    let user = await userModel.findOne({
      where: {
        mobile,
      },
      attriblutes: ["id"],
    });

    // (3) 可使用的优惠卷
    let couponInfo = await coupon_userModel.findAll({
      where: {
        userId: user.id,
        is_use: 0,
      },
      attriblutes: ["couponId"],
    });
    // console.log("================hello===========================")
    // console.log(course,user,couponInfo)
    // console.log("================helloend===========================")
    let order = {};
    order["user_id"] = user.id;
    order["courseId"] = id;
    order["order_no"] =
      new Date().getTime() + Math.floor(Math.random(10000, 99999));
    order["fee"] = course.price;
    order["coupon_id"] = 0;
   let resCourse = {
     id: course.id,
     imgurl: course.imgurl,
     ori_price: course.ori_price,
     price: course.price,
     title: course.title,
     readCount: course.readCount,
     coupon_id: 0,
     act_price: course.price,
     coupon_fee: order["coupon_id"],
     order_no: order.order_no
   };
    if (!couponInfo) {
      await course_orderModel.create(order);
      ctx.body = {
        code: 1,
        msg: "没优惠卷支付成功",
        data: resCourse, //返回
      };
    }

    let now = new Date().getTime();
    let couponA = [];
    for (let key in couponInfo) {
      let coupon = await couponModel.findOne({
        where: {
          id: couponInfo[key].couponId,
          from_time: {
            [Op.lt]: now,
          },
          to_time: {
            [Op.gt]: now,
          },
        },
      });
      couponA.push(coupon);
    }
    // every some
    let bigRange = couponA.every((item, index) => {
      return item.total_fee > course.price;
    });
    if (!couponA || bigRange) {
      //是否过期, 满额才能用的优惠卷判断
      await course_orderModel.create(order);
      ctx.body = {
        code: 1,
        msg: "优惠卷过期支付成功",
        data: course,
      };
    }
    let okRange = couponA.filter((item, index) => {
      return item.total_fee <= course.price;
    });

    let max = okRange.reduce(function (prev, cur) {
      return Math.max(prev.coupon.fee, cur.coupon.fee);
    });
    order["fee"] = course.price - max.coupon_fee;
    order["coupon_id"] = max.id;
    resCourse = {
      id: course.id,
      imgurl: course.imgurl,
      ori_price: course.ori_price,
      price: course.price,
      title: course.title,
      readCount: course.readCount,
      coupon_id: max.id,
      act_price: order.fee,
      coupon_fee: max.coupon_fee,
      order_no: order.order_no
    };
    
    await course_orderModel.create(order);
    ctx.body = {
      code: 1,
      msg: "有优惠卷支付成功",
      data: resCourse
    };
  } 
}
    




module.exports = apiController