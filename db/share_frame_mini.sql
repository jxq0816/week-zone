/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : share_frame_mini

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-22 15:10:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('0415e819cf0b4cd2853f90e0131ec197', '测试代码生成业务数据表', 'curd', 'com.week7i.share', 'test', '', '测试', '测试', 'jiangxingqi', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2017-08-14 17:22:56', '1', '2017-08-15 11:02:11', '', '0');
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', '', '', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', '', '0');
INSERT INTO `gen_table` VALUES ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '9', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', '', null, '7', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'String', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', '', null, '2', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:59', null, '0');
INSERT INTO `gen_table_column` VALUES ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '8', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '5', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '10', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '1', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'String', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', '', null, '4', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '12', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:59', null, '0');
INSERT INTO `gen_table_column` VALUES ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'String', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', '', null, '3', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:58', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '11', '1', '2013-08-12 13:10:05', '1', '2017-08-14 16:59:59', null, '0');
INSERT INTO `gen_table_column` VALUES ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '济南市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', '50', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', '60', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型\0\0', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型\0\0', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型\0\0', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型\0\0', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型\0\0', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择\0', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型\0\0', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('03a6fe79fd374883929b2d1a4d1f9324', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:01:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('052a23c1ba70441aa29911eb26d8c2a7', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:00:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('07ed72d9ed57435cb583b7f6b205829f', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-15 11:16:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('08bd7f88e998475f8704dbeaaa350f1e', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 17:00:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0998859577f8442ab5506099aa9b9ca2', '1', '系统设置-系统设置-字典管理', '1', '2017-08-14 18:53:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0c8d20984fe441b29e6a7b5c7be7ed05', '1', '代码生成-生成示例-树结构', '1', '2017-08-14 16:42:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0daed99cd54a468aa4998ab2c9d7ea0c', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 16:35:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('100f410b12cf4357bc01820128ad7b38', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 10:47:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('121c6d6473674f25b0eef17fc85a29bf', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 10:47:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1296f0d23a514ca4bd20548ba40b0001', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 11:01:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('143f3c762d044afbb3fb6064c393326f', '1', '代码生成-生成示例-主子表', '1', '2017-08-14 16:42:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('154e40b27e274ad189ed8246db8bf039', '1', '测试代码生成', '1', '2017-08-14 18:47:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('15c5d85a2f454d2a8b721e4190c8b513', '1', '代码生成-生成示例-主子表', '1', '2017-08-15 10:56:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('16d68cf9184f4f279acf31cef1e0e6f7', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 18:47:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1723ede973d84d0788c6b378768bba89', '1', '系统设置-机构用户-机构管理', '1', '2017-08-14 18:41:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17929a2ff87d4fc6a879ce0456f77d52', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:00:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('180f59c2f1d040039e35118428328def', '1', '代码生成-生成示例-单表-查看', '1', '2017-08-14 18:45:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('19267f3756e64419849d3e7c46201683', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-08-14 18:41:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('1b556bd68e364ed8996428a0dcfd9d26', '1', '系统设置-系统设置-菜单管理-修改', '1', '2017-08-14 18:43:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/save', 'POST', 'id=&parent.id=1&parent.name=功能菜单&name=测试代码生成&href=/test/testData/list&target=&icon=&sort=5030&isShow=1&permission=&remarks=', '');
INSERT INTO `sys_log` VALUES ('202f45b36d9c47f6963f27b8abd5b2b7', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-14 18:41:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('231cb7285bb148c5b6f8deb3bf168516', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:52:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('25d98f99ba7d47de873c928f6124145d', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 17:30:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('28eac7d1f18b4d6ca854364c5a35abbc', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 11:01:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2948398bba8b4247b4572a9dd899ab7f', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 18:37:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2d8766c0a7a84bf38379240e27e98111', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 18:30:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2d92eedfc7f04aeb83758b7f5d8d3e59', '1', '系统设置-系统设置-菜单管理-修改', '1', '2017-08-14 18:53:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/delete', 'GET', 'id=d5bc217b1bac4923a460c0f711366e65', '');
INSERT INTO `sys_log` VALUES ('2ec86f6f534e441ca34d51816354b549', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 18:44:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3670e61358dc40cfbea9df598304cf89', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-14 18:51:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('38b3793853f845ee8057daf15dccaf37', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 16:42:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('39ec6543d198438bbe8695ab9125e1ff', '1', '代码生成-生成示例-单表-编辑', '1', '2017-08-14 18:46:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/save', 'POST', 'id=&user.id=2&user.name=管理员&office.id=5&office.name=技术部&area.id=6&area.name=高新区&name=test&sex=1&inDate=2017-08-14 18:46:36&remarks=', '');
INSERT INTO `sys_log` VALUES ('3a5586533afe43a5acc6da90bba60090', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 18:37:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4258609aef994758867e81ef82b68d9f', '1', '代码生成-生成示例-主子表-查看', '1', '2017-08-15 10:58:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('426949489c4b48cd97aadbc753665ddf', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 11:14:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('443205fa7ef54ac998bffa232b0f029b', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:41:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('48bbb242331f401db31ad54876d99a56', '1', '代码生成-生成示例-单表-查看', '1', '2017-08-14 18:44:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4901a74b839d470c960a6a710ba70505', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 18:51:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4995a85de9b9439fa0af36207a06eb86', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:01:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4c3dacf621134e77b4d20b2179447355', '1', '代码生成-生成示例-主子表', '1', '2017-08-15 10:48:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4e497c4d6c1c4bada1901ed7388ec355', '1', '代码生成-生成示例-单表', '1', '2017-08-15 10:56:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('518e496589da47159290c0f31feaf3f0', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 18:57:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('546067fdacd7436faab6b15433773f69', '1', '系统设置-机构用户-用户管理', '1', '2017-08-15 10:47:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5a3e447149994c56bd2b0cc3665e1d8a', '1', '我的面板-个人信息-个人信息', '1', '2017-08-15 10:45:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d1f8b5d592e45a39062d7f025fd3cc8', '1', '代码生成-生成示例-单表', '1', '2017-08-14 16:42:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('60c50672a8e84a589fc35c61b55bfdcb', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 18:41:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('615149ea2dc448aca72bac1df9616149', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-15 11:16:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('620d46fb9ebe42ca9fbdc74f186b64be', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 18:34:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('62cc731bb5784335b19106c24ccc2b73', '1', '我的面板-个人信息-个人信息', '1', '2017-08-15 11:06:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('647d81fd19764c8fa8e5620b69b8a410', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 10:48:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('64b16b4604d842dbabba96e77e062d7d', '1', '系统登录', '1', '2017-08-14 18:44:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('66408b8226534d749b4a830970add30c', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:13:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6644061f90ab44c3af8b286da8943ffa', '1', '系统设置-机构用户-用户管理', '1', '2017-08-14 18:53:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('66f9153605254718952b3ffaebc45751', '1', '代码生成-生成示例-单表-查看', '1', '2017-08-14 18:57:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/form', 'GET', 'id=a7684a78d659459a9725037eba8e1e47', '');
INSERT INTO `sys_log` VALUES ('6a58550cb7e6462a9b20d2d21371c7f7', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-08-15 11:17:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/form', 'GET', 'parent.id=80', '');
INSERT INTO `sys_log` VALUES ('71c4cde507a249d392b609362bfc5393', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 16:50:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('72bf794fa4744075a45a5061a8fdc395', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:07:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('73e8bb284c70484ab55c5020fd888195', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 11:01:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('74a8a8530aac41aab642983a84820910', '1', '系统设置-日志查询-日志查询', '1', '2017-08-14 18:49:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('77bda706945f48a8b37b5d17a44d322e', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:53:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('78815774d85a4faeb76d9a92833b1c8f', '1', '系统设置-机构用户-用户管理', '1', '2017-08-14 18:41:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7951fefdbcd84615bc42207eaef48517', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-08-14 18:43:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/form', 'GET', 'id=ba8092291b40482db8fe7fc006ea3d76', '');
INSERT INTO `sys_log` VALUES ('7b15a84996ea495a968d82776177c416', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 10:59:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7b3896ca8b384d0bad45e2a599de3cdb', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 17:30:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7d865a1c4ca14cb2b8c7f88f1f445926', '1', '系统设置-机构用户-用户管理', '1', '2017-08-14 18:47:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7dc5a5bfd4b54196a53356762c28f224', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-08-14 18:41:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('80bd84091a1849d3b974221ac4f6e6bf', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-08-14 18:44:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/form', 'GET', 'id=29', '');
INSERT INTO `sys_log` VALUES ('84b6375af1c9493492a2fa72b6504f25', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 10:58:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('86fec0901e104d5ca6618aa2d51bbd9b', '1', '系统设置-机构用户-用户管理', '1', '2017-08-15 11:06:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8945abc73dca495fa1b52e88196afe13', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 10:48:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('89bf905e61484f50a414e60ecb1a637c', '1', '测试代码生成', '1', '2017-08-14 18:51:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8a0096b1ccdc4eb6b16174604710c862', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:50:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8ecde971c00f43c88735bc552b7fb755', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 18:51:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('90cfa7ec467e406fa9494e3cc38471ac', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 10:59:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('921d6c013bea4e9c8e6927a6acb9bff8', '1', '代码生成-生成示例-树结构', '1', '2017-08-14 16:42:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('925d6bbac8e9448aa88400cd404f93cf', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 11:01:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9261d0b02bbb417fab7378c9b37d78b4', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 16:40:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('991b87ccaf984d03aa552c9b7e6c03c2', '1', '代码生成-生成示例-单表', '1', '2017-08-15 10:48:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9a9340a02c974dcb8178360183d9632c', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 18:34:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9cd592d70f8a413e97b0b5a87a2975d0', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 11:14:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e434a015e164da5b44f6a951eb39968', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 16:24:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e65fdb3f946496b849c08f0f860b2fc', '1', '系统设置-日志查询-日志查询', '1', '2017-08-14 18:50:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9eef6bc8aa3e49e7964cce8a76a58ac1', '1', '系统设置-机构用户-用户管理', '1', '2017-08-14 18:57:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a38b2467d725437d939e65dbc93006b4', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-14 18:53:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aa20b9655764430cbded7c4c1222d6c1', '1', '代码生成-生成示例-单表-查看', '1', '2017-08-14 18:57:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ab39b2ee2d974817b4c5e83ef82a45f1', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-14 18:41:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aeaa23f6786b4b629a79bde4dff11777', '1', '代码生成-生成示例-单表-查看', '1', '2017-08-14 18:46:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('b0f16ed31b4b4d03b60c6b8e3b918456', '1', '测试代码生成', '1', '2017-08-14 18:53:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b1a4b71c18c745a88770c62da86925a3', '1', '系统登录', '1', '2017-08-15 10:44:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b320c4d8f7834126a4e02889dc218f0f', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:42:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b694553d56304cdb901f1bf15e286039', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:53:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ba300bc08022406ca718c9cfea0f3274', '1', '代码生成-生成示例-单表', '1', '2017-08-14 18:37:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bda3d1f8e39e488db653078e5b7c234b', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-08-14 18:42:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/form', 'GET', 'id=20', '');
INSERT INTO `sys_log` VALUES ('beb542fe6c5f4edeb9d81eb2fedbb4cd', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:42:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c4302c0f1cfe44ddace48d2c1c6fb160', '1', '我的面板-个人信息-个人信息', '1', '2017-08-14 16:49:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c667c4f1722d42a8973f27a93bf0f89e', '1', '代码生成-生成示例-单表', '1', '2017-08-15 10:47:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c93c4f234dbb453fba6e0b8c108bcd59', '1', '代码生成-生成示例-主子表', '1', '2017-08-15 10:58:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d0755557f5474f0ab63887c7bee30387', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 17:29:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d0801edc69cc429396f6194b54977daa', '1', '代码生成-生成示例-单表', '1', '2017-08-14 18:51:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d1587c14726744e881dae313213c1fea', '1', '代码生成-生成示例-单表', '1', '2017-08-15 10:56:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d1ea8581094b4fe79611d292683bc345', '1', '系统设置-机构用户-用户管理', '1', '2017-08-14 18:41:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d28b55a7688446aa8c5a2d742d5bdf84', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 16:41:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d35e930dfd854cda94064b1bcd26ae08', '1', '系统登录', '1', '2017-08-14 16:24:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d3b273a6098a40968d83254435bc6889', '1', '系统设置-系统设置-菜单管理-查看', '1', '2017-08-14 18:42:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d6252430356a410780a4d3a2453f8b59', '1', '代码生成-生成示例-主子表', '1', '2017-08-15 10:56:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d991e340d6424c1ba955a420da35dc6f', '1', '代码生成-生成示例-树结构', '1', '2017-08-14 16:42:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d9d20f152f4243d0abcdd48800a6b70c', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-15 11:06:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('df857ca2867c4d19bbd34b4156aaa718', '1', '代码生成-生成示例-树结构', '1', '2017-08-15 10:48:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e032560075854e299f93cc4323788857', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-14 18:57:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e0c23476793246a296ccb96119597637', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-14 18:37:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e3ed49bfa3ba4fcbb2559ee133755078', '1', '我的面板-个人信息-个人信息', '1', '2017-08-15 10:45:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ecd792263722430a9ff63aa8c0757f1a', '1', '代码生成-代码生成-生成方案配置', '1', '2017-08-15 11:01:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('efcbc418d2db47299dda7fc3bbba32d3', '1', '系统设置-系统设置-菜单管理', '1', '2017-08-14 18:43:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f0c6bf3eb9964ab39d305c8e86f07943', '1', '系统设置-机构用户-用户管理', '1', '2017-08-15 11:16:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f32242819a864e8d9ab4655a36324ffe', '1', '代码生成-生成示例-主子表', '1', '2017-08-14 16:42:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f3290bac2a0b4787b8304b27f433fa33', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-14 18:47:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f4c1945a4612496b95cd36b8e2a8cd3b', '1', '测试代码生成', '1', '2017-08-14 18:44:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f6bf4b16a7c640e9a8feb3dc057bfccd', '1', '代码生成-生成示例-单表', '1', '2017-08-14 16:42:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f9653d7727204918b8ec8f57363aca62', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-15 10:47:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fabe8e9e55bc4989b55398b6072a8b0c', '1', '测试代码生成', '1', '2017-08-14 18:45:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/test/testData/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fb154f78a5c74867ac7edfb0f757f1fd', '1', '代码生成-代码生成-业务表配置', '1', '2017-08-14 17:30:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fddc601c45a9460bb5c0436dbd97e839', '1', '系统设置-机构用户-用户管理', '1', '2017-08-14 18:51:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fe3ef59b65224d3f9963dce483bd54f7', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-08-15 10:47:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0', '/a/sys/user/list', 'GET', '', '');

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d5bc217b1bac4923a460c0f711366e65', '1', '0,1,', '测试代码生成', '5030', '/test/testData/list', '', '', '1', '', '1', '2017-08-14 18:43:39', '1', '2017-08-14 18:43:39', '', '1');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '山东省总公司', '10', '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '历城区分公司', '0', '4', '201000', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '历下区分公司', '40', '5', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '高新区分公司', '50', '6', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '济南市分公司', '20', '3', '200000', '1', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '76');
INSERT INTO `sys_role_menu` VALUES ('1', '77');
INSERT INTO `sys_role_menu` VALUES ('1', '78');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '80');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '83');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '85');
INSERT INTO `sys_role_menu` VALUES ('1', '86');
INSERT INTO `sys_role_menu` VALUES ('1', '87');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '72');
INSERT INTO `sys_role_menu` VALUES ('2', '73');
INSERT INTO `sys_role_menu` VALUES ('2', '74');
INSERT INTO `sys_role_menu` VALUES ('2', '75');
INSERT INTO `sys_role_menu` VALUES ('2', '76');
INSERT INTO `sys_role_menu` VALUES ('2', '77');
INSERT INTO `sys_role_menu` VALUES ('2', '78');
INSERT INTO `sys_role_menu` VALUES ('2', '79');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '80');
INSERT INTO `sys_role_menu` VALUES ('2', '81');
INSERT INTO `sys_role_menu` VALUES ('2', '82');
INSERT INTO `sys_role_menu` VALUES ('2', '83');
INSERT INTO `sys_role_menu` VALUES ('2', '84');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('2', '86');
INSERT INTO `sys_role_menu` VALUES ('2', '87');
INSERT INTO `sys_role_menu` VALUES ('2', '88');
INSERT INTO `sys_role_menu` VALUES ('2', '89');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '90');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '74');
INSERT INTO `sys_role_menu` VALUES ('3', '75');
INSERT INTO `sys_role_menu` VALUES ('3', '76');
INSERT INTO `sys_role_menu` VALUES ('3', '77');
INSERT INTO `sys_role_menu` VALUES ('3', '78');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '83');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '86');
INSERT INTO `sys_role_menu` VALUES ('3', '87');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'thinkgem', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', '2017-08-15 10:44:58', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data
-- ----------------------------
INSERT INTO `test_data` VALUES ('a7684a78d659459a9725037eba8e1e47', '2', '5', '6', 'test', '1', '2017-08-14', '1', '2017-08-14 18:46:39', '1', '2017-08-14 18:46:39', '', '0');

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data_main
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------
