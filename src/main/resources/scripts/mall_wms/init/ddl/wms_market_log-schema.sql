/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_market_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_sn` bigint(20) DEFAULT '0' COMMENT '订单ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '会员ID',
  `coin_type` tinyint(4) DEFAULT '0' COMMENT '货币类型',
  `balance` decimal(30,4) DEFAULT '0.0000' COMMENT '数量',
  `status` tinyint(1) DEFAULT '0' COMMENT '创建 锁定 取消 提交 确认',
  `remark` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包表';
