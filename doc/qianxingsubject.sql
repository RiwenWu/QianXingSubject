/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : qianxingsubject
Target Host     : localhost:3306
Target Database : qianxingsubject
Date: 2017-09-10 17:58:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_nicename` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `admin_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'wrw', '123456', '流天姬', '', '2017-08-25 18:11:35', '0');
INSERT INTO `admin` VALUES ('37', 'admin', '123456', 'admin', '', '2017-09-09 23:18:53', '1');
INSERT INTO `admin` VALUES ('38', 'test1', '123456', 'test1', '', '2017-09-09 23:29:15', '1');
INSERT INTO `admin` VALUES ('39', 'test2', '123456', 'test2', '', '2017-09-10 14:47:08', '1');
INSERT INTO `admin` VALUES ('40', 'test3', '123456', 'test3', '', '2017-09-10 15:50:04', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `role_desc` varchar(1000) DEFAULT NULL,
  `role_createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '一般管理员', '几乎没什么权限', '2017-09-02 20:39:12');
INSERT INTO `role` VALUES ('2', '管理员', null, '2017-09-02 20:39:52');
INSERT INTO `role` VALUES ('3', '超级管理员', '超级了，还用说明吗', '2017-09-03 16:37:45');

-- ----------------------------
-- Table structure for tb_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_role`;
CREATE TABLE `tb_admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_admin_role_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `tb_admin_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin_role
-- ----------------------------
INSERT INTO `tb_admin_role` VALUES ('1', '1', '3');
INSERT INTO `tb_admin_role` VALUES ('26', '37', '2');
INSERT INTO `tb_admin_role` VALUES ('27', '38', '1');
INSERT INTO `tb_admin_role` VALUES ('28', '39', '1');
INSERT INTO `tb_admin_role` VALUES ('29', '40', '1');
