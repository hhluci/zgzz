/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : seezoon-framework

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-08-31 16:13:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` varchar(32) NOT NULL COMMENT '文章编号',
  `title` varchar(200) DEFAULT NULL COMMENT '文章标题',
  `content` longtext COMMENT '文章内容',
  `search_keyword` varchar(500) DEFAULT NULL COMMENT '网站关键词',
  `search_content` varchar(500) DEFAULT NULL COMMENT '网站描述',
  `click` int(11) DEFAULT '0' COMMENT '阅读次数',
  `reply` int(11) DEFAULT '0' COMMENT '回复数量',
  `is_use` int(3) DEFAULT '0' COMMENT '是否使用',
  `category` varchar(32) DEFAULT NULL COMMENT '分类',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `id` (`id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category`) REFERENCES `content_artical_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('faa202f5083047c1a5d6a0abbe630423', 'ceshi', '3132rgeeeeeeeeeeeeeeeeeeggggggggggggggggggggggggggggggggggggggggggggggggggggg5fvds1v856rs1v5re6sv5sd3v15fds3v1f2d3s1vf2dh415db1vsdv02dsf1bv56s', '1', '1', '5', '0', '1', '8d1c5110dc534f2897ee21f09b07cb9e', 'yangxin', '2018-08-28 21:37:46', 'yang', '2018-08-31 11:21:14', null);

-- ----------------------------
-- Table structure for content_artical_category
-- ----------------------------
DROP TABLE IF EXISTS `content_artical_category`;
CREATE TABLE `content_artical_category` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '类名',
  `isuse` int(5) DEFAULT NULL COMMENT '是否使用',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `creat_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类';

-- ----------------------------
-- Records of content_artical_category
-- ----------------------------
INSERT INTO `content_artical_category` VALUES ('1', 'java开发', '1', '1', '', '2018-08-23 19:10:11', 'yang', '2018-08-23 19:10:14', null);
INSERT INTO `content_artical_category` VALUES ('10', '9', '98', '9', '8', '2018-08-24 13:25:14', '98', '2018-08-24 13:25:18', null);
INSERT INTO `content_artical_category` VALUES ('11', '87', '69', '867', '87', '2018-08-24 13:25:27', '6', '2018-08-24 13:25:31', null);
INSERT INTO `content_artical_category` VALUES ('2', 'php', '1', '1', '1', '2018-08-24 13:22:42', '1', '2018-08-24 13:22:47', null);
INSERT INTO `content_artical_category` VALUES ('3', '32', '23', '23', '23', '2018-08-24 13:23:09', '23', '2018-08-24 13:23:12', null);
INSERT INTO `content_artical_category` VALUES ('4', '45', '54', '54', '5', '2018-08-24 13:23:23', '5', '2018-08-24 13:23:28', null);
INSERT INTO `content_artical_category` VALUES ('4179eb5e3888434a89c1f4dd7cbc16b9', 'javaSpringBoot', '1', '1', 'yang', '2018-08-29 15:24:39', 'yang', '2018-08-31 10:06:36', null);
INSERT INTO `content_artical_category` VALUES ('5', '8', '78', '87', '78', '2018-08-24 13:23:39', '87', '2018-08-24 13:23:42', null);
INSERT INTO `content_artical_category` VALUES ('6', '87', '7', '8', '87', '2018-08-24 13:23:58', '87', '2018-08-24 13:24:01', null);
INSERT INTO `content_artical_category` VALUES ('7', '78', '87', '87', '87', '2018-08-24 13:24:09', '878', '2018-08-24 13:24:15', null);
INSERT INTO `content_artical_category` VALUES ('8', '78', '87', '87', '78', '2018-08-24 13:24:24', '87', '2018-08-24 13:24:28', null);
INSERT INTO `content_artical_category` VALUES ('8d1c5110dc534f2897ee21f09b07cb9e', 'yang', '1', '1', 'yang', '2018-08-28 21:24:46', 'yang', '2018-08-28 21:24:46', null);
INSERT INTO `content_artical_category` VALUES ('9', '910', '98', '9898', '89', '2018-08-24 13:25:01', '9', '2018-08-24 13:25:04', null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parent_id` varchar(32) NOT NULL COMMENT '父部门',
  `parent_ids` varchar(2000) NOT NULL COMMENT '父ids，按层级逗号分隔',
  `name` varchar(100) NOT NULL COMMENT '部门名称',
  `sort` int(10) NOT NULL COMMENT '排序',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `parent_ids` (`parent_ids`(255)),
  KEY `create_date` (`create_date`),
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='组织机构';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('12edb119120949bfb8717a5136c00bdd', 'fd3df3592662424ebbea1c4f92bbf4a0', '0,fd3df3592662424ebbea1c4f92bbf4a0', '总经办', '10', '1', '2018-04-17 20:51:02', '1', '2018-04-17 20:51:02', '');
INSERT INTO `sys_dept` VALUES ('d349d8d73640433b841cea467a177c48', 'fd3df3592662424ebbea1c4f92bbf4a0', '0,fd3df3592662424ebbea1c4f92bbf4a0', 'yang', '10', '1', '2018-08-18 17:58:59', '1', '2018-08-18 17:58:59', '');
INSERT INTO `sys_dept` VALUES ('d94717141aa1473fb9cd7b1d6dc08bbf', 'fd3df3592662424ebbea1c4f92bbf4a0', '0,fd3df3592662424ebbea1c4f92bbf4a0', '内容处', '10', '1', '2018-08-23 16:16:51', '1', '2018-08-23 16:16:51', '');
INSERT INTO `sys_dept` VALUES ('fd3df3592662424ebbea1c4f92bbf4a0', '0', '0,', '上征科技有限公司', '10', '1', '2018-04-17 20:50:54', '1', '2018-04-17 20:50:54', '');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `type` varchar(50) NOT NULL COMMENT '字典类型',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` char(1) NOT NULL COMMENT '是否启用1：是，0：否',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `create_date` (`create_date`),
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('305454e07215411a8019998f49f6574d', 'yes_no', '1', '是', '12', '1', '1', '2018-04-05 18:30:36', '1', '2018-04-07 17:38:00', '');
INSERT INTO `sys_dict` VALUES ('7696b22fec6548bbaf034a2d91889c07', 'yes_no', '0', '否', '11', '1', '1', '2018-04-06 08:43:50', '1', '2018-04-06 08:43:50', '');
INSERT INTO `sys_dict` VALUES ('9320f1dabe1948c3af76d0ae89bb6a1f', 'sys_user_type', '0', '系统管理员', '10', '1', '1', '2018-04-07 16:48:51', '1', '2018-04-15 00:13:37', '');
INSERT INTO `sys_dict` VALUES ('fd59350df7314c3d94cfd686d8fa1032', 'sys_user_type', '1', '普通用户', '10', '1', '1', '2018-04-07 16:49:04', '1', '2018-04-15 00:13:41', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `content_type` varchar(100) NOT NULL COMMENT '文件类型',
  `file_size` int(11) NOT NULL,
  `relative_path` varchar(200) NOT NULL COMMENT '地址',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`) USING BTREE,
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('196546ef198a429b9a553bd83bd7eaef', '958PICD58PICzHg_1024.jpg', 'image/jpeg', '93414', '/2018/08/18/196546ef198a429b9a553bd83bd7eaef.jpg', '1', '2018-08-18 17:57:21', '1', '2018-08-18 17:57:21', null);
INSERT INTO `sys_file` VALUES ('2b540b726cac4dd99e4670c15bb0d56c', 'anonymous.jpg', 'image/jpeg', '40767', '/2018/08/18/2b540b726cac4dd99e4670c15bb0d56c.jpg', '1', '2018-08-18 17:58:08', '1', '2018-08-18 17:58:08', null);
INSERT INTO `sys_file` VALUES ('e3a93d5106a34be3a40215f0aa23934d', '3b672f490e8f2e25c2284af600db2758 (1).png', 'image/png', '64472', '/2018/04/20/e3a93d5106a34be3a40215f0aa23934d.png', '1', '2018-04-20 19:03:08', '1', '2018-04-20 19:03:08', null);

-- ----------------------------
-- Table structure for sys_gen
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen`;
CREATE TABLE `sys_gen` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `table_name` varchar(32) NOT NULL COMMENT '表名',
  `pk_type` varchar(10) NOT NULL COMMENT '主键类型',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名',
  `module_name` varchar(10) NOT NULL COMMENT '模块名',
  `function_name` varchar(20) NOT NULL COMMENT '功能模块',
  `template` varchar(1) NOT NULL COMMENT '生成模板',
  `class_name` varchar(50) NOT NULL COMMENT '类名',
  `columns` text NOT NULL COMMENT '字段信息',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`) USING BTREE,
  KEY `create_by` (`create_by`),
  KEY `table_name` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成';

-- ----------------------------
-- Records of sys_gen
-- ----------------------------
INSERT INTO `sys_gen` VALUES ('d269f7fe1b4c43d4b41429cabdb93a9d', 'sys_menu', 'String', '菜单表', 'sys', 'menu', '1', 'SysMenu', '[{\"columnComment\":\"编号\",\"columnKey\":\"PRI\",\"columnType\":\"varchar(32)\",\"dataType\":\"varchar\",\"dbColumnName\":\"id\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"hidden\",\"insert\":\"1\",\"javaFieldName\":\"id\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"maxLength\":32,\"queryType\":\"\",\"sort\":10},{\"columnComment\":\"父级编号\",\"columnKey\":\"MUL\",\"columnType\":\"varchar(32)\",\"dataType\":\"varchar\",\"dbColumnName\":\"parent_id\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"parentId\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":32,\"queryType\":\"\",\"sort\":20,\"update\":\"1\"},{\"columnComment\":\"所有父级编号\",\"columnKey\":\"\",\"columnType\":\"varchar(2000)\",\"dataType\":\"varchar\",\"dbColumnName\":\"parent_ids\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"parentIds\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":2000,\"queryType\":\"\",\"sort\":30,\"update\":\"1\"},{\"columnComment\":\"名称\",\"columnKey\":\"\",\"columnType\":\"varchar(50)\",\"dataType\":\"varchar\",\"dbColumnName\":\"name\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"name\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":50,\"queryType\":\"\",\"sort\":40,\"update\":\"1\"},{\"columnComment\":\"排序\",\"columnKey\":\"\",\"columnType\":\"int(10)\",\"dataType\":\"int\",\"dbColumnName\":\"sort\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"sort\",\"javaType\":\"Integer\",\"jdbcType\":\"INTEGER\",\"list\":\"1\",\"queryType\":\"\",\"sort\":50,\"update\":\"1\"},{\"columnComment\":\"链接\",\"columnKey\":\"\",\"columnType\":\"varchar(200)\",\"dataType\":\"varchar\",\"dbColumnName\":\"href\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"href\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":200,\"nullable\":\"1\",\"queryType\":\"\",\"sort\":60,\"update\":\"1\"},{\"columnComment\":\"目标\",\"columnKey\":\"\",\"columnType\":\"varchar(10)\",\"dataType\":\"varchar\",\"dbColumnName\":\"target\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"target\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":10,\"nullable\":\"1\",\"queryType\":\"\",\"sort\":70,\"update\":\"1\"},{\"columnComment\":\"0：目录   1：菜单   2：按钮\",\"columnKey\":\"\",\"columnType\":\"varchar(2)\",\"dataType\":\"varchar\",\"dbColumnName\":\"type\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"type\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":2,\"queryType\":\"\",\"sort\":80,\"update\":\"1\"},{\"columnComment\":\"图标\",\"columnKey\":\"\",\"columnType\":\"varchar(50)\",\"dataType\":\"varchar\",\"dbColumnName\":\"icon\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"icon\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":50,\"nullable\":\"1\",\"queryType\":\"\",\"sort\":90,\"update\":\"1\"},{\"columnComment\":\"是否在菜单中显示\",\"columnKey\":\"\",\"columnType\":\"char(1)\",\"dataType\":\"char\",\"dbColumnName\":\"is_show\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"isShow\",\"javaType\":\"String\",\"jdbcType\":\"CHAR\",\"list\":\"1\",\"maxLength\":1,\"queryType\":\"\",\"sort\":100,\"update\":\"1\"},{\"columnComment\":\"权限标识\",\"columnKey\":\"\",\"columnType\":\"varchar(200)\",\"dataType\":\"varchar\",\"dbColumnName\":\"permission\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"permission\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"list\":\"1\",\"maxLength\":200,\"nullable\":\"1\",\"queryType\":\"\",\"sort\":110,\"update\":\"1\"},{\"columnComment\":\"创建者\",\"columnKey\":\"\",\"columnType\":\"varchar(32)\",\"dataType\":\"varchar\",\"dbColumnName\":\"create_by\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"createBy\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"maxLength\":32,\"queryType\":\"\",\"sort\":120},{\"columnComment\":\"创建时间\",\"columnKey\":\"\",\"columnType\":\"datetime\",\"dataType\":\"datetime\",\"dbColumnName\":\"create_date\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"createDate\",\"javaType\":\"Date\",\"jdbcType\":\"TIMESTAMP\",\"queryType\":\"\",\"sort\":130},{\"columnComment\":\"更新者\",\"columnKey\":\"\",\"columnType\":\"varchar(32)\",\"dataType\":\"varchar\",\"dbColumnName\":\"update_by\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"updateBy\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"maxLength\":32,\"queryType\":\"\",\"sort\":140,\"update\":\"1\"},{\"columnComment\":\"更新时间\",\"columnKey\":\"\",\"columnType\":\"datetime\",\"dataType\":\"datetime\",\"dbColumnName\":\"update_date\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"text\",\"insert\":\"1\",\"javaFieldName\":\"updateDate\",\"javaType\":\"Date\",\"jdbcType\":\"TIMESTAMP\",\"list\":\"1\",\"queryType\":\"\",\"sort\":150,\"update\":\"1\"},{\"columnComment\":\"备注信息\",\"columnKey\":\"\",\"columnType\":\"varchar(255)\",\"dataType\":\"varchar\",\"dbColumnName\":\"remarks\",\"dictType\":\"\",\"extra\":\"\",\"inputType\":\"textarea\",\"insert\":\"1\",\"javaFieldName\":\"remarks\",\"javaType\":\"String\",\"jdbcType\":\"VARCHAR\",\"maxLength\":255,\"nullable\":\"1\",\"queryType\":\"\",\"sort\":160,\"update\":\"1\"}]', '1', '2018-05-10 17:15:18', '1', '2018-05-10 17:15:18', null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parent_id` varchar(32) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(10) NOT NULL COMMENT '排序',
  `href` varchar(200) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '目标',
  `type` varchar(2) NOT NULL COMMENT '0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `parent_ids` (`parent_ids`(255)),
  KEY `name` (`name`),
  KEY `create_by` (`create_by`),
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0cbc3253fc1148c894cc954acfebdd92', '2112b91ae0ce4f8db8af99d304bca35c', '0,2b3712ac51b3440589a64bd6b12440832112b91ae0ce4f8db8af99d304bca35c', '删除', '10', null, null, '2', null, '1', 'sys:menu:delete', '1', '2018-04-19 14:47:47', '1', '2018-04-19 14:47:47', null);
INSERT INTO `sys_menu` VALUES ('0f030bf647b146e6873a3bb177d6fa90', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '角色管理', '2', '/pages/sys/role.html', 'main', '1', 'fa fa-fw fa-user-secret', '1', 'sys:role:qry', '1', '2018-04-15 00:07:38', '1', '2018-04-19 14:32:29', null);
INSERT INTO `sys_menu` VALUES ('0f42afb2182f423f8f203276058d1fe2', '11691595d4324f2f88d1f883d18f4e04', '0,2b3712ac51b3440589a64bd6b124408311691595d4324f2f88d1f883d18f4e04', '删除', '10', null, null, '2', null, '1', 'sys:dict:delete', '1', '2018-04-19 15:00:12', '1', '2018-04-19 15:14:36', null);
INSERT INTO `sys_menu` VALUES ('11691595d4324f2f88d1f883d18f4e04', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '字典管理', '5', '/pages/sys/dict.html', 'main', '1', 'fa fa-fw fa-database', '1', 'sys:dict:qry', '1', '2018-04-15 00:09:12', '1', '2018-04-19 14:56:03', null);
INSERT INTO `sys_menu` VALUES ('1b2c853db928496daa7f93a274cd1524', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '内容管理', '6', '#', 'main', '1', '', '1', 'content:edit', '1', '2018-08-23 16:14:12', '1', '2018-08-23 16:14:12', null);
INSERT INTO `sys_menu` VALUES ('2112b91ae0ce4f8db8af99d304bca35c', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '菜单管理', '4', '/pages/sys/menu.html', 'main', '1', 'fa fa-fw fa-tasks', '1', 'sys:menu:qry', '1', '2018-04-15 00:08:16', '1', '2018-04-19 14:46:59', null);
INSERT INTO `sys_menu` VALUES ('2b3712ac51b3440589a64bd6b1244083', '0', '0,', '系统管理', '2', null, null, '0', 'fa fa-fw fa-cogs', '1', '', '1', '2018-04-15 00:05:08', '1', '2018-04-16 20:41:55', null);
INSERT INTO `sys_menu` VALUES ('3266e16218e94fb28d8c6342c4ddbc61', '0f030bf647b146e6873a3bb177d6fa90', '0,2b3712ac51b3440589a64bd6b12440830f030bf647b146e6873a3bb177d6fa90', '添加', '10', null, null, '2', null, '1', 'sys:role:save', '1', '2018-04-19 14:36:23', '1', '2018-04-19 14:36:23', null);
INSERT INTO `sys_menu` VALUES ('3693fa53ff7c4146abc444230e5eb4b4', 'b916f2a5c9b84b98be54f829010ab5c8', '0,2b3712ac51b3440589a64bd6b1244083b916f2a5c9b84b98be54f829010ab5c8', '修改', '2', null, null, '2', null, '1', 'sys:user:update', '1', '2018-04-16 21:48:05', '1', '2018-04-16 21:48:05', null);
INSERT INTO `sys_menu` VALUES ('4845ecff299945679383569e97f863c4', '11691595d4324f2f88d1f883d18f4e04', '0,2b3712ac51b3440589a64bd6b124408311691595d4324f2f88d1f883d18f4e04', '修改', '10', null, null, '2', null, '1', 'sys:dict:update', '1', '2018-04-19 15:00:01', '1', '2018-04-19 15:00:01', null);
INSERT INTO `sys_menu` VALUES ('50646379e4ec4c299cde89f5eee3ca16', 'b916f2a5c9b84b98be54f829010ab5c8', '0,2b3712ac51b3440589a64bd6b1244083b916f2a5c9b84b98be54f829010ab5c8', '删除', '10', null, null, '2', null, '1', 'sys:user:delete', '1', '2018-04-16 21:51:02', '1', '2018-04-16 21:51:02', null);
INSERT INTO `sys_menu` VALUES ('5333b205d4044feab756c6ac6561ab05', '2112b91ae0ce4f8db8af99d304bca35c', '0,2b3712ac51b3440589a64bd6b12440832112b91ae0ce4f8db8af99d304bca35c', '修改', '10', null, null, '2', null, '1', 'sys:menu:update', '1', '2018-04-19 14:47:34', '1', '2018-04-19 14:47:34', null);
INSERT INTO `sys_menu` VALUES ('69baa5b46caf433093ff69ed533a8c0e', '0f030bf647b146e6873a3bb177d6fa90', '0,2b3712ac51b3440589a64bd6b12440830f030bf647b146e6873a3bb177d6fa90', '删除', '10', null, null, '2', null, '1', 'sys:role:delete', '1', '2018-04-19 14:36:48', '1', '2018-04-19 14:36:48', null);
INSERT INTO `sys_menu` VALUES ('7ba079aaa4054300aeabd0e4c3055bf8', '87bfa91d5d78468695adea15b6e20b38', '0,2b3712ac51b3440589a64bd6b124408387bfa91d5d78468695adea15b6e20b38', '修改', '10', null, null, '2', null, '1', 'sys:param:update', '1', '2018-04-19 15:06:27', '1', '2018-04-19 15:06:27', null);
INSERT INTO `sys_menu` VALUES ('7e644586cd144c9bb2f9819ad9a64718', '2112b91ae0ce4f8db8af99d304bca35c', '0,2b3712ac51b3440589a64bd6b12440832112b91ae0ce4f8db8af99d304bca35c', '添加', '10', null, null, '2', null, '1', 'sys:menu:save', '1', '2018-04-19 14:47:12', '1', '2018-04-19 14:47:12', null);
INSERT INTO `sys_menu` VALUES ('8059bd699a4444a0aaa2e103b0daada2', '87bfa91d5d78468695adea15b6e20b38', '0,2b3712ac51b3440589a64bd6b124408387bfa91d5d78468695adea15b6e20b38', '添加', '10', null, null, '2', null, '1', 'sys:param:save', '1', '2018-04-19 15:05:58', '1', '2018-04-19 15:05:58', null);
INSERT INTO `sys_menu` VALUES ('87bfa91d5d78468695adea15b6e20b38', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '系统参数', '10', '/pages/sys/param.html', 'main', '1', 'fa fa-fw fa-houzz', '1', 'sys:param:qry', '1', '2018-04-15 00:10:05', '1', '2018-04-19 14:56:03', null);
INSERT INTO `sys_menu` VALUES ('8e175bbb35494b6e9c74b64ab6ec0ce0', 'b916f2a5c9b84b98be54f829010ab5c8', '0,2b3712ac51b3440589a64bd6b1244083b916f2a5c9b84b98be54f829010ab5c8', '添加', '1', null, null, '2', null, '1', 'sys:user:save', '1', '2018-04-16 21:47:42', '1', '2018-04-16 21:47:42', null);
INSERT INTO `sys_menu` VALUES ('a25c853c31db4361914c824a0773cc07', '0f030bf647b146e6873a3bb177d6fa90', '0,2b3712ac51b3440589a64bd6b12440830f030bf647b146e6873a3bb177d6fa90', '修改', '10', null, null, '2', null, '1', 'sys:role:update', '1', '2018-04-19 14:36:37', '1', '2018-04-19 14:36:37', null);
INSERT INTO `sys_menu` VALUES ('a2a24773907f4f43856f7bbd2a9df767', '87bfa91d5d78468695adea15b6e20b38', '0,2b3712ac51b3440589a64bd6b124408387bfa91d5d78468695adea15b6e20b38', '删除', '10', null, null, '2', null, '1', 'sys:param:delete', '1', '2018-04-19 15:06:39', '1', '2018-05-10 09:57:23', null);
INSERT INTO `sys_menu` VALUES ('a33f081dcb7a439b96dad4e7a1e89e27', '11691595d4324f2f88d1f883d18f4e04', '0,2b3712ac51b3440589a64bd6b124408311691595d4324f2f88d1f883d18f4e04', '添加', '10', null, null, '2', null, '1', 'sys:dict:save', '1', '2018-04-19 14:59:49', '1', '2018-04-19 14:59:49', null);
INSERT INTO `sys_menu` VALUES ('b916f2a5c9b84b98be54f829010ab5c8', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '用户管理', '1', '/pages/sys/user.html', 'main', '1', 'fa fa-fw fa-user', '1', 'sys:user:qry', '1', '2018-04-15 00:05:46', '1', '2018-04-16 21:54:12', null);
INSERT INTO `sys_menu` VALUES ('b9f8b111a6c34a2a8ce42e280f7e3a33', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '文件管理', '10', '/pages/sys/file.html', 'main', '1', 'fa fa-fw fa-file', '1', 'sys:file:qry', '1', '2018-04-15 21:44:01', '1', '2018-04-19 14:56:03', null);
INSERT INTO `sys_menu` VALUES ('c27147c97283488f8787aea546e55f30', 'ec9045a36aab42bf9d33a0587ab956a7', '0,2b3712ac51b3440589a64bd6b1244083ec9045a36aab42bf9d33a0587ab956a7', '添加', '10', null, null, '2', null, '1', 'sys:dept:save', '1', '2018-04-19 14:40:21', '1', '2018-04-19 14:40:21', null);
INSERT INTO `sys_menu` VALUES ('c9f77f40397e4908ba8b580647275f27', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '代码生成', '10', '/pages/sys/gen.html', 'main', '1', 'fa fa-fw fa-optin-monster', '1', 'sys:gen', '1', '2018-04-26 22:19:45', '1', '2018-04-26 22:19:45', null);
INSERT INTO `sys_menu` VALUES ('e3b5184f60534bd4a3843e916fd361e8', 'ec9045a36aab42bf9d33a0587ab956a7', '0,2b3712ac51b3440589a64bd6b1244083ec9045a36aab42bf9d33a0587ab956a7', '删除', '10', null, null, '2', null, '1', 'sys:dept:delete', '1', '2018-04-19 14:40:54', '1', '2018-04-19 14:40:54', null);
INSERT INTO `sys_menu` VALUES ('eb4d200652b44122ad10fb98dbbc4cf5', 'b9f8b111a6c34a2a8ce42e280f7e3a33', '0,2b3712ac51b3440589a64bd6b1244083b9f8b111a6c34a2a8ce42e280f7e3a33', '上传', '10', null, null, '2', null, '1', 'sys:file:upload', '1', '2018-04-19 15:09:07', '1', '2018-04-19 15:09:07', null);
INSERT INTO `sys_menu` VALUES ('ec9045a36aab42bf9d33a0587ab956a7', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '部门管理', '3', '/pages/sys/dept.html', 'main', '1', 'fa fa-fw fa-cubes', '1', 'sys:dept:qry', '1', '2018-04-15 00:06:37', '1', '2018-04-20 19:06:11', null);
INSERT INTO `sys_menu` VALUES ('f6c0677f7e004d75aba2984c70122640', 'ec9045a36aab42bf9d33a0587ab956a7', '0,2b3712ac51b3440589a64bd6b1244083ec9045a36aab42bf9d33a0587ab956a7', '修改', '10', null, null, '2', null, '1', 'sys:dept:update', '1', '2018-04-19 14:40:36', '1', '2018-04-19 14:40:36', null);
INSERT INTO `sys_menu` VALUES ('f95bcb9b445549d5910e904476185ebf', 'b9f8b111a6c34a2a8ce42e280f7e3a33', '0,2b3712ac51b3440589a64bd6b1244083b9f8b111a6c34a2a8ce42e280f7e3a33', '删除', '10', null, null, '2', null, '1', 'sys:file:delete', '1', '2018-04-19 15:07:51', '1', '2018-04-19 15:07:51', null);

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `param_key` varchar(50) NOT NULL COMMENT '键',
  `param_value` varchar(100) NOT NULL COMMENT '值',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`) USING BTREE,
  KEY `create_by` (`create_by`),
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('91aca8587a40482883e0f51a53c1c2ea', '系统参数', 'key', 'value', '1', '2018-05-10 09:50:27', '1', '2018-05-10 09:50:27', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `data_scope` char(1) NOT NULL COMMENT '数据范围,0:全部，1：本部门，2：本部门及以下，3.本人',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `create_by` (`create_by`),
  KEY `create_date` (`create_date`),
  KEY `data_scope` (`data_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('39994f21c18a43efb07482762c650f2f', '内容管理', '1', '1', '2018-08-23 16:19:22', '1', '2018-08-23 16:19:22', '');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('39994f21c18a43efb07482762c650f2f', '1b2c853db928496daa7f93a274cd1524');
INSERT INTO `sys_role_menu` VALUES ('39994f21c18a43efb07482762c650f2f', '2b3712ac51b3440589a64bd6b1244083');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型，业务扩展用',
  `status` varchar(1) DEFAULT NULL COMMENT '状态1：正常，0：禁用',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE,
  KEY `dept_id` (`dept_id`) USING BTREE,
  KEY `create_by` (`create_by`),
  KEY `create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'd349d8d73640433b841cea467a177c48', 'admin', '2a576f34b098c24b4406bf0d5fa7cd31493f94df58ebe5b978435d1d5e5eab7a', 'rNBdNtjuefmwLGzXjHoN', '管理员', '121212', '/2018/04/16/e82d1a7bdb7343e7a27b4f1ecc9dae0c.jpg', '21221@qq.com', '0', '1', '1', '2017-12-29 14:22:04', '1', '2018-08-18 18:02:10', '');
INSERT INTO `sys_user` VALUES ('e7ed1fdf39414295adae66bdd15a631e', 'd94717141aa1473fb9cd7b1d6dc08bbf', 'content', '9bcf4de18460023c152cd64f60278d13cdbea9b848c02afbda52ba8af85ec554', 'bZxPuExzHJqH412wmAHR', '内容管理员', '15035161322', '', '179184037@qq.com', '1', '1', '1', '2018-08-23 16:18:42', '1', '2018-08-23 16:19:51', '');

-- ----------------------------
-- Table structure for sys_user_bak
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_bak`;
CREATE TABLE `sys_user_bak` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型，业务扩展用',
  `status` varchar(1) DEFAULT NULL COMMENT '状态1：正常，0：禁用',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user_bak
-- ----------------------------
INSERT INTO `sys_user_bak` VALUES ('1', 'd349d8d73640433b841cea467a177c48', 'admin', '2a576f34b098c24b4406bf0d5fa7cd31493f94df58ebe5b978435d1d5e5eab7a', 'rNBdNtjuefmwLGzXjHoN', '管理员', '121212', '/2018/04/16/e82d1a7bdb7343e7a27b4f1ecc9dae0c.jpg', '21221@qq.com', '0', '1', '1', '2017-12-29 14:22:04', '1', '2018-08-18 18:02:10', '');
INSERT INTO `sys_user_bak` VALUES ('e7ed1fdf39414295adae66bdd15a631e', 'd94717141aa1473fb9cd7b1d6dc08bbf', 'content', '9bcf4de18460023c152cd64f60278d13cdbea9b848c02afbda52ba8af85ec554', 'bZxPuExzHJqH412wmAHR', '内容管理员', '15035161322', '', '179184037@qq.com', '1', '1', '1', '2018-08-23 16:18:42', '1', '2018-08-23 16:18:42', '');
INSERT INTO `sys_user_bak` VALUES ('e7ed1fdf39414295adae66bdd15a631e', 'd94717141aa1473fb9cd7b1d6dc08bbf', 'content', '9bcf4de18460023c152cd64f60278d13cdbea9b848c02afbda52ba8af85ec554', 'bZxPuExzHJqH412wmAHR', '内容管理员', '15035161322', '', '179184037@qq.com', '1', '1', '1', '2018-08-23 16:18:42', '1', '2018-08-23 16:19:51', '');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('e7ed1fdf39414295adae66bdd15a631e', '39994f21c18a43efb07482762c650f2f');
