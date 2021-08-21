/*
 Navicat Premium Data Transfer

 Source Server         : localhost-root
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : phone_store_demo

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 21/08/2021 16:07:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyer_address
-- ----------------------------
DROP TABLE IF EXISTS `buyer_address`;
CREATE TABLE `buyer_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
  `area_code` varchar(32) DEFAULT NULL COMMENT '地址编码',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='收货地址表';

-- ----------------------------
-- Records of buyer_address
-- ----------------------------
BEGIN;
INSERT INTO `buyer_address` VALUES (35, '张三', '1232512355', '北京市北京市海淀区168号306室', '110101', '2021-07-14 17:25:33', '2021-07-14 10:59:49');
INSERT INTO `buyer_address` VALUES (36, '李四', '1232512355', '北京市北京市海淀区168号306室', '110101', '2021-07-14 17:30:47', '2021-07-14 17:30:47');
INSERT INTO `buyer_address` VALUES (37, '王五', '13600990990', '内蒙古自治区呼和浩特市玉泉区168号2435室', '150104', '2021-07-15 09:52:05', '2021-07-15 08:29:00');
INSERT INTO `buyer_address` VALUES (38, '刘一', '14555667788', '贵州省铜仁市思南县哎嘿孤傲', '520624', '2021-07-15 09:50:06', '2021-07-15 09:50:06');
INSERT INTO `buyer_address` VALUES (39, '刘一3', '14383451231', '台湾省台南市北区123室', '710304', '2021-07-15 10:28:19', '2021-07-15 10:28:09');
COMMIT;

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL,
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
  `phone_id` int(11) DEFAULT NULL COMMENT '商品编号',
  `phone_name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `phone_quantity` int(11) DEFAULT NULL COMMENT '商品数量',
  `phone_icon` varchar(512) DEFAULT NULL COMMENT '商品小图',
  `specs_id` int(11) DEFAULT NULL COMMENT '规格编号',
  `specs_name` varchar(32) DEFAULT NULL COMMENT '规格名称',
  `specs_price` decimal(8,2) DEFAULT NULL COMMENT '规格单价',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态，默认0未支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of order_master
-- ----------------------------
BEGIN;
INSERT INTO `order_master` VALUES ('1626259977126441443', '张三', '13656565656', '打了款i金币；哦啊额日u回个话吧', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 280000.00, 2800.00, 0, '2020-04-01 18:03:08', '2021-07-14 18:52:02');
INSERT INTO `order_master` VALUES ('1626260160979588281', 'lisi', '13656565656', '打了款i金币；哦啊额日u回个话吧', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 280000.00, 2800.00, 1, '2020-04-01 18:03:08', '2021-07-14 19:27:07');
INSERT INTO `order_master` VALUES ('1626310560353790284', '王五', '13600990990', '北京市北京市海淀区168号2435室', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 280000.00, 2810.00, 1, '2020-04-01 18:03:08', '2021-07-15 09:10:08');
INSERT INTO `order_master` VALUES ('1626310861083748009', '李六', '13600990990', '北京市北京市海淀区168号2435室', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 280000.00, 2810.00, 1, '2020-04-01 18:03:08', '2021-07-15 09:08:39');
INSERT INTO `order_master` VALUES ('1626314240793675224', '李四', '1232512355', '北京市北京市海淀区168号306室', 1, 'Honor 8A', 3, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 2, '64GB', 320000.00, 9610.00, 1, '2020-04-01 18:03:08', '2021-07-15 09:57:28');
INSERT INTO `order_master` VALUES ('1626314428611151685', '刘一', '14555667788', '贵州省铜仁市思南县哎嘿孤傲', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 2, '64GB', 320000.00, 3210.00, 0, '2020-04-01 18:03:08', '2021-07-15 09:57:20');
INSERT INTO `order_master` VALUES ('1626315020067903154', '刘一', '14555667788', '贵州省铜仁市思南县哎嘿孤傲', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 280000.00, 2810.00, 0, '2020-04-01 18:03:08', '2021-07-15 10:02:51');
INSERT INTO `order_master` VALUES ('1626315428976211566', '王五', '13600990990', '内蒙古自治区呼和浩特市玉泉区168号2435室', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 2, '64GB', 320000.00, 3210.00, 0, '2020-04-01 18:03:08', '2021-07-15 10:10:20');
INSERT INTO `order_master` VALUES ('1626315437092886678', '王五', '13600990990', '内蒙古自治区呼和浩特市玉泉区168号2435室', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 2, '64GB', 320000.00, 3210.00, 0, '2020-04-01 18:03:08', '2021-07-15 10:17:08');
INSERT INTO `order_master` VALUES ('1626315452722763005', '王五', '13600990990', '内蒙古自治区呼和浩特市玉泉区168号2435室', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 2, '64GB', 320000.00, 3210.00, 1, '2020-04-01 18:03:08', '2021-07-15 10:18:22');
INSERT INTO `order_master` VALUES ('1626316101820174302', '刘一3', '14383451231', '台湾省台南市北区123室', 1, 'Honor 8A', 4, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 280000.00, 11210.00, 1, '2020-04-01 18:03:08', '2021-07-15 10:28:29');
INSERT INTO `order_master` VALUES ('1629531005156787900', '刘一', '14555667788', '贵州省铜仁市思南县哎嘿孤傲', 1, 'Honor 8A', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 2, '64GB', 320000.00, 3210.00, 1, '2020-04-01 18:03:08', '2021-08-21 15:30:12');
INSERT INTO `order_master` VALUES ('3ee5863ae76a4dcbbc9dcee4b25720e0', 'zhangsan', '13630704543', 'ualisrhbar', 1, 'Honor 8A', 2, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '32GB', 320000.00, 6400.00, 0, '2021-07-14 12:25:58', '2021-07-14 12:32:49');
COMMIT;

-- ----------------------------
-- Table structure for phone_category
-- ----------------------------
DROP TABLE IF EXISTS `phone_category`;
CREATE TABLE `phone_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL COMMENT '类目名称',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uqe_category_type` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='类目表';

-- ----------------------------
-- Records of phone_category
-- ----------------------------
BEGIN;
INSERT INTO `phone_category` VALUES (1, '魅焰红', 1, '2020-04-01 18:39:43', '2020-04-01 20:35:54');
INSERT INTO `phone_category` VALUES (2, '极光蓝', 2, '2020-04-01 18:39:43', '2020-04-01 20:35:54');
INSERT INTO `phone_category` VALUES (3, '铂光金', 3, '2020-04-01 18:39:43', '2020-04-01 20:35:54');
INSERT INTO `phone_category` VALUES (4, '幻夜黑', 4, '2020-04-01 18:39:43', '2020-04-01 20:35:54');
COMMIT;

-- ----------------------------
-- Table structure for phone_info
-- ----------------------------
DROP TABLE IF EXISTS `phone_info`;
CREATE TABLE `phone_info` (
  `phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_name` varchar(64) NOT NULL COMMENT '商品名称',
  `phone_price` decimal(8,2) NOT NULL COMMENT '商品单价',
  `phone_description` varchar(64) DEFAULT NULL COMMENT '描述',
  `phone_stock` int(11) NOT NULL COMMENT '库存',
  `phone_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `phone_tag` varchar(512) DEFAULT NULL COMMENT '标签',
  PRIMARY KEY (`phone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of phone_info
-- ----------------------------
BEGIN;
INSERT INTO `phone_info` VALUES (1, 'Honor 8A', 2800.00, '魅焰红', 1, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', 1, '2020-04-01 18:03:08', '2021-08-21 15:30:05', '720P珍珠屏&Micro USB接口');
INSERT INTO `phone_info` VALUES (2, 'Honor 10 青春版', 2800.00, '极光蓝', 100, '../static/8f0bd0d0-a11e-4185-927e-04b54ff4a1bd.jpg', 2, '2020-04-01 18:03:08', '2020-04-01 22:30:42', '720P珍珠屏&EMUI9 Lite');
INSERT INTO `phone_info` VALUES (3, 'Honor V20', 3450.00, '铂光金', 100, '../static/fd7fee3c-a35c-477b-b007-9fda6e9c589a.jpg', 3, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '2+1独立三卡槽');
INSERT INTO `phone_info` VALUES (4, 'HUAWEI Mate 20 Pro', 4550.00, '幻夜黑', 100, '../static/cb819ad9-ec6f-4123-a4e9-aa629e2f8224.jpg', 4, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '内存3GB&EMUI9 Lite');
INSERT INTO `phone_info` VALUES (5, 'HUAWEI nova 5 Pro', 5450.00, '魅焰红', 100, '../static/8a0f5be0-3c78-4f23-b58b-dc2a92f1f95a.jpg', 1, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '内存3GB&Micro USB接口');
INSERT INTO `phone_info` VALUES (6, 'HUAWEI P30', 8700.00, '极光蓝', 100, '../static/6dcad185-315f-40f0-87f2-52910f49c8b7.jpg', 2, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '720P珍珠屏&内存3GB');
INSERT INTO `phone_info` VALUES (7, 'HUAWEI P30 Pro', 8988.00, '铂光金', 100, '../static/b12a46a9-3738-49ab-ab3a-6878539bd76b.jpg', 3, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '720P珍珠屏&Micro USB接口');
INSERT INTO `phone_info` VALUES (8, 'HUAWEI 畅想9 Plus', 2760.00, '幻夜黑', 100, '../static/15a5dcf2-4b50-41a0-93e8-08df97c21341.jpg', 4, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '内存3GB&存储32GB');
INSERT INTO `phone_info` VALUES (9, 'SAMSUNG G S10', 7254.00, '魅焰红', 100, '../static/a4f0cef8-59da-4f7c-abfa-d373f6648035.jpg', 1, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '720P珍珠屏&存储32GB');
INSERT INTO `phone_info` VALUES (10, 'OPPO K3', 2889.00, '极光蓝', 100, '../static/efc31538-a1f0-4dba-a673-4369f17e5708.jpg', 2, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '存储32GB&Micro USB接口');
INSERT INTO `phone_info` VALUES (11, 'Iphone XR', 9888.00, '铂光金', 100, '../static/4ef5a3c0-ad88-495f-a6bc-a31c1dde667b.jpg', 3, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '1300万像素&Micro USB接口');
INSERT INTO `phone_info` VALUES (12, 'MI 8', 5888.00, '幻夜黑', 100, '../static/aff8224c-3196-42a9-ae9e-4f06e20555c4.jpg', 4, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '内存3GB&存储32GB');
INSERT INTO `phone_info` VALUES (13, 'VIVO X27', 2888.00, '魅焰红', 100, '../static/cdf065ec-e409-4204-93e6-600e172e461a.jpg', 1, '2020-04-01 18:14:54', '2020-04-01 22:30:42', 'F/1.8光圈&Micro USB接口');
INSERT INTO `phone_info` VALUES (14, 'Iphone 6', 5678.00, '极光蓝', 100, '../static/899a9c64-62d0-416d-b320-e730b4585cb0.jpg', 2, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '720P珍珠屏&F/1.8光圈');
INSERT INTO `phone_info` VALUES (15, 'Iphone 7', 5576.00, '铂光金', 100, '../static/67aa6e9b-681f-4a6f-aae4-97eb3ec51b08.jpg', 3, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '720P珍珠屏&1300万像素');
INSERT INTO `phone_info` VALUES (16, 'Iphone 8', 6212.00, '幻夜黑', 100, '../static/a8b5b846-7fbb-4e7b-abcf-01ae73979000.jpg', 4, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '内存3GB&F/1.8光圈');
INSERT INTO `phone_info` VALUES (17, 'Meizu 16s', 1220.00, '魅焰红', 100, '../static/1a2b8e30-6e98-405f-9a18-9cd31ff96c35.jpg', 1, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '720P珍珠屏&Micro USB接口');
INSERT INTO `phone_info` VALUES (18, 'Iphone X', 6770.00, '极光蓝', 100, '../static/39197368-aeaf-48ea-b399-5ad65f7b6c47.jpg', 2, '2020-04-01 18:14:54', '2020-04-01 22:30:42', 'F/1.8光圈&Micro USB接口');
INSERT INTO `phone_info` VALUES (19, 'HUAWEI P20', 5580.00, '铂光金', 100, '../static/f382351b-7fc8-4b34-bcce-162085e75191.jpg', 3, '2020-04-01 18:14:54', '2020-04-01 22:30:42', '1300万像素&Micro USB接口');
COMMIT;

-- ----------------------------
-- Table structure for phone_specs
-- ----------------------------
DROP TABLE IF EXISTS `phone_specs`;
CREATE TABLE `phone_specs` (
  `specs_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_id` varchar(32) NOT NULL,
  `specs_name` varchar(64) NOT NULL COMMENT '规格名称',
  `specs_stock` int(11) NOT NULL COMMENT '库存',
  `specs_price` decimal(8,2) NOT NULL COMMENT '单价',
  `specs_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `specs_preview` varchar(512) DEFAULT NULL COMMENT '预览图',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`specs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='商品规格表';

-- ----------------------------
-- Records of phone_specs
-- ----------------------------
BEGIN;
INSERT INTO `phone_specs` VALUES (1, '1', '32GB', 0, 280000.00, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', '2021-07-15 10:28:21', '2020-04-01 22:16:36');
INSERT INTO `phone_specs` VALUES (2, '1', '64GB', 1, 320000.00, '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', '../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg', '2021-08-21 15:30:05', '2020-04-01 22:16:36');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
