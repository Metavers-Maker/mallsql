/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '' COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(128) DEFAULT '' COMMENT '路由路径',
  `component` varchar(128) DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(64) DEFAULT '' COMMENT '菜单图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `visible` tinyint(1) DEFAULT '1' COMMENT '状态：0-禁用 1-开启',
  `redirect` varchar(128) DEFAULT '' COMMENT '跳转路径',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单管理';
