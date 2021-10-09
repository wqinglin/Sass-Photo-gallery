/*
 Navicat Premium Data Transfer

 Source Server         : sst
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : sass1

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 16/07/2021 09:23:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动主题',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动介绍',
  `imgurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动图像',
  `order` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES (1, 'PHOTO', '使用专业顶级的设备统一培训的摄影 师。给您全程微笑的服务希望带给您 一张极致的照片让一切舍不得忘掉的都 留下来。', '1625892610623474165.png', 0, '2021-07-10 04:50:10', '2021-07-10 04:50:57');
INSERT INTO `activities` VALUES (2, 'MAKEUP', '使用名牌化妆品所有化妆师经过专业培训windoc③型造饱满自信的状态,确保您的每一次上镜。', '1625892377906368270.png', 0, '2021-07-10 04:46:17', '2021-07-10 04:50:28');
INSERT INTO `activities` VALUES (3, 'DRESS', '我们定期清洗每一件服装确保干净整 洁带有清香。我们专业定制，确保服 装质量上乘，尺码齐全，样式丰富。', '1625892843814052489.png', 0, '2021-07-10 04:54:03', '2021-07-10 04:54:09');
INSERT INTO `activities` VALUES (4, 'PS', '每一个坐在您身边的修图师都经过专 业培训，当面确认您的需求，注重效 率与体验，Imac电脑修图，以确保最 优标准最高画质。', '1625893019840905753.png', 0, '2021-07-10 04:56:59', '2021-07-10 04:58:02');
INSERT INTO `activities` VALUES (5, 'service', '优选海马体工匠大师，经过全国统 一培训，形象气质俱佳，统一黑色 金LOGO衬衫，享受尊贵服务。', '1625896018074157526.jpg', 0, '2021-07-10 05:46:58', '2021-07-10 05:47:33');
INSERT INTO `activities` VALUES (6, 'SPACE', '刷新听觉嗅觉，顶级音响烘托，全 套BD5E室内音响系统， air aroma 室內香氛系统，专属海马体独有味道。', '1625895149117163767.png', 0, '2021-07-10 05:32:29', '2021-07-10 05:33:04');
INSERT INTO `activities` VALUES (7, 'MAKEUP', '配备一线大牌化妆品、热门化妆单 品， Dior CHanel、当、 Armani， 次性化妆用具，确保干净专一', '1625895199045554101.png', 0, '2021-07-10 05:33:19', '2021-07-10 05:33:38');
INSERT INTO `activities` VALUES (8, 'DRESS', '选用高端统一定制服装，尺码齐全， 服装定期送洗，高频率更新更换， 保证服装质感。', '1625893322889669827.png', 0, '2021-07-10 05:02:02', '2021-07-10 05:47:45');
INSERT INTO `activities` VALUES (9, '每周领福利', '宠粉社区', '1626229994711835933.png', 0, '2021-07-13 14:07:28', '2021-07-14 02:33:14');
INSERT INTO `activities` VALUES (10, '100%客照', '晚风呢喃，皆是情话', '1626230003398817526.png', 0, '2021-07-13 14:09:28', '2021-07-14 02:33:23');
INSERT INTO `activities` VALUES (11, '创业季大放送', '快门不止 创意不止', '1626230022437558257.png', 0, '2021-07-13 15:27:29', '2021-07-14 02:33:42');
INSERT INTO `activities` VALUES (12, '夏天了喂', '户外拍照才是正经事', '1626230030063018279.png', 0, '2021-07-13 15:29:11', '2021-07-14 02:33:50');
INSERT INTO `activities` VALUES (13, '放肆solo,去旅拍', '拍摄新体验+', '1626230037132882964.png', 0, '2021-07-13 15:30:38', '2021-07-14 02:33:57');
INSERT INTO `activities` VALUES (14, '音响灵感', '视觉上的高级感', '1626230050782155036.png', 0, '2021-07-13 15:32:27', '2021-07-14 02:34:10');
INSERT INTO `activities` VALUES (15, '寻“密”山城', '记录你的城市爱情~', '1626230056290267219.png', 0, '2021-07-13 15:35:28', '2021-07-14 02:34:16');
INSERT INTO `activities` VALUES (16, '万种风情 摩登年代', '往事不止回味', '1626230060817976459.png', 0, '2021-07-13 15:37:30', '2021-07-14 02:34:20');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `auth` tinyint(1) NULL DEFAULT 0 COMMENT '用户权限',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0, '2021-07-09 16:00:05', '2021-07-09 16:00:09');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图像',
  `order` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '连锁加盟', '1626245267780233447.png', 1, '2021-07-14 06:47:47', '2021-07-14 06:49:19');
INSERT INTO `category` VALUES (2, 'sass商城', '1626057253191340145.png', 2, '2021-07-12 02:34:13', '2021-07-12 02:34:13');
INSERT INTO `category` VALUES (3, '礼品卡', '1626057273325096794.png', 3, '2021-07-12 02:34:33', '2021-07-12 02:34:33');
INSERT INTO `category` VALUES (4, 'Sass大师', '1626057287465359249.png', 4, '2021-07-12 02:34:47', '2021-07-12 02:34:47');
INSERT INTO `category` VALUES (5, '企业服务', '1626057308949830070.png', 5, '2021-07-12 02:35:08', '2021-07-12 02:35:08');
INSERT INTO `category` VALUES (6, 'Sass儿童', '1626057324637916363.png', 6, '2021-07-12 02:35:24', '2021-07-12 02:35:24');
INSERT INTO `category` VALUES (7, 'Sass家庭', '1626057342372373337.png', 7, '2021-07-12 02:35:42', '2021-07-12 02:35:42');
INSERT INTO `category` VALUES (8, 'Sass', '1626057353740755855.png', 8, '2021-07-12 02:35:53', '2021-07-12 02:35:53');

-- ----------------------------
-- Table structure for catlog
-- ----------------------------
DROP TABLE IF EXISTS `catlog`;
CREATE TABLE `catlog`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '目录编号',
  `catlog_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录标题',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '目录父',
  `is_free` int(3) NOT NULL DEFAULT 0 COMMENT '是否免费',
  `video_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '目录节视频',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `courseId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courseId`(`courseId`) USING BTREE,
  CONSTRAINT `catlog_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of catlog
-- ----------------------------
INSERT INTO `catlog` VALUES (4, '毕业照', 0, 0, '', '2021-07-13 06:28:02', '2021-07-13 06:28:02', 1);
INSERT INTO `catlog` VALUES (5, '舍友搞笑风', 4, 0, '1626157725339.png,1626157725342.png', '2021-07-13 06:28:45', '2021-07-13 06:28:45', 1);
INSERT INTO `catlog` VALUES (6, '写实类', 0, 0, '', '2021-07-13 06:28:50', '2021-07-13 06:28:50', 1);
INSERT INTO `catlog` VALUES (7, '写实照', 6, 0, '1626157753315.png,1626157753316.png,1626157753316.png', '2021-07-13 06:29:13', '2021-07-13 06:29:13', 1);
INSERT INTO `catlog` VALUES (8, '封面照', 0, 0, '', '2021-07-13 06:29:23', '2021-07-13 06:29:23', 1);
INSERT INTO `catlog` VALUES (9, '形象照', 8, 0, '1626157808388.png', '2021-07-13 06:30:08', '2021-07-13 06:30:08', 1);
INSERT INTO `catlog` VALUES (10, '精致证件照', 0, 0, '', '2021-07-13 06:30:56', '2021-07-13 06:30:56', 1);
INSERT INTO `catlog` VALUES (11, '证件照', 10, 0, '1626157883654.png,1626157883655.png,1626157883655.png', '2021-07-13 06:31:23', '2021-07-13 06:31:23', 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `course_id` int(10) NOT NULL COMMENT '课程编号',
  `rate` int(3) NOT NULL DEFAULT 1 COMMENT '评分',
  `anonymous` int(3) NOT NULL COMMENT '是否匿名',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程内容',
  `imgurls` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图像',
  `video_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '视频',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `coupon_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠卷名',
  `coupon_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `total_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '满多少可用',
  `from_time` bigint(20) NOT NULL COMMENT '开始时间',
  `to_time` bigint(20) NOT NULL COMMENT '结束时间',
  `is_on` int(3) NOT NULL DEFAULT 1 COMMENT '上架下架',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES (1, 'sass大师馆满减', 12.00, 200.00, 1625443200000, 1629763200000, 1, '2021-07-13 02:08:15', '2021-07-13 02:08:15');

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `is_use` int(3) NOT NULL DEFAULT 0 COMMENT '是否使用',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `couponId` int(10) NULL DEFAULT NULL,
  `userId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_user_couponId_userId_unique`(`couponId`, `userId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `coupon_user_ibfk_1` FOREIGN KEY (`couponId`) REFERENCES `coupon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coupon_user_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程内容介绍',
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面',
  `readCount` int(10) NULL DEFAULT 0 COMMENT '购买人数',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '打折价格',
  `ori_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `is_special` int(3) NULL DEFAULT 0 COMMENT '推荐课程',
  `is_on` int(3) NULL DEFAULT 1 COMMENT '上架或下架',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categoryId`(`categoryId`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '写实类', '', '1626057457418543978.png', 3423, 399.00, 599.00, 0, 1, 0, '2021-07-12 02:37:37', '2021-07-16 00:53:46', 8);
INSERT INTO `course` VALUES (2, '精品证件照', '', '1626396993961902046.png', 888888, 99.00, 88.00, 0, 1, 0, '2021-07-16 00:56:33', '2021-07-16 00:56:33', 8);
INSERT INTO `course` VALUES (3, '职业形象照', '', '1626397091693693728.png', 234, 299.00, 666.00, 0, 1, 0, '2021-07-16 00:58:11', '2021-07-16 00:58:11', 8);
INSERT INTO `course` VALUES (4, '大师臻选', '', '1626397127269602523.png', 3423, 3994.00, 5555.00, 0, 1, 0, '2021-07-16 00:58:47', '2021-07-16 00:58:47', 4);
INSERT INTO `course` VALUES (5, '花颜照', '', '1626397162090663658.png', 3423, 599.00, 666.00, 0, 1, 0, '2021-07-16 00:59:22', '2021-07-16 00:59:22', 4);
INSERT INTO `course` VALUES (6, '轻婚纱', '', '1626397187994152316.png', 6666, 5999.00, 8888.00, 0, 1, 0, '2021-07-16 00:59:47', '2021-07-16 00:59:47', 4);
INSERT INTO `course` VALUES (7, 'MH婚纱', '', '1626397225157537609.jpg', 888888, 4999.00, 5555.00, 0, 1, 0, '2021-07-16 01:00:25', '2021-07-16 01:00:25', 4);
INSERT INTO `course` VALUES (8, '宇航员', '', '1626397254013062877.png', 5555, 566.00, 899.00, 0, 1, 0, '2021-07-16 01:00:54', '2021-07-16 01:00:54', 6);
INSERT INTO `course` VALUES (9, '生日照', '', '1626397272847868349.png', 234, 399.00, 444.00, 0, 1, 0, '2021-07-16 01:01:12', '2021-07-16 01:01:12', 6);
INSERT INTO `course` VALUES (10, '宝贝照', '', '1626397300723098171.png', 234, 599.00, 777.00, 0, 1, 0, '2021-07-16 01:01:40', '2021-07-16 01:01:40', 6);
INSERT INTO `course` VALUES (11, '亲子照', '', '1626397331644967734.png', 568, 699.00, 888.00, 0, 1, 0, '2021-07-16 01:02:11', '2021-07-16 01:02:11', 7);
INSERT INTO `course` VALUES (12, '全家福', '', '1626397352518715122.png', 568, 599.00, 5555.00, 0, 1, 0, '2021-07-16 01:02:32', '2021-07-16 01:02:32', 7);
INSERT INTO `course` VALUES (13, '温暖下午茶', '', '1626397388687995530.png', 3423, 599.00, 5555.00, 0, 1, 0, '2021-07-16 01:03:08', '2021-07-16 01:03:08', 7);
INSERT INTO `course` VALUES (14, '银饰', '', '1626397459234280560.png', 234, 111.00, 2222.00, 0, 1, 0, '2021-07-16 01:04:19', '2021-07-16 01:04:19', 2);
INSERT INTO `course` VALUES (15, '相框', '', '1626397476289068661.png', 234, 44.00, 99.00, 0, 1, 0, '2021-07-16 01:04:36', '2021-07-16 01:04:36', 2);
INSERT INTO `course` VALUES (16, '连锁加盟', '', '1626397519588867773.png', 88, 199999.00, 0.00, 0, 1, 0, '2021-07-16 01:05:19', '2021-07-16 01:05:19', 1);

-- ----------------------------
-- Table structure for course_order
-- ----------------------------
DROP TABLE IF EXISTS `course_order`;
CREATE TABLE `course_order`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户编号',
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `coupon_id` int(10) NULL DEFAULT NULL COMMENT '代金劵编号',
  `fee` decimal(10, 2) NOT NULL COMMENT '支付总价',
  `is_pay` int(4) NOT NULL DEFAULT 0 COMMENT '是否支付',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `is_comment` int(3) NOT NULL DEFAULT 0 COMMENT '是否评论',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `courseId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courseId`(`courseId`) USING BTREE,
  CONSTRAINT `course_order_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_order
-- ----------------------------

-- ----------------------------
-- Table structure for goodscategory
-- ----------------------------
DROP TABLE IF EXISTS `goodscategory`;
CREATE TABLE `goodscategory`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品封面',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品内容介绍',
  `readCount` int(10) NULL DEFAULT 0 COMMENT '购买人数',
  `ori_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '打折价格',
  `is_special` int(3) NULL DEFAULT 0 COMMENT '推荐课程',
  `is_on` int(3) NULL DEFAULT 1 COMMENT '上架或下架',
  `order` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodscategory
-- ----------------------------

-- ----------------------------
-- Table structure for goodscolomn
-- ----------------------------
DROP TABLE IF EXISTS `goodscolomn`;
CREATE TABLE `goodscolomn`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品栏目',
  `imgurl` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品栏目图像',
  `order` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodscolomn
-- ----------------------------

-- ----------------------------
-- Table structure for my
-- ----------------------------
DROP TABLE IF EXISTS `my`;
CREATE TABLE `my`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons` int(11) NULL DEFAULT 0 COMMENT '优惠券',
  `mark` int(11) NULL DEFAULT 0 COMMENT '纪念值',
  `medal` int(11) NULL DEFAULT 0 COMMENT '勋章',
  `gift` int(11) NULL DEFAULT 0 COMMENT '礼品卡',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关于我们',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my
-- ----------------------------
INSERT INTO `my` VALUES (1, 0, 0, 0, 0, '个人资料', '1626058239319739727.png', 0, '2021-07-12 02:50:39', '2021-07-12 02:50:39');
INSERT INTO `my` VALUES (2, 0, 0, 0, 0, '我的相册', '1626058260235155132.png', 0, '2021-07-12 02:51:00', '2021-07-12 02:51:00');
INSERT INTO `my` VALUES (3, 0, 0, 0, 0, '修改密码', '1626058307895402783.png', 0, '2021-07-12 02:51:47', '2021-07-12 02:51:47');
INSERT INTO `my` VALUES (4, 0, 0, 0, 0, '开票中心', '1626058335922224511.png', 0, '2021-07-12 02:52:15', '2021-07-12 02:52:15');
INSERT INTO `my` VALUES (5, 0, 0, 0, 0, '标准服务', '1626058492784589979.png', 0, '2021-07-12 02:52:44', '2021-07-12 02:54:52');
INSERT INTO `my` VALUES (6, 0, 0, 0, 0, '照片剪辑', '1626058447343302396.png', 0, '2021-07-12 02:54:07', '2021-07-12 02:55:28');
INSERT INTO `my` VALUES (7, 0, 0, 0, 0, '意见反馈', '1626058559688445992.png', 0, '2021-07-12 02:55:59', '2021-07-12 02:55:59');
INSERT INTO `my` VALUES (8, 0, 0, 0, 0, '关于我们', '1626058574741815546.png', 0, '2021-07-12 02:56:14', '2021-07-12 02:56:14');
INSERT INTO `my` VALUES (9, 0, 0, 0, 0, '修改电子尺寸', '1626230179683799571.png', 0, '2021-07-14 00:35:45', '2021-07-14 02:36:19');
INSERT INTO `my` VALUES (10, 0, 0, 0, 0, '纪念币奖励', '1626230162780224808.png', 0, '2021-07-13 16:37:48', '2021-07-14 02:36:26');
INSERT INTO `my` VALUES (11, 0, 0, 0, 0, '免费升级体验', '1626230197380239266.png', 0, '2021-07-13 16:38:06', '2021-07-14 02:36:37');
INSERT INTO `my` VALUES (12, 0, 0, 0, 0, '生日专项', '1626230205932213131.png', 0, '2021-07-13 16:38:24', '2021-07-14 02:36:45');
INSERT INTO `my` VALUES (13, 0, 0, 0, 0, '专属预约服务', '1626230212537160049.png', 0, '2021-07-13 16:38:47', '2021-07-14 02:36:52');
INSERT INTO `my` VALUES (14, 0, 0, 0, 0, '加急修片', '1626230221921426023.png', 0, '2021-07-13 16:39:01', '2021-07-14 02:37:01');
INSERT INTO `my` VALUES (15, 0, 0, 0, 0, '美学生活礼遇', '1626230231784160393.png', 0, '2021-07-13 16:39:24', '2021-07-14 02:37:11');
INSERT INTO `my` VALUES (16, 0, 0, 0, 0, '', '1626230342766038110.png', 0, '2021-07-14 00:50:18', '2021-07-14 02:39:02');
INSERT INTO `my` VALUES (17, 0, 0, 0, 0, '修改电子尺寸', '1626230351574092100.png', 0, '2021-07-14 00:52:53', '2021-07-14 02:39:11');
INSERT INTO `my` VALUES (18, 0, 0, 0, 0, '纪念值奖励', '1626230358628467730.png', 0, '2021-07-14 00:53:26', '2021-07-14 02:39:18');
INSERT INTO `my` VALUES (19, 0, 0, 0, 0, '免费升级体验', '1626230366713287180.png', 0, '2021-07-14 00:53:43', '2021-07-14 02:39:26');
INSERT INTO `my` VALUES (20, 0, 0, 0, 0, '生日专享', '1626230375074740531.png', 0, '2021-07-14 00:54:09', '2021-07-14 02:39:35');
INSERT INTO `my` VALUES (21, 0, 0, 0, 0, '专属预约服务', '1626230390094920111.png', 0, '2021-07-14 00:54:23', '2021-07-14 02:39:50');
INSERT INTO `my` VALUES (22, 0, 0, 0, 0, '加急修片', '1626230396772825985.png', 0, '2021-07-14 00:54:37', '2021-07-14 02:39:56');
INSERT INTO `my` VALUES (23, 0, 0, 0, 0, '美学生活礼遇', '1626230405089430678.png', 0, '2021-07-14 00:55:11', '2021-07-14 02:40:05');
INSERT INTO `my` VALUES (24, 0, 0, 0, 0, '', '1626230411433120968.png', 0, '2021-07-14 00:55:27', '2021-07-14 02:40:11');
INSERT INTO `my` VALUES (25, 0, 0, 0, 0, '修改电子尺寸', '1626230436515373911.png', 0, '2021-07-14 00:55:53', '2021-07-14 02:40:36');
INSERT INTO `my` VALUES (26, 0, 0, 0, 0, '纪念值奖励', '1626230448954679946.png', 0, '2021-07-14 00:56:06', '2021-07-14 02:40:48');
INSERT INTO `my` VALUES (27, 0, 0, 0, 0, '免费升级体验', '1626230482762523687.png', 0, '2021-07-14 00:56:24', '2021-07-14 02:41:22');
INSERT INTO `my` VALUES (28, 0, 0, 0, 0, '生日专享', '1626230472407427665.png', 0, '2021-07-14 00:56:45', '2021-07-14 02:41:12');
INSERT INTO `my` VALUES (29, 0, 0, 0, 0, '专属预约服务', '1626230491030719884.png', 0, '2021-07-14 00:56:59', '2021-07-14 02:41:31');
INSERT INTO `my` VALUES (30, 0, 0, 0, 0, '加急修片', '1626230498092268702.png', 0, '2021-07-14 00:57:13', '2021-07-14 02:41:38');
INSERT INTO `my` VALUES (31, 0, 0, 0, 0, '美学生活礼遇', '1626230506256417205.png', 0, '2021-07-14 00:57:30', '2021-07-14 02:41:46');
INSERT INTO `my` VALUES (32, 0, 0, 0, 0, '', '1626230513203089543.png', 0, '2021-07-14 00:57:49', '2021-07-14 02:41:53');
INSERT INTO `my` VALUES (33, 0, 0, 0, 0, '修改电子尺寸', '1626230724796465199.png', 0, '2021-07-14 00:58:21', '2021-07-14 02:45:24');
INSERT INTO `my` VALUES (34, 0, 0, 0, 0, '纪念值奖励', '1626230731727406714.png', 0, '2021-07-14 00:58:42', '2021-07-14 02:45:31');
INSERT INTO `my` VALUES (35, 0, 0, 0, 0, '免费升级体验', '1626230742571064335.png', 0, '2021-07-14 00:59:00', '2021-07-14 02:45:42');
INSERT INTO `my` VALUES (36, 0, 0, 0, 0, '生日专享', '1626230751352790129.png', 0, '2021-07-14 00:59:24', '2021-07-14 02:45:51');
INSERT INTO `my` VALUES (37, 0, 0, 0, 0, '专属预约服务', '1626230758134189627.png', 0, '2021-07-14 00:59:40', '2021-07-14 02:45:58');
INSERT INTO `my` VALUES (38, 0, 0, 0, 0, '加急修片', '1626230765918416773.png', 0, '2021-07-14 01:00:31', '2021-07-14 02:46:05');
INSERT INTO `my` VALUES (39, 0, 0, 0, 0, '美学生活礼遇', '1626230772855018132.png', 0, '2021-07-14 01:00:56', '2021-07-14 02:46:12');
INSERT INTO `my` VALUES (40, 0, 0, 0, 0, '', '1626230777270332752.png', 0, '2021-07-14 01:04:15', '2021-07-14 02:46:17');

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '连接',
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图像',
  `order` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES (1, '首页轮播1', 'www.baidu.com', '1626057102797825034.png', 0, '2021-07-09 08:04:58', '2021-07-12 02:31:42');
INSERT INTO `swiper` VALUES (2, '轮播图2', 'www.baidu.com', '1626057124801124061.png', 0, '2021-07-12 02:32:04', '2021-07-12 02:32:04');
INSERT INTO `swiper` VALUES (3, '轮播图3', 'www.baidu.com', '1626057133175695624.png', 0, '2021-07-12 02:32:13', '2021-07-12 02:32:13');
INSERT INTO `swiper` VALUES (4, '轮播图4', 'www.baidu.com', '1626057145989305225.png', 0, '2021-07-12 02:32:25', '2021-07-12 02:32:25');
INSERT INTO `swiper` VALUES (5, '轮播图5', 'www.baidu.com', '1626057159468372482.png', 0, '2021-07-12 02:32:39', '2021-07-12 02:32:39');
INSERT INTO `swiper` VALUES (6, '轮播图6', 'www.baidu.com', '1626057169127402388.png', 0, '2021-07-12 02:32:49', '2021-07-12 02:32:49');
INSERT INTO `swiper` VALUES (7, '轮播图7', 'www.baidu.com', '1626057175930362297.png', 0, '2021-07-12 02:32:55', '2021-07-12 02:32:55');
INSERT INTO `swiper` VALUES (8, '轮播图8', 'www.baidu.com', '1626057193921990090.png', 0, '2021-07-12 02:33:13', '2021-07-12 02:33:13');
INSERT INTO `swiper` VALUES (9, '商品1', 'www.baidu.com', '1626096529047360039.png', 0, '2021-07-12 13:28:49', '2021-07-12 13:28:49');
INSERT INTO `swiper` VALUES (10, '商品二', 'www.baidu.com', '1626096542648347555.png', 0, '2021-07-12 13:29:02', '2021-07-12 13:29:02');
INSERT INTO `swiper` VALUES (11, '商品3', 'www.baidu.com', '1626096560210337725.png', 0, '2021-07-12 13:29:20', '2021-07-12 13:29:20');
INSERT INTO `swiper` VALUES (12, '商品4', 'www.baidu.com', '1626096687054324474.png', 0, '2021-07-12 13:31:27', '2021-07-12 13:31:27');
INSERT INTO `swiper` VALUES (13, '写实类', 'www.baidu.com', '1626097210600812756.png', 0, '2021-07-12 13:40:10', '2021-07-12 13:40:10');
INSERT INTO `swiper` VALUES (14, '写实类1', 'www.baidu.com', '1626097232976389597.png', 0, '2021-07-12 13:40:32', '2021-07-12 13:40:32');
INSERT INTO `swiper` VALUES (15, '写实类2', 'www.baidu.com', '1626097262375917840.png', 0, '2021-07-12 13:41:02', '2021-07-12 13:41:02');
INSERT INTO `swiper` VALUES (16, '大师1', 'www.baidu.com', '1626098174391079468.png', 0, '2021-07-12 13:56:14', '2021-07-12 13:56:14');
INSERT INTO `swiper` VALUES (17, '大师2', 'www.baidu.com', '1626098203809557907.png', 0, '2021-07-12 13:56:43', '2021-07-12 13:56:43');
INSERT INTO `swiper` VALUES (18, '大师3', 'www.baidu.com', '1626098237736272034.jpg', 0, '2021-07-12 13:57:17', '2021-07-12 13:57:17');
INSERT INTO `swiper` VALUES (19, '大师4', 'www.baidu.com', '1626098257166595317.png', 0, '2021-07-12 13:57:37', '2021-07-12 13:57:37');
INSERT INTO `swiper` VALUES (20, '全家福1', 'www.baidu.com', '1626098849417313190.png', 0, '2021-07-12 14:07:29', '2021-07-12 14:07:29');
INSERT INTO `swiper` VALUES (21, '全家福2', 'www.baidu.com', '1626098865656206281.png', 0, '2021-07-12 14:07:45', '2021-07-12 14:07:45');
INSERT INTO `swiper` VALUES (22, '宝贝照', 'www.baidu.com', '1626099314724302504.png', 0, '2021-07-12 14:15:14', '2021-07-12 14:15:14');
INSERT INTO `swiper` VALUES (23, '宝贝照1', 'www.baidu.com', '1626099342484863598.png', 0, '2021-07-12 14:15:42', '2021-07-12 14:15:42');
INSERT INTO `swiper` VALUES (24, '宝贝照2', 'www.baidu.com', '1626099356542728962.png', 0, '2021-07-12 14:15:56', '2021-07-12 14:15:56');
INSERT INTO `swiper` VALUES (25, '宝贝照3', 'www.baidu.com', '1626099371567565178.png', 0, '2021-07-12 14:16:11', '2021-07-12 14:16:11');
INSERT INTO `swiper` VALUES (26, '商城', 'www.baidu.com', '1626099697480380517.png', 0, '2021-07-12 14:21:37', '2021-07-12 14:21:37');
INSERT INTO `swiper` VALUES (27, '商城1', 'www.baidu.com', '1626099711943312015.png', 0, '2021-07-12 14:21:51', '2021-07-12 14:21:51');
INSERT INTO `swiper` VALUES (28, '商城3', 'www.baidu.com', '1626099730317674919.png', 0, '2021-07-12 14:22:10', '2021-07-12 14:22:10');
INSERT INTO `swiper` VALUES (29, '商城', 'www.baidu.com', '1626099740829092705.png', 0, '2021-07-12 14:22:20', '2021-07-12 14:22:20');
INSERT INTO `swiper` VALUES (30, '商城5', 'www.baidu.com', '1626099754131046261.png', 0, '2021-07-12 14:22:34', '2021-07-12 14:22:34');
INSERT INTO `swiper` VALUES (31, '商城', 'www.baidu.com', '1626099891098177252.png', 0, '2021-07-12 14:24:51', '2021-07-12 14:24:51');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` enum('男','女','保密') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '头像',
  `avatar` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://img4.imgtn.bdimg.com/it/u=198369807,133263955&fm=27&gp=0.jpg' COMMENT '头像',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '3732xyz', '827ccb0eea8a706c4c34a16891f84e7b', '123', NULL, '男', 'http://img4.imgtn.bdimg.com/it/u=198369807,133263955&fm=27&gp=0.jpg', '2021-07-14 02:49:23', '2021-07-14 02:49:23');
INSERT INTO `user` VALUES (2, '4042xyz', '54fda78aa8a09b4d77b5aaec57b75028', '1323', NULL, '男', 'http://img4.imgtn.bdimg.com/it/u=198369807,133263955&fm=27&gp=0.jpg', '2021-07-14 03:36:06', '2021-07-14 03:36:06');
INSERT INTO `user` VALUES (3, '2322xyz', '5cbb0599f146cecd3df3355e9c007888', '12345', NULL, '男', 'https://z3.ax1x.com/2021/07/14/WVjYZj.png', '2021-07-14 06:17:31', '2021-07-14 06:17:31');
INSERT INTO `user` VALUES (4, '7666xyz', '827ccb0eea8a706c4c34a16891f84e7b', '2322xyz', NULL, '男', 'https://z3.ax1x.com/2021/07/14/WVjYZj.png', '2021-07-14 07:40:06', '2021-07-14 07:40:06');

SET FOREIGN_KEY_CHECKS = 1;
