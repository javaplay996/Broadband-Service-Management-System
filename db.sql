/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - kuandaiyewuguanlixitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kuandaiyewuguanlixitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kuandaiyewuguanlixitong`;

/*Table structure for table `baoxiu` */

DROP TABLE IF EXISTS `baoxiu`;

CREATE TABLE `baoxiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `baoxiu_name` varchar(200) DEFAULT NULL COMMENT '报修名称 Search111',
  `baoxiu_photo` varchar(200) DEFAULT NULL COMMENT '报修图片',
  `baoxiu_types` int(11) NOT NULL COMMENT '报修类型 Search111',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '申请报修时间',
  `baoxiu_zhuangtai_types` int(11) NOT NULL COMMENT '报修状态 Search111',
  `baoxiu_content` text COMMENT '报修详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='报修';

/*Data for the table `baoxiu` */

insert  into `baoxiu`(`id`,`yonghu_id`,`baoxiu_name`,`baoxiu_photo`,`baoxiu_types`,`insert_time`,`baoxiu_zhuangtai_types`,`baoxiu_content`,`create_time`) values (1,2,'报修名称1','upload/baoxiu1.jpg',2,'2023-03-17 14:07:51',2,'报修详情1','2023-03-17 14:07:51'),(2,3,'报修名称2','upload/baoxiu2.jpg',2,'2023-03-17 14:07:51',2,'报修详情2','2023-03-17 14:07:51'),(3,1,'报修名称3','upload/baoxiu3.jpg',3,'2023-03-17 14:07:51',1,'报修详情3','2023-03-17 14:07:51'),(4,2,'报修名称4','upload/baoxiu4.jpg',3,'2023-03-17 14:07:51',1,'报修详情4','2023-03-17 14:07:51'),(5,3,'报修名称5','upload/baoxiu5.jpg',2,'2023-03-17 14:07:51',2,'报修详情5','2023-03-17 14:07:51'),(6,3,'报修名称6','upload/baoxiu6.jpg',3,'2023-03-17 14:07:51',2,'报修详情6','2023-03-17 14:07:51'),(7,1,'报修名称7','upload/baoxiu7.jpg',2,'2023-03-17 14:07:51',2,'报修详情7','2023-03-17 14:07:51'),(8,1,'报修名称8','upload/baoxiu8.jpg',1,'2023-03-17 14:07:51',1,'报修详情8','2023-03-17 15:04:10'),(9,3,'报修名称9','upload/baoxiu9.jpg',2,'2023-03-17 14:07:51',2,'报修详情9','2023-03-17 14:07:51'),(10,3,'报修名称10','upload/baoxiu10.jpg',3,'2023-03-17 14:07:51',2,'报修详情10','2023-03-17 14:07:51'),(11,2,'报修名称11','upload/baoxiu11.jpg',2,'2023-03-17 14:07:51',2,'报修详情11','2023-03-17 14:07:51'),(12,3,'报修名称12','upload/baoxiu12.jpg',3,'2023-03-17 14:07:51',2,'报修详情12','2023-03-17 14:07:51'),(13,3,'报修名称13','upload/baoxiu13.jpg',2,'2023-03-17 14:07:51',1,'报修详情13','2023-03-17 14:07:51'),(14,2,'报修名称14','upload/baoxiu14.jpg',2,'2023-03-17 14:07:51',1,'报修详情14','2023-03-17 14:07:51');

/*Table structure for table `baoxiu_commentback` */

DROP TABLE IF EXISTS `baoxiu_commentback`;

CREATE TABLE `baoxiu_commentback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `baoxiu_id` int(11) DEFAULT NULL COMMENT '报修',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `baoxiu_commentback_text` text COMMENT '评价内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='报修评价';

/*Data for the table `baoxiu_commentback` */

insert  into `baoxiu_commentback`(`id`,`baoxiu_id`,`yonghu_id`,`baoxiu_commentback_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,3,'评价内容1','2023-03-17 14:07:51','回复信息1','2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,2,3,'评价内容2','2023-03-17 14:07:51','回复信息2','2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,3,1,'评价内容3','2023-03-17 14:07:51','回复信息3','2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,4,3,'评价内容4','2023-03-17 14:07:51','回复信息4','2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,5,1,'评价内容5','2023-03-17 14:07:51','回复信息5','2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,6,2,'评价内容6','2023-03-17 14:07:51','回复信息6','2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,7,1,'评价内容7','2023-03-17 14:07:51','回复信息7','2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,8,2,'评价内容8','2023-03-17 14:07:51','回复信息8','2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,9,1,'评价内容9','2023-03-17 14:07:51','回复信息9','2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,10,3,'评价内容10','2023-03-17 14:07:51','回复信息10','2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,11,2,'评价内容11','2023-03-17 14:07:51','回复信息11','2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,12,2,'评价内容12','2023-03-17 14:07:51','回复信息12','2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,13,1,'评价内容13','2023-03-17 14:07:51','回复信息13','2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,14,3,'评价内容14','2023-03-17 14:07:51','回复信息14','2023-03-17 14:07:51','2023-03-17 14:07:51'),(16,3,1,'12651','2023-03-17 15:09:23','41564156','2023-03-17 15:15:21','2023-03-17 15:09:23'),(17,8,1,'不错','2023-03-17 15:16:36',NULL,NULL,'2023-03-17 15:16:36');

/*Table structure for table `baoxiu_fenpei` */

DROP TABLE IF EXISTS `baoxiu_fenpei`;

CREATE TABLE `baoxiu_fenpei` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `baoxiu_id` int(11) DEFAULT NULL COMMENT '车位',
  `yewurenyuan_id` int(11) DEFAULT NULL COMMENT '工作人员',
  `fenpei_time` timestamp NULL DEFAULT NULL COMMENT '分配时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='报修分配';

/*Data for the table `baoxiu_fenpei` */

insert  into `baoxiu_fenpei`(`id`,`baoxiu_id`,`yewurenyuan_id`,`fenpei_time`,`create_time`) values (1,1,2,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,2,2,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,3,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,4,3,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,5,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,6,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,7,3,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,8,2,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,9,2,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,10,3,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,11,3,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,12,3,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,13,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,14,3,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(50,8,1,'2023-03-17 15:04:08','2023-03-17 15:04:10');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2023-03-17 14:07:35'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2023-03-17 14:07:35'),(3,'gonggao_types','公告类型',1,'公告类型1',NULL,NULL,'2023-03-17 14:07:35'),(4,'gonggao_types','公告类型',2,'公告类型2',NULL,NULL,'2023-03-17 14:07:35'),(5,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2023-03-17 14:07:35'),(6,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2023-03-17 14:07:35'),(7,'kuandai_types','宽带类型',1,'宽带类型1',NULL,NULL,'2023-03-17 14:07:35'),(8,'kuandai_types','宽带类型',2,'宽带类型2',NULL,NULL,'2023-03-17 14:07:35'),(9,'kuandai_types','宽带类型',3,'宽带类型3',NULL,NULL,'2023-03-17 14:07:35'),(10,'kuandai_types','宽带类型',4,'宽带类型4',NULL,NULL,'2023-03-17 14:07:35'),(11,'kuandai_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-03-17 14:07:35'),(12,'kuandai_order_types','订单类型',101,'已开户',NULL,NULL,'2023-03-17 14:07:35'),(13,'kuandai_order_types','订单类型',102,'已取消开户',NULL,NULL,'2023-03-17 14:07:35'),(14,'kuandai_yuyue_yesno_types','报名状态',1,'待审核',NULL,NULL,'2023-03-17 14:07:35'),(15,'kuandai_yuyue_yesno_types','报名状态',2,'同意',NULL,NULL,'2023-03-17 14:07:35'),(16,'kuandai_yuyue_yesno_types','报名状态',3,'拒绝',NULL,NULL,'2023-03-17 14:07:35'),(17,'feiyong_types','缴费类型',1,'缴费类型1',NULL,NULL,'2023-03-17 14:07:35'),(18,'feiyong_types','缴费类型',2,'缴费类型2',NULL,NULL,'2023-03-17 14:07:35'),(19,'feiyong_types','缴费类型',3,'缴费类型3',NULL,NULL,'2023-03-17 14:07:35'),(20,'feiyong_zhuangtai_types','缴费状态',1,'已缴费',NULL,NULL,'2023-03-17 14:07:35'),(21,'feiyong_zhuangtai_types','缴费状态',2,'未缴费',NULL,NULL,'2023-03-17 14:07:35'),(22,'baoxiu_types','报修类型',1,'报修类型1',NULL,NULL,'2023-03-17 14:07:35'),(23,'baoxiu_types','报修类型',2,'报修类型2',NULL,NULL,'2023-03-17 14:07:35'),(24,'baoxiu_types','报修类型',3,'报修类型3',NULL,NULL,'2023-03-17 14:07:35'),(25,'baoxiu_zhuangtai_types','报修状态',1,'已维修',NULL,NULL,'2023-03-17 14:07:35'),(26,'baoxiu_zhuangtai_types','报修状态',2,'未维修',NULL,NULL,'2023-03-17 14:07:35'),(27,'qianyi_yuyue_yesno_types','报名状态',1,'待审核',NULL,NULL,'2023-03-17 14:07:35'),(28,'qianyi_yuyue_yesno_types','报名状态',2,'同意',NULL,NULL,'2023-03-17 14:07:35'),(29,'qianyi_yuyue_yesno_types','报名状态',3,'拒绝',NULL,NULL,'2023-03-17 14:07:35');

/*Table structure for table `feiyong` */

DROP TABLE IF EXISTS `feiyong`;

CREATE TABLE `feiyong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `feiyong_name` varchar(200) DEFAULT NULL COMMENT '缴费  Search111 ',
  `feiyong_types` int(11) DEFAULT NULL COMMENT '缴费类型 Search111',
  `feiyong_zhuangtai_types` int(11) DEFAULT NULL COMMENT '缴费状态 Search111',
  `feiyong_time` varchar(200) DEFAULT NULL COMMENT '年月 ',
  `feiyong_old_money` decimal(10,2) DEFAULT NULL COMMENT '缴费金额 ',
  `feiyong_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='宽带缴费';

/*Data for the table `feiyong` */

insert  into `feiyong`(`id`,`yonghu_id`,`feiyong_name`,`feiyong_types`,`feiyong_zhuangtai_types`,`feiyong_time`,`feiyong_old_money`,`feiyong_delete`,`insert_time`,`create_time`) values (1,1,'缴费1',2,1,'年月1','663.21',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,3,'缴费2',3,2,'年月2','715.23',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,3,'缴费3',2,1,'年月3','802.50',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,3,'缴费4',3,2,'年月4','968.11',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,1,'缴费5',2,1,'年月5','981.20',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,1,'缴费6',2,1,'年月6','613.40',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,2,'缴费7',3,1,'年月7','661.76',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,1,'缴费8',3,1,'年月8','631.15',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,3,'缴费9',3,1,'年月9','693.99',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,1,'缴费10',3,1,'年月10','903.89',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,1,'缴费11',1,1,'年月11','897.68',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,3,'缴费12',3,1,'年月12','720.46',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,2,'缴费13',2,1,'年月13','596.99',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,1,'缴费14',2,1,'年月14','832.14',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(16,1,'缴费',1,1,'2023-03','50.00',1,'2023-03-17 15:14:26','2023-03-17 15:14:26');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',3,NULL,'发布内容1',115,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,'帖子标题2',2,NULL,'发布内容2',318,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,'帖子标题3',1,NULL,'发布内容3',10,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,'帖子标题4',3,NULL,'发布内容4',262,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,'帖子标题5',1,NULL,'发布内容5',399,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,'帖子标题6',1,NULL,'发布内容6',49,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,'帖子标题7',2,NULL,'发布内容7',328,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,'帖子标题8',1,NULL,'发布内容8',415,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,'帖子标题9',1,NULL,'发布内容9',162,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,'帖子标题10',3,NULL,'发布内容10',114,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,'帖子标题11',2,NULL,'发布内容11',104,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,'帖子标题12',1,NULL,'发布内容12',7,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,'帖子标题13',1,NULL,'发布内容13',196,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,'帖子标题14',3,NULL,'发布内容14',443,1,'2023-03-17 14:07:51','2023-03-17 14:07:51','2023-03-17 14:07:51'),(15,'帖子',1,NULL,'<p>帖子</p>',NULL,1,'2023-03-17 15:12:13',NULL,'2023-03-17 15:12:13'),(16,NULL,NULL,1,'666 ',15,2,'2023-03-17 15:15:36',NULL,'2023-03-17 15:15:36');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int(11) NOT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_photo`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (1,'公告名称1','upload/gonggao1.jpg',2,'2023-03-17 14:07:51','公告详情1','2023-03-17 14:07:51'),(2,'公告名称2','upload/gonggao2.jpg',2,'2023-03-17 14:07:51','公告详情2','2023-03-17 14:07:51'),(3,'公告名称3','upload/gonggao3.jpg',2,'2023-03-17 14:07:51','公告详情3','2023-03-17 14:07:51'),(4,'公告名称4','upload/gonggao4.jpg',2,'2023-03-17 14:07:51','公告详情4','2023-03-17 14:07:51'),(5,'公告名称5','upload/gonggao5.jpg',2,'2023-03-17 14:07:51','公告详情5','2023-03-17 14:07:51'),(6,'公告名称6','upload/gonggao6.jpg',1,'2023-03-17 14:07:51','公告详情6','2023-03-17 14:07:51'),(7,'公告名称7','upload/gonggao7.jpg',2,'2023-03-17 14:07:51','公告详情7','2023-03-17 14:07:51'),(8,'公告名称8','upload/gonggao8.jpg',1,'2023-03-17 14:07:51','公告详情8','2023-03-17 14:07:51'),(9,'公告名称9','upload/gonggao9.jpg',2,'2023-03-17 14:07:51','公告详情9','2023-03-17 14:07:51'),(10,'公告名称10','upload/gonggao10.jpg',1,'2023-03-17 14:07:51','公告详情10','2023-03-17 14:07:51'),(11,'公告名称11','upload/gonggao11.jpg',1,'2023-03-17 14:07:51','公告详情11','2023-03-17 14:07:51'),(12,'公告名称12','upload/gonggao12.jpg',2,'2023-03-17 14:07:51','公告详情12','2023-03-17 14:07:51'),(13,'公告名称13','upload/gonggao13.jpg',1,'2023-03-17 14:07:51','公告详情13','2023-03-17 14:07:51'),(14,'公告名称14','upload/gonggao14.jpg',1,'2023-03-17 14:07:51','公告详情14','2023-03-17 14:07:51');

/*Table structure for table `kuandai` */

DROP TABLE IF EXISTS `kuandai`;

CREATE TABLE `kuandai` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `kuandai_name` varchar(200) DEFAULT NULL COMMENT '宽带名称  Search111 ',
  `kuandai_uuid_number` varchar(200) DEFAULT NULL COMMENT '宽带编号',
  `kuandai_photo` varchar(200) DEFAULT NULL COMMENT '宽带照片',
  `kuandai_types` int(11) DEFAULT NULL COMMENT '宽带类型 Search111',
  `kuandai_content` text COMMENT '宽带介绍 ',
  `kuandai_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='宽带';

/*Data for the table `kuandai` */

insert  into `kuandai`(`id`,`kuandai_name`,`kuandai_uuid_number`,`kuandai_photo`,`kuandai_types`,`kuandai_content`,`kuandai_delete`,`insert_time`,`create_time`) values (1,'宽带名称1','1679033271840','upload/kuandai1.jpg',4,'宽带介绍1',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,'宽带名称2','1679033271800','upload/kuandai2.jpg',4,'宽带介绍2',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,'宽带名称3','1679033271770','upload/kuandai3.jpg',3,'宽带介绍3',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,'宽带名称4','1679033271850','upload/kuandai4.jpg',2,'宽带介绍4',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,'宽带名称5','1679033271771','upload/kuandai5.jpg',1,'宽带介绍5',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,'宽带名称6','1679033271817','upload/kuandai6.jpg',2,'宽带介绍6',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,'宽带名称7','1679033271817','upload/kuandai7.jpg',3,'宽带介绍7',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,'宽带名称8','1679033271800','upload/kuandai8.jpg',1,'宽带介绍8',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,'宽带名称9','1679033271788','upload/kuandai9.jpg',2,'宽带介绍9',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,'宽带名称10','1679033271839','upload/kuandai10.jpg',4,'宽带介绍10',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,'宽带名称11','1679033271796','upload/kuandai11.jpg',1,'宽带介绍11',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,'宽带名称12','1679033271801','upload/kuandai12.jpg',1,'宽带介绍12',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,'宽带名称13','1679033271850','upload/kuandai13.jpg',3,'宽带介绍13',1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,'宽带名称14','1679033271774','upload/kuandai14.jpg',1,'宽带介绍14',1,'2023-03-17 14:07:51','2023-03-17 14:07:51');

/*Table structure for table `kuandai_collection` */

DROP TABLE IF EXISTS `kuandai_collection`;

CREATE TABLE `kuandai_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kuandai_id` int(11) DEFAULT NULL COMMENT '宽带',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `kuandai_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='宽带收藏';

/*Data for the table `kuandai_collection` */

insert  into `kuandai_collection`(`id`,`kuandai_id`,`yonghu_id`,`kuandai_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,2,1,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,3,3,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,4,3,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,5,1,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,6,2,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,7,1,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,8,1,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,9,1,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,10,1,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,11,2,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,12,2,1,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,13,2,1,'2023-03-17 14:07:51','2023-03-17 14:07:51');

/*Table structure for table `kuandai_liuyan` */

DROP TABLE IF EXISTS `kuandai_liuyan`;

CREATE TABLE `kuandai_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kuandai_id` int(11) DEFAULT NULL COMMENT '商品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `kuandai_liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='宽带留言';

/*Data for the table `kuandai_liuyan` */

insert  into `kuandai_liuyan`(`id`,`kuandai_id`,`yonghu_id`,`kuandai_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'留言内容1','2023-03-17 14:07:51','回复信息1','2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,2,3,'留言内容2','2023-03-17 14:07:51','回复信息2','2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,3,1,'留言内容3','2023-03-17 14:07:51','回复信息3','2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,4,2,'留言内容4','2023-03-17 14:07:51','回复信息4','2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,5,2,'留言内容5','2023-03-17 14:07:51','回复信息5','2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,6,2,'留言内容6','2023-03-17 14:07:51','回复信息6','2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,7,1,'留言内容7','2023-03-17 14:07:51','回复信息7','2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,8,2,'留言内容8','2023-03-17 14:07:51','回复信息8','2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,9,1,'留言内容9','2023-03-17 14:07:51','回复信息9','2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,10,3,'留言内容10','2023-03-17 14:07:51','回复信息10','2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,11,3,'留言内容11','2023-03-17 14:07:51','回复信息11','2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,12,2,'留言内容12','2023-03-17 14:07:51','回复信息12','2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,13,2,'留言内容13','2023-03-17 14:07:51','回复信息13','2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,14,1,'留言内容14','2023-03-17 14:07:51','回复信息14','2023-03-17 14:07:51','2023-03-17 14:07:51'),(15,12,1,'丫丫','2023-03-17 15:11:49',NULL,NULL,'2023-03-17 15:11:49');

/*Table structure for table `kuandai_order` */

DROP TABLE IF EXISTS `kuandai_order`;

CREATE TABLE `kuandai_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kuandai_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单编号 Search111 ',
  `kuandai_id` int(11) DEFAULT NULL COMMENT '宽带',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `kuandai_order_types` int(11) DEFAULT NULL COMMENT '订单类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='宽带开户';

/*Data for the table `kuandai_order` */

insert  into `kuandai_order`(`id`,`kuandai_order_uuid_number`,`kuandai_id`,`yonghu_id`,`kuandai_order_types`,`insert_time`,`create_time`) values (1,'1679033635650',12,1,101,'2023-03-17 14:13:56','2023-03-17 14:13:56'),(2,'1679037149654',14,1,102,'2023-03-17 15:12:30','2023-03-17 15:12:30');

/*Table structure for table `kuandai_yuyue` */

DROP TABLE IF EXISTS `kuandai_yuyue`;

CREATE TABLE `kuandai_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kuandai_id` int(11) DEFAULT NULL COMMENT '宽带',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `kuandai_yuyue_text` text COMMENT '理由',
  `kuandai_yuyue_address` varchar(200) DEFAULT NULL COMMENT '地点',
  `kuandai_yuyue_yesno_types` int(11) DEFAULT NULL COMMENT '报名状态 Search111 ',
  `kuandai_yuyue_yesno_text` text COMMENT '审核回复',
  `kuandai_yuyue_shenhe_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '活动报名时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='宽带预约安装';

/*Data for the table `kuandai_yuyue` */

insert  into `kuandai_yuyue`(`id`,`kuandai_id`,`yonghu_id`,`kuandai_yuyue_text`,`kuandai_yuyue_address`,`kuandai_yuyue_yesno_types`,`kuandai_yuyue_yesno_text`,`kuandai_yuyue_shenhe_time`,`insert_time`,`create_time`) values (1,1,2,'理由1','地点1',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,2,3,'理由2','地点2',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,3,2,'理由3','地点3',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,4,1,'理由4','地点4',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,5,3,'理由5','地点5',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,6,2,'理由6','地点6',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,7,2,'理由7','地点7',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,8,2,'理由8','地点8',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,9,2,'理由9','地点9',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,10,3,'理由10','地点10',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,11,2,'理由11','地点11',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,12,2,'理由12','地点12',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,13,3,'理由13','地点13',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,14,1,'理由14','地点14',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(15,1,1,'16516','大sad ',1,NULL,NULL,'2023-03-17 14:27:35','2023-03-17 14:27:35'),(16,1,1,'上门安装','住址',2,'好的','2023-03-17 15:14:54','2023-03-17 15:13:02','2023-03-17 15:13:02');

/*Table structure for table `qianyi_yuyue` */

DROP TABLE IF EXISTS `qianyi_yuyue`;

CREATE TABLE `qianyi_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qianyi_yuyue_uuid_number` varchar(200) DEFAULT NULL COMMENT '报名唯一编号 Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `qianyi_yuyue_text` text COMMENT '理由',
  `qianyi_yuyue_yesno_types` int(11) DEFAULT NULL COMMENT '报名状态 Search111 ',
  `qianyi_yuyue_yesno_text` text COMMENT '审核回复',
  `qianyi_yuyue_shenhe_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '活动报名时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='迁移申请';

/*Data for the table `qianyi_yuyue` */

insert  into `qianyi_yuyue`(`id`,`qianyi_yuyue_uuid_number`,`yonghu_id`,`qianyi_yuyue_text`,`qianyi_yuyue_yesno_types`,`qianyi_yuyue_yesno_text`,`qianyi_yuyue_shenhe_time`,`insert_time`,`create_time`) values (1,'1679033271793',2,'理由1',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(2,'1679033271841',3,'理由2',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(3,'1679033271806',3,'理由3',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(4,'1679033271831',3,'理由4',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(5,'1679033271824',3,'理由5',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(6,'1679033271841',3,'理由6',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(7,'1679033271779',3,'理由7',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(8,'1679033271800',3,'理由8',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(9,'1679033271841',1,'理由9',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(10,'1679033271811',3,'理由10',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(11,'1679033271813',2,'理由11',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(12,'1679033271820',2,'理由12',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(13,'1679033271812',3,'理由13',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(14,'1679033271823',2,'理由14',1,NULL,NULL,'2023-03-17 14:07:51','2023-03-17 14:07:51'),(15,'1679037202020',1,'我要换地方',3,'不行','2023-03-17 15:15:56','2023-03-17 15:13:27','2023-03-17 15:13:27');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '儿童id',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','sb5t5bex7n0cgbi39au4i6f0msgw6jon','2023-03-17 14:13:48','2023-03-17 16:11:39'),(2,1,'admin','users','管理员','3vyoixabv9bere2yjk6kof0lbqlkw98x','2023-03-17 14:27:43','2023-03-17 16:21:07'),(3,1,'a1','yewurenyuan','业务人员','nxgvmgyr4v2u6yrbdza94ilki2ab83jr','2023-03-17 14:53:28','2023-03-17 16:16:12');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2023-03-17 14:07:34');

/*Table structure for table `yewurenyuan` */

DROP TABLE IF EXISTS `yewurenyuan`;

CREATE TABLE `yewurenyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yewurenyuan_name` varchar(200) DEFAULT NULL COMMENT '业务人员姓名 Search111 ',
  `yewurenyuan_phone` varchar(200) DEFAULT NULL COMMENT '业务人员手机号',
  `yewurenyuan_id_number` varchar(200) DEFAULT NULL COMMENT '业务人员身份证号',
  `yewurenyuan_photo` varchar(200) DEFAULT NULL COMMENT '业务人员头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yewurenyuan_email` varchar(200) DEFAULT NULL COMMENT '业务人员邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='业务人员';

/*Data for the table `yewurenyuan` */

insert  into `yewurenyuan`(`id`,`username`,`password`,`yewurenyuan_name`,`yewurenyuan_phone`,`yewurenyuan_id_number`,`yewurenyuan_photo`,`sex_types`,`new_money`,`yewurenyuan_email`,`create_time`) values (1,'a1','123456','业务人员姓名1','17703786901','410224199010102001','upload/yewurenyuan1.jpg',2,'730.22','1@qq.com','2023-03-17 14:07:51'),(2,'a2','123456','业务人员姓名2','17703786902','410224199010102002','upload/yewurenyuan2.jpg',1,'671.68','2@qq.com','2023-03-17 14:07:51'),(3,'a3','123456','业务人员姓名3','17703786903','410224199010102003','upload/yewurenyuan3.jpg',1,'865.95','3@qq.com','2023-03-17 14:07:51');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '用户邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`new_money`,`yonghu_email`,`create_time`) values (1,'a1','123456','用户姓名1','17703786901','410224199010102001','upload/yonghu1.jpg',2,'557.38','1@qq.com','2023-03-17 15:14:26'),(2,'a2','123456','用户姓名2','17703786902','410224199010102002','upload/yonghu2.jpg',2,'293.08','2@qq.com','2023-03-17 14:07:51'),(3,'a3','123456','用户姓名3','17703786903','410224199010102003','upload/yonghu3.jpg',1,'975.36','3@qq.com','2023-03-17 14:07:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
