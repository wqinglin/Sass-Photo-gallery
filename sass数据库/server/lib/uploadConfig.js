//  uploadConfig.js 文件夹
const multer = require("koa-multer");

const Koa = require('koa');
const Router = require('@koa/router');
const multer1 = require('@koa/multer');

const app = new Koa();
const router = new Router();
const upload1 = multer1();

router.post(
  'public/upload/',
  upload1.fields([
    {
      name: 'imgurl',
      maxCount: 3,
      limits: {
        fileSize:{
          fileSize: 1024 * 1024, 
        }
    }
  }
  ]),
);
app.use(router.routes());
app.use(router.allowedMethods());

let storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "public/upload/"); // 储存到 public/images文件夹里
  },
  //修改文件名称
  filename: function (req, file, cb) {
    let fileFormat = file.originalname.split("."); //以点分割成数组，数组的最后一项就是后缀名
    cb(null,  Date.now() + "." + fileFormat[fileFormat.length - 1]);
  },
});

let upload = multer({
  storage: storage,
  limits: {
    fileSize: (1024 * 1024) / 2, // 限制512KB
  },
});

module.exports = upload;
