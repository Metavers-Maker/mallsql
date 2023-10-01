/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_order_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `pay_sn` varchar(128) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `pay_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT '应付总额(分)',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
  `pay_status` tinyint(4) DEFAULT NULL COMMENT '支付状态',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `callback_content` text NOT NULL COMMENT '回调内容',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  `pay_subject` varchar(200) NOT NULL DEFAULT '' COMMENT '交易内容',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除【0->正常；1->已删除】',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付信息表';
