/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_exchange_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `exchange_type` tinyint(2) DEFAULT '0' COMMENT '0-币物兑换 1-物币兑换',
  `coin_type` tinyint(1) DEFAULT '0' COMMENT '虚拟币类型0-元葱',
  `coin_value` decimal(20,2) DEFAULT NULL COMMENT '数量',
  `spu_id` bigint(20) DEFAULT NULL,
  `period_type` tinyint(1) DEFAULT '0' COMMENT '过期周期 0-天 1-永久',
  `period_value` int(20) DEFAULT '0' COMMENT '周期内允许兑换数量',
  `max_limit` int(20) DEFAULT '0' COMMENT '最大兑换数量',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用1-不可用',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-隐藏 1-可见',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_spu_id` (`spu_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
