/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_dict_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT '' COMMENT '字典项名称',
  `value` varchar(50) DEFAULT '' COMMENT '字典项值',
  `dict_code` varchar(50) DEFAULT '' COMMENT '字典编码',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0 停用 1正常）',
  `defaulted` tinyint(1) DEFAULT '0' COMMENT '是否默认（0否 1是）',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
