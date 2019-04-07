/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : drug

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-04-07 19:01:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for druginfo
-- ----------------------------
DROP TABLE IF EXISTS `druginfo`;
CREATE TABLE `druginfo` (
  `drugname` varchar(50) DEFAULT NULL,
  `changshang` varchar(50) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL,
  `tiaoxingma` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ghs
-- ----------------------------
DROP TABLE IF EXISTS `ghs`;
CREATE TABLE `ghs` (
  `gonghuoshang` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jinhuo
-- ----------------------------
DROP TABLE IF EXISTS `jinhuo`;
CREATE TABLE `jinhuo` (
  `drugname` varchar(50) DEFAULT NULL,
  `changshang` varchar(50) DEFAULT NULL,
  `beginprice` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `sum` varchar(50) DEFAULT NULL,
  `begindate` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `pihao` varchar(50) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL,
  `tiaoxingma` varchar(50) DEFAULT NULL,
  `jinhuo_time` varchar(100) DEFAULT NULL,
  `gonghuoshang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jinhuorecords
-- ----------------------------
DROP TABLE IF EXISTS `jinhuorecords`;
CREATE TABLE `jinhuorecords` (
  `drugname` varchar(50) DEFAULT NULL,
  `changshang` varchar(50) DEFAULT NULL,
  `beginprice` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `sum` varchar(50) DEFAULT NULL,
  `begindate` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `pihao` varchar(50) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL,
  `tiaoxingma` varchar(50) DEFAULT NULL,
  `jinhuo_time` varchar(100) DEFAULT NULL,
  `gonghuoshang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sell
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `drugname` varchar(100) DEFAULT NULL,
  `changshang` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `pihao` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `count` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `guige` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `sum` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sellover
-- ----------------------------
DROP TABLE IF EXISTS `sellover`;
CREATE TABLE `sellover` (
  `drugname` varchar(50) DEFAULT NULL,
  `changshang` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `pihao` varchar(50) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `count` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sellrecords
-- ----------------------------
DROP TABLE IF EXISTS `sellrecords`;
CREATE TABLE `sellrecords` (
  `drugname` varchar(100) DEFAULT NULL,
  `changshang` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `pihao` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `guige` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `sum` varchar(100) DEFAULT NULL,
  `selltime` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `drugname` varchar(50) DEFAULT NULL,
  `changshang` varchar(50) DEFAULT NULL,
  `beginprice` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `begindate` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `pihao` varchar(50) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `count` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL,
  `tiaoxingma` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
