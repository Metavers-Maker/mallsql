/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_compound_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data` text COMMENT '规则',
  `spu_id` bigint(20) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '虚拟币类型0-元葱',
  `type_value` decimal(20,2) DEFAULT NULL COMMENT '数量',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用1-不可用',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
