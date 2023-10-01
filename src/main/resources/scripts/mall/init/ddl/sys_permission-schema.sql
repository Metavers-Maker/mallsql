/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单模块ID\r\n',
  `url_perm` varchar(128) DEFAULT NULL COMMENT 'URL权限标识',
  `btn_perm` varchar(64) DEFAULT NULL COMMENT '按钮权限标识',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限表';
