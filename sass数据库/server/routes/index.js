const Router = require('koa-router')
const router = new Router()
const courseController = require('../controller/course')
const categoryController = require('../controller/category')
const swiperController = require('../controller/swiper')
const loginController = require('../controller/login')
const goodscolomnController = require('../controller/goodscolomn')
const goodscategoryController = require('../controller/goodscategory')
const myController = require('../controller/my')
const activitiesController = require('../controller/activities')
const couponController = require("../controller/coupon");
// 上传
const upload1 = require("../lib/uploadConfig");


// 上传
const upload = require("../lib/upload");

// 实现 富媒体编辑器 ueditor的上传配置， 安装 koa2-ueditor 模块 
const ueditor = require('koa2-ueditor');

router.all(
  "/editor/controller", // 在ueditor.config.js 中 serverUrl 配置一直  serverUrl: "/editor/controller"
  ueditor([
    "public",
    {
      imageAllowFiles: [".png", ".jpg", ".jpeg"],
      imagePathFormat: "/upload/ueditor/image/{yyyy}{mm}{dd}/{filename}",
    },
  ])
);
/*
  mvc  开发模式:

  m （model 对象模型: 数据库操作）
  v  (view 视图)

  c  ( controller 控制器: m，v的操作的增删改的操作 ， koa 中 router路由拿到 controller 类)

  router.get('/category/add',async function(ctx){
        .... 操作
  })
  改为:
  router.get('/category/add', categoryController.add);

*/

/* 首页 */

router.get('/',loginController.Index);

// 登录的页面
router.get('/login',loginController.login);
// 登录操作
router.post('/doLogin',loginController.doLogin);
// 退出登录
router.get('/logout',loginController.logout);
// 验证码接口
router.get('/code',loginController.code);


// 添加栏目
router.get('/admin/category/add', categoryController.add);
// 插入栏目数据
router.post('/admin/category/doadd', upload().single('imgurl'), categoryController.doadd);
// 栏目列表
router.get('/admin/category/', categoryController.list);
// 修改栏目页面
router.get('/admin/category/edit/:id',categoryController.edit);
// 修改栏目数据
router.post('/admin/category/doedit', upload().single('imgurl'),categoryController.doedit);
// 删除栏目
router.get('/admin/category/del/:id', categoryController.del);



// 发布文章
router.get('/admin/course/add',courseController.add);
// 插入文章数据
router.post('/admin/course/doadd', upload().single('imgurl'),courseController.doadd);
// 文章列表
router.get('/admin/course', courseController.list)
// 删除文章
router.get('/admin/course/del/:id', courseController.del);
// 编辑文章
router.get('/admin/course/edit/:id', courseController.edit);
// 修改文章的文本
router.post('/admin/course/doedit',upload().single('imgurl'), courseController.doedit)

// 添加章章节界面
router.get("/admin/course/chapter/:id", courseController.chapter);
// 执行添加章  /admin/course/saveChapter
router.post("/admin/course/saveChapter",courseController.saveChapter);
// 执行添加节  /admin/course/saveVideo
// router.post(
//   "/admin/course/saveVideo",
//   upload().single('video_url'),
//   courseController.saveVideo
// );

router.post('/admin/course/saveVideo', upload1.fields([
  {
    name: 'video_url',
    maxCount: 5
  }
  
]), courseController.saveVideo);

// 轮播图
router.get('/admin/swiper/add',swiperController.add);
// 插入轮播图
router.post('/admin/swiper/doadd', upload().single('imgurl'),swiperController.doadd);
// 轮播图列表
router.get('/admin/swiper', swiperController.list)
// 删除轮播图
router.get('/admin/swiper/del/:id', swiperController.del);
// 编辑轮播图
router.get('/admin/swiper/edit/:id', swiperController.edit);
// 修改轮播图
router.post('/admin/swiper/doedit',upload().single('imgurl'), swiperController.doedit)


// 添加商品列表
router.get('/admin/goodscolomn/add',goodscolomnController.add);
// 插入商品列表
// router.post('/admin/goodscolomn/doadd', upload.single('imgurl'),goodscolomnController.doadd);

router.post('/admin/goodscolomn/doadd', upload1.fields([
  {
    name: 'imgurl',
    maxCount: 5
  }
  
]),goodscolomnController.doadd);
// 商品列表
router.get('/admin/goodscolomn', goodscolomnController.list)
// 删除商品列表
router.get('/admin/goodscolomn/del/:id', goodscolomnController.del);
// 编辑商品列表
router.get('/admin/goodscolomn/edit/:id', goodscolomnController.edit);
// 修改商品列表
router.post('/admin/goodscolomn/doedit',upload().single('imgurl'), goodscolomnController.doedit)

// router.post('/admin/goodscolomn/doedit',upload.fields([{name:"imgurl",maxCount: 10}]), goodscolomnController.doedit)


// 添加商品
router.get('/admin/goodscategory/add',goodscategoryController.add);
// 插入商品
router.post('/admin/goodscategory/doadd', upload().single('imgurl'),goodscategoryController.doadd);
// 商品
router.get('/admin/goodscategory',goodscategoryController.list)
// 删除商品
router.get('/admin/goodscategory/del/:id', goodscategoryController.del);
// 编辑商品
router.get('/admin/goodscategory/edit/:id',goodscategoryController.edit);
// 修改商品
router.post('/admin/goodscategory/doedit',upload().single('imgurl'), goodscategoryController.doedit)


//我的
router.get('/admin/my/add',myController.add);
router.post('/admin/my/doadd', upload().single('imgurl'),myController.doadd);
router.get('/admin/my', myController.list)
router.get('/admin/my/del/:id', myController.del);
router.get('/admin/my/edit/:id', myController.edit);
router.post('/admin/my/doedit',upload().single('imgurl'), myController.doedit)

//我的活动
router.get('/admin/activities/add',activitiesController.add);
router.post('/admin/activities/doadd', upload().single('imgurl'),activitiesController.doadd);
// router.post('/admin/activities/doadd', upload1.fields([
//   {
//     name: 'imgurl',
//     maxCount: 5
//   }
  
// ]),activitiesController.doadd);
router.get('/admin/activities', activitiesController.list)
router.get('/admin/activities/del/:id', activitiesController.del);
router.get('/admin/activities/edit/:id', activitiesController.edit);
router.post('/admin/activities/doedit',upload().single('imgurl'), activitiesController.doedit)


// 添加优惠卷
router.get("/admin/coupon/add", couponController.add);
router.post("/admin/coupon/doadd", couponController.doadd);
// 栏目优惠卷
router.get("/admin/coupon/", couponController.list);
// 修改优惠卷
router.get("/admin/coupon/edit/:id", couponController.edit);
router.post("/admin/coupon/doedit", couponController.doedit);
// 删除优惠卷
router.get("/admin/coupon/del/:id", couponController.del);
module.exports = router