/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : StudentInfoManagement

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 24/02/2022 16:59:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Class
-- ----------------------------
DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `Clno` char(12) NOT NULL,
  `Clname` char(12) DEFAULT NULL,
  `Dno` char(12) DEFAULT NULL,
  PRIMARY KEY (`Clno`),
  KEY `FK_Class_Department` (`Dno`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Class
-- ----------------------------
BEGIN;
INSERT INTO `Class` VALUES ('20150103', '2015-3班', '201501');
INSERT INTO `Class` VALUES ('20150104', '2015-4班', '201501');
INSERT INTO `Class` VALUES ('20150201', '2015-1班', '201502');
INSERT INTO `Class` VALUES ('20150202', '2015-2班', '201502');
INSERT INTO `Class` VALUES ('20150301', '2015-1班', '201503');
INSERT INTO `Class` VALUES ('20150302', '2015-2班', '201503');
COMMIT;

-- ----------------------------
-- Table structure for Course
-- ----------------------------
DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course` (
  `Cno` char(12) NOT NULL,
  `Cname` char(12) DEFAULT NULL,
  `Cteacher` char(8) DEFAULT NULL,
  `Ccredit` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Course
-- ----------------------------
BEGIN;
INSERT INTO `Course` VALUES ('1', '高等数学', '张三', 4);
INSERT INTO `Course` VALUES ('2', '数据库原理设计', '李四', 3);
INSERT INTO `Course` VALUES ('3', 'Java程序设计', '王五', 4);
COMMIT;

-- ----------------------------
-- Table structure for Department
-- ----------------------------
DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
  `Dno` char(12) NOT NULL,
  `Dname` char(12) DEFAULT NULL,
  PRIMARY KEY (`Dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Department
-- ----------------------------
BEGIN;
INSERT INTO `Department` VALUES ('201501', '软件学院');
INSERT INTO `Department` VALUES ('201502', '经管学院');
INSERT INTO `Department` VALUES ('201503', '人文学院');
INSERT INTO `Department` VALUES ('201504', '国际学院');
INSERT INTO `Department` VALUES ('201505', '理学院');
COMMIT;

-- ----------------------------
-- Table structure for SC
-- ----------------------------
DROP TABLE IF EXISTS `SC`;
CREATE TABLE `SC` (
  `Sno` char(12) NOT NULL,
  `Cno` char(12) NOT NULL,
  `Grade` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Cno`),
  KEY `FK_SC_Course` (`Cno`),
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `Student` (`Sno`),
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `Course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SC
-- ----------------------------
BEGIN;
INSERT INTO `SC` VALUES ('2015010312', '1', 50);
INSERT INTO `SC` VALUES ('2015010312', '2', 80);
INSERT INTO `SC` VALUES ('2015010312', '3', 70);
INSERT INTO `SC` VALUES ('2015010313', '1', 90);
INSERT INTO `SC` VALUES ('2015010313', '2', 89);
INSERT INTO `SC` VALUES ('2015010313', '3', 59);
INSERT INTO `SC` VALUES ('2015010314', '1', 85);
INSERT INTO `SC` VALUES ('2015010314', '2', 75);
INSERT INTO `SC` VALUES ('2015010314', '3', 95);
COMMIT;

-- ----------------------------
-- Table structure for Student
-- ----------------------------
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
  `Sno` char(12) NOT NULL,
  `Sname` char(8) DEFAULT NULL,
  `Ssex` char(2) DEFAULT NULL,
  `Sage` smallint(6) DEFAULT NULL,
  `Clno` char(12) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  KEY `FK_Student_Class` (`Clno`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Clno`) REFERENCES `Class` (`Clno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Student
-- ----------------------------
BEGIN;
INSERT INTO `Student` VALUES ('2015010312', '张明', '男', 20, '20150103');
INSERT INTO `Student` VALUES ('2015010313', '秦羽', '女', 19, '20150103');
INSERT INTO `Student` VALUES ('2015010314', '刘翔', '男', 19, '20150103');
COMMIT;

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `username` char(12) NOT NULL,
  `password` char(12) NOT NULL,
  `level` char(6) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of User
-- ----------------------------
BEGIN;
INSERT INTO `User` VALUES ('1', '1', '管理员');
INSERT INTO `User` VALUES ('admin', '666', '管理员');
INSERT INTO `User` VALUES ('user', '123', '用户');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
