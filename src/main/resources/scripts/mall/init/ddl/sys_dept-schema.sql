/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父节点id',
  `tree_path` varchar(255) DEFAULT '' COMMENT '父节点id路径',
  `sort` int(11) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1-正常 0-禁用',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除状态：1-删除 0-未删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';
