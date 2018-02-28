/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : pdca

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2015-04-30 11:36:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `t_bulletin`;
CREATE TABLE `t_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(150) DEFAULT NULL,
  `publishTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`user_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bulletin
-- ----------------------------
INSERT INTO `t_bulletin` VALUES ('1', '1', '公告测试', '2014-12-25 17:57:32');
INSERT INTO `t_bulletin` VALUES ('2', '1', '今天都给我叫过来', '2015-04-29 10:27:56');
INSERT INTO `t_bulletin` VALUES ('3', '1', '今天天气真好啊！', '2015-04-30 08:51:43');
INSERT INTO `t_bulletin` VALUES ('4', '1', '为了更美好的明天而战', '2015-04-30 08:52:03');
INSERT INTO `t_bulletin` VALUES ('5', '1', '川寒西岭千秋雪', '2015-04-30 08:52:44');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `depId` int(11) NOT NULL AUTO_INCREMENT,
  `depName` varchar(255) NOT NULL,
  `depDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`depId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', '稽查部', '稽查企业和单位和个人');
INSERT INTO `t_department` VALUES ('2', '教育部', '负责相关教育工作');
INSERT INTO `t_department` VALUES ('3', '人事部', '负责招生工作');
INSERT INTO `t_department` VALUES ('4', '财政部', '负责相关财务工作');
INSERT INTO `t_department` VALUES ('5', '监督部', '负责部门的监督工作');
INSERT INTO `t_department` VALUES ('6', '武装部', '负责保卫科工作');
INSERT INTO `t_department` VALUES ('7', '44', 'ww');
INSERT INTO `t_department` VALUES ('8', 'dddd', 'ddddd');

-- ----------------------------
-- Table structure for t_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_doc`;
CREATE TABLE `t_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docName` varchar(255) NOT NULL,
  `docType` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_doc
-- ----------------------------
INSERT INTO `t_doc` VALUES ('33', 'cc.jpg', 'P');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`user_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', '关于改革计划', '改革计划', '2015-01-15 00:00:00', '1');
INSERT INTO `t_project` VALUES ('2', 'g', 'g', '2015-01-28 00:00:00', '1');
INSERT INTO `t_project` VALUES ('3', 'yu', 'yu', '2015-01-28 00:00:00', '1');
INSERT INTO `t_project` VALUES ('4', 'addsd', 'asdffg', '2015-04-30 00:00:00', '1');
INSERT INTO `t_project` VALUES ('5', '测试项目', '测试项目', '2015-04-30 00:00:00', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(30) DEFAULT NULL,
  `grade` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '县长', '1');
INSERT INTO `t_role` VALUES ('2', '科长', '3');
INSERT INTO `t_role` VALUES ('3', '局长', '2');
INSERT INTO `t_role` VALUES ('4', '管理员', '0');
INSERT INTO `t_role` VALUES ('8', '省长', '8');
INSERT INTO `t_role` VALUES ('10', '主席', '11');
INSERT INTO `t_role` VALUES ('11', '解决', '3');
INSERT INTO `t_role` VALUES ('13', 'a', '3');

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_upper_id` int(11) DEFAULT NULL,
  `user_lower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`project_id`),
  KEY `FK_Reference_4` (`user_upper_id`),
  KEY `FK_Reference_5` (`user_lower_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_upper_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`user_lower_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '1', '1', '2');
INSERT INTO `t_task` VALUES ('2', '1', '1', '3');
INSERT INTO `t_task` VALUES ('3', '1', '2', '2');
INSERT INTO `t_task` VALUES ('4', '1', '2', '3');
INSERT INTO `t_task` VALUES ('5', '2', '1', '2');
INSERT INTO `t_task` VALUES ('6', '2', '1', '3');
INSERT INTO `t_task` VALUES ('7', '2', '2', '9');
INSERT INTO `t_task` VALUES ('8', '2', '2', '2');
INSERT INTO `t_task` VALUES ('9', '2', '2', '3');
INSERT INTO `t_task` VALUES ('10', '3', '1', '2');
INSERT INTO `t_task` VALUES ('11', '1', '1', '1');
INSERT INTO `t_task` VALUES ('12', '1', '2', '9');
INSERT INTO `t_task` VALUES ('13', '1', '1', '9');

-- ----------------------------
-- Table structure for t_url
-- ----------------------------
DROP TABLE IF EXISTS `t_url`;
CREATE TABLE `t_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlType` varchar(20) DEFAULT NULL,
  `docUrl` varchar(100) DEFAULT NULL,
  `states` varchar(20) DEFAULT '未完成',
  `checkstates` varchar(1000) DEFAULT NULL,
  `advance` varchar(1000) DEFAULT NULL,
  `num` int(11) DEFAULT '1',
  `subtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_taskURL` (`task_id`),
  KEY `FK_url` (`url_id`),
  CONSTRAINT `FK_taskURL` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_url` FOREIGN KEY (`url_id`) REFERENCES `t_url` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_url
-- ----------------------------
INSERT INTO `t_url` VALUES ('58', 'PDCA', 'NO:4194 QQ图片20140917155933.jpg', null, null, 'D', '1', null, '2015-02-24 00:00:00', '2', null);
INSERT INTO `t_url` VALUES ('59', 'P', 'NO:5210 purchase_trends.jsp', '已完成', null, 'D', '1', '2015-02-04 22:37:03', '2015-02-24 00:00:00', '2', '58');
INSERT INTO `t_url` VALUES ('60', 'D', null, null, null, 'D', '1', null, '2015-02-17 00:00:00', '2', '58');
INSERT INTO `t_url` VALUES ('61', 'PDCA', 'NO:1308 新建文本文档 (4).txt', null, null, 'D', '1', null, '2015-02-26 00:00:00', '1', null);
INSERT INTO `t_url` VALUES ('62', 'P', 'NO:1951 PDCA数据库.txt', '已完成', null, 'D', '1', '2015-02-04 22:40:48', '2015-02-26 00:00:00', '1', '61');
INSERT INTO `t_url` VALUES ('63', 'D', null, null, null, 'D', '1', null, '2015-02-04 00:00:00', '1', '61');
INSERT INTO `t_url` VALUES ('64', 'PDCA', 'NO:6128 项目需求.txt', null, null, null, '1', null, '2015-02-26 00:00:00', '1', null);
INSERT INTO `t_url` VALUES ('65', 'P', null, '已完成', null, '', '1', '2015-02-07 17:46:54', '2015-02-26 00:00:00', '1', '64');
INSERT INTO `t_url` VALUES ('66', 'PDCA', 'NO:7382 新建文本文档.txt', null, null, null, '1', null, '2015-02-25 00:00:00', '5', null);
INSERT INTO `t_url` VALUES ('67', 'P', null, null, null, null, '1', null, '2015-02-25 00:00:00', '5', '66');
INSERT INTO `t_url` VALUES ('68', 'D', null, null, null, null, '1', null, '2015-02-24 00:00:00', '1', '61');
INSERT INTO `t_url` VALUES ('69', 'PDCA', 'NO:1564 QQ图片20140917155933.jpg', null, null, null, '1', null, '2015-02-19 00:00:00', '3', '64');
INSERT INTO `t_url` VALUES ('70', 'P', null, null, null, null, '1', null, '2015-02-13 00:00:00', '3', '69');
INSERT INTO `t_url` VALUES ('71', 'A', 'NO:8818 新建文本文档.txt', '已完成', null, null, '1', '2015-02-07 18:24:26', '2015-02-07 18:24:26', '1', '61');
INSERT INTO `t_url` VALUES ('72', 'PDCA', 'NO:6620 b7fd5266d01609249a7a3c70d60735fae6cd3479.jpg', null, null, null, '1', null, '2015-02-26 00:00:00', '1', null);
INSERT INTO `t_url` VALUES ('73', 'P', null, null, null, null, '1', null, '2015-02-26 00:00:00', '1', '72');
INSERT INTO `t_url` VALUES ('74', 'PDCA', 'NO:3968 于鹏.jpg', null, null, null, '1', null, '2015-02-18 00:00:00', '11', null);
INSERT INTO `t_url` VALUES ('75', 'P', null, null, null, null, '1', null, '2015-02-18 00:00:00', '11', '74');
INSERT INTO `t_url` VALUES ('76', 'PDCA', 'NO:9808 PDCA数据库.txt', null, null, null, '1', null, '2015-02-19 00:00:00', '11', null);
INSERT INTO `t_url` VALUES ('77', 'C', null, null, null, null, '1', null, '2015-02-19 00:00:00', '11', '76');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `realname` varchar(15) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`role_id`),
  KEY `FK_depId` (`dep_id`),
  CONSTRAINT `FK_depId` FOREIGN KEY (`dep_id`) REFERENCES `t_department` (`depId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'yup', 'yup', '于鹏', '1', '1', '1');
INSERT INTO `t_user` VALUES ('2', 'yu', 'yu', '陈敏', '1', '2', '2');
INSERT INTO `t_user` VALUES ('3', 'yy', 'yy', '王建', '1', '2', '2');
INSERT INTO `t_user` VALUES ('4', 'admin', 'admin', '系统管理员', null, '4', null);
INSERT INTO `t_user` VALUES ('9', 'xx', 'xx', '张文山', '1', '2', '2');
INSERT INTO `t_user` VALUES ('10', 'ab', 'ab', 'ab', '1', '4', '3');
