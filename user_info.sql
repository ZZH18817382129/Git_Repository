/*
Navicat MySQL Data Transfer

Source Server         : MySQL(local)
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : wl-manager-system

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2020-11-30 15:55:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `question` int(5) DEFAULT NULL COMMENT '问题数',
  `model_type` varchar(100) DEFAULT NULL COMMENT '模块',
  `model_type_name` varchar(200) DEFAULT NULL COMMENT '模块显示',
  `lead_id` int(11) DEFAULT NULL COMMENT '领导id',
  `status` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `dept_id` int(5) DEFAULT NULL COMMENT '部门id',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `qq` varchar(30) DEFAULT NULL COMMENT 'QQ',
  `phone` varchar(40) DEFAULT NULL COMMENT '联系电话',
  `head_image` varchar(200) DEFAULT NULL COMMENT '头像',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `company_id` int(9) DEFAULT NULL COMMENT '项目公司',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'sysadmin', '96e062cc70ac88496255032b9ff525ec', '系统管理员', '0', '1,2,3,4,5,6,7,8,9,10,11,99', 'PP,CO,SD,MM,FI,SRM,OA,PLM,QM,ZK,EHR,其他', '0', '1', '2016-06-01 10:10:14', '2019-03-13 09:06:48', '1', '卧龙控股集团', '', '13456857157', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('2', 'plm用户', '96e062cc70ac88496255032b9ff525ec', 'plm用户', '0', '2', '', '0', '1', '2016-06-01 10:10:14', '2016-06-01 10:10:14', '1', '卧龙控股集团', '', '13000000000', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('6', 'pp用户', '96e062cc70ac88496255032b9ff525ec', 'pp用户', '0', '1', 'PP', '0', '1', '2016-06-01 10:10:14', '2016-08-16 09:42:50', null, null, '', '13000000000', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('7', 'mm用户', '96e062cc70ac88496255032b9ff525ec', 'mm用户', '0', '4', null, '0', '1', '2016-06-01 10:10:14', '2016-06-01 10:10:14', null, null, '', '13000000000', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('8', 'srm用户', '96e062cc70ac88496255032b9ff525ec', 'srm用户', '0', '3,4', 'SD,MM', '0', '1', '2016-06-01 10:10:14', '2016-07-22 14:13:23', null, null, '', '13000000000', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('12', 'oa用户', 'e10adc3949ba59abbe56e057f20f883e', 'oa用户', null, '3,4', 'SD,MM', null, '1', '2016-07-22 16:23:56', null, null, '', '', '', '/resources/front/images/avtar.png', 'fanchao@wolong.com', null);
INSERT INTO `user_info` VALUES ('13', 'zk用户', 'e10adc3949ba59abbe56e057f20f883e', 'zk用户', null, '10,99', 'ZK,其他', null, '1', '2016-07-28 09:07:01', '2016-07-28 09:18:55', '1', '卧龙控股集团', '', '', '/resources/front/images/avtar.png', '33028223@qq.com', null);
INSERT INTO `user_info` VALUES ('14', 'co用户', 'e10adc3949ba59abbe56e057f20f883e', 'co用户', null, '2', 'CO', null, '1', '2016-07-28 15:47:11', '2016-07-28 15:47:28', '1', '卧龙控股集团', '', '13456857157', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('15', 'FI用户', 'e10adc3949ba59abbe56e057f20f883e', 'FI用户', null, '5', 'FI', null, '1', '2016-07-29 16:22:29', '2016-07-29 16:24:02', '1', '卧龙控股集团', '', '13456857157', '/resources/front/images/avtar.png', '330282237@qq.com', null);
INSERT INTO `user_info` VALUES ('16', '2004c16', 'a9e6663ccc2b5e465f5bbac77d69cde1', '俞洪辉', null, '1,2,3,4,5,6,7,8,9,10,11,99', 'PP,CO,SD,MM,FI,SRM,OA,PLM,QM,ZK,EHR,其他', null, '1', '2016-08-15 12:39:24', '2016-10-08 15:11:16', null, '', '', '', '/resources/front/images/avtar.png', '', null);
INSERT INTO `user_info` VALUES ('17', '1998017', 'e10adc3949ba59abbe56e057f20f883e', '朱铁芬', null, '1,2,3,4,5,6,7,8,9,10,11,99', 'PP,CO,SD,MM,FI,SRM,OA,PLM,QM,ZK,EHR,其他', null, '1', '2016-08-15 12:49:44', '2019-03-02 09:05:29', '1', '卧龙控股集团', '', '', '/resources/front/images/avtar.png', 'zhutiefen@wolon.com', null);
INSERT INTO `user_info` VALUES ('19', '2003506', 'e10adc3949ba59abbe56e057f20f883e', '王杰标', null, '1,2,3,4,5,6,7,8,9,10,11,99', 'PP,CO,SD,MM,FI,SRM,OA,PLM,QM,ZK,EHR,其他', null, '1', '2016-08-15 12:51:42', '2017-09-15 15:06:11', null, '', '', '', '/resources/front/images/avtar.png', 'wangjiebiao@wolong.com', null);
INSERT INTO `user_info` VALUES ('20', '202007981', 'e10adc3949ba59abbe56e057f20f883e', '赵泽红', null, '1,2,3,4,5,6,7,8,9,10,11,99', 'PP,CO,SD,MM,FI,SRM,OA,PLM,QM,ZK,EHR,其他', null, null, '2020-11-26 14:37:39', '2020-11-26 14:37:44', null, null, null, null, null, null, null);
