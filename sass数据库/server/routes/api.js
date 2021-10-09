const Router = require('koa-router')
const router = new Router()
const apiController = require('../controller/api');
const upload = require("../lib/uploadConfig");

// 轮播图接口
router.get('/api/getswiper', apiController.getswiper);

//各拿各的
// 1.分类接口
router.get('/api/cates', apiController.cates);
// 2.通过分类编号查询对应商品
router.get("/api/goodsbycateId/:cateId", apiController.goodsbycateId);



// 商品推荐接口
router.get('/api/recommend', apiController.recommend);


//联合信息
// 查询所有分类下对应的前5条数据 catesAndGoods
router.get('/api/catesAndGoods', apiController.catesAndGoods);

// 商品详情页   注和通过分类编号查询到的一样 13行=25行 但本质不一样
router.get('/api/goodsDetail/:id',apiController.goodDetail);
// 课程详情 (包含价格的详细介绍)
router.get("/api/getCourseDetail/:id", apiController.getCourseDetail);
//章节等分类信息    11111
router.get("/api/getCourseCatlog/:id", apiController.getCourseCatlog);

router.post('/api/upload',upload.single('uploadfiles_img'), apiController.upload);





// 搜索接口  通过课程名称去那商品信息 13 = 25 =34
router.get('/api/search/:keyword',apiController.search);

//商品分类
router.get('/api/goodscolomn/:conlomnId',apiController.goodscolomn);
//商品列表
router.get('/api/goodscategory/:categoryId',apiController.goodscategory);
//查询所有数据
router.get('/api/all',apiController.all);
//我的列表信息
router.get('/api/mylist', apiController.mylist);
//活动信息
router.get('/api/activities', apiController.activities);
//登录
router.post("/api/login", apiController.login);
//退出
router.post("/api/logout", apiController.logout);

router.post("/api/getVideoUrl/:catlogId", apiController.getVideoUrl);
//storeCoupon
router.post("/api/storeCoupon/:couponId", apiController.storeCoupon);
router.post("/api/getCoupon", apiController.getCoupon);
//getPayCourse
router.post("/api/getPayCourse/:courseId", apiController.getPayCourse);

module.exports = router