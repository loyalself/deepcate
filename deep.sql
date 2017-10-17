/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : deep

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-10-17 16:10:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for deepcate
-- ----------------------------
DROP TABLE IF EXISTS `deepcate`;
CREATE TABLE `deepcate` (
  `id` int(11) NOT NULL COMMENT '自己本身的id',
  `pid` int(10) unsigned NOT NULL COMMENT '自己的父id，看看自己上面是否还有人',
  `catename` varchar(200) NOT NULL,
  `cateorder` int(11) DEFAULT '0' COMMENT '排列顺序',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='这个主要用于实现无限级分类';

-- ----------------------------
-- Records of deepcate
-- ----------------------------
INSERT INTO `deepcate` VALUES ('1', '0', '新闻', '0', '2017-09-14 10:10:34', '2017-09-14 10:10:37');
INSERT INTO `deepcate` VALUES ('2', '0', '电器', '0', '2017-09-14 10:10:41', '2017-09-14 10:10:40');
INSERT INTO `deepcate` VALUES ('3', '1', '国内新闻', '0', '2017-09-14 10:10:50', '2017-09-14 10:10:48');
INSERT INTO `deepcate` VALUES ('4', '1', '国际新闻', '0', '2017-09-14 10:10:53', '2017-09-14 10:10:55');
INSERT INTO `deepcate` VALUES ('5', '3', '内地新闻', '0', '2017-09-14 10:11:00', '2017-09-14 10:10:58');
INSERT INTO `deepcate` VALUES ('6', '2', '家用电器', '0', '2017-09-14 10:11:03', '2017-09-14 10:11:05');
INSERT INTO `deepcate` VALUES ('7', '2', '智能设备', '0', '2017-09-14 10:11:10', '2017-09-14 10:11:12');
INSERT INTO `deepcate` VALUES ('8', '4', '美国新闻', '0', '2017-09-14 10:11:13', '2017-09-14 10:11:17');
INSERT INTO `deepcate` VALUES ('9', '7', '苹果设备', '0', '2017-09-14 10:11:20', '2017-09-14 10:11:21');
INSERT INTO `deepcate` VALUES ('10', '9', '苹果手机', '0', '2017-09-14 18:17:42', '2017-09-14 18:17:44');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
