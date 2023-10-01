/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) DEFAULT NULL COMMENT '角色编码',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '1' COMMENT '角色状态：0-正常；1-停用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识：0-未删除；1-已删除',
  `created` datetime DEFAULT NULL COMMENT '更新时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';
