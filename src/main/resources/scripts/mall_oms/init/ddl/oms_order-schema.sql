/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `total_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单总额（分）',
  `total_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '商品总数',
  `source_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源[0->PC订单；1->APP订单]',
  `status` int(11) NOT NULL DEFAULT '101' COMMENT '订单状态：\r\n101->待付款；\r\n102->用户取消；\r\n103->系统取消；\r\n201->已付款；\r\n202->申请退款；\r\n203->已退款；\r\n301->待发货；\r\n401->已发货；\r\n501->用户收货；\r\n502->系统收货；\r\n901->已完成；',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '订单备注',
  `member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员id',
  `freight_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT '运费金额（分）',
  `pay_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT '应付总额（分）',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付方式【1->微信jsapi；2->支付宝；3->余额； 4->微信app；】',
  `out_trade_no` varchar(32) DEFAULT NULL COMMENT '微信支付等第三方支付平台的商户订单号',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '微信支付订单号',
  `out_refund_no` varchar(32) DEFAULT NULL COMMENT '商户退款单号',
  `refund_id` varchar(32) DEFAULT NULL COMMENT '微信退款单号',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `reason` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT ' 取消原因',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除【0->正常；1->已删除】',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_order_sn` (`order_sn`) USING BTREE COMMENT '订单号唯一索引',
  UNIQUE KEY `index_otn` (`out_trade_no`) USING BTREE COMMENT '商户订单号唯一索引',
  UNIQUE KEY `index_ti` (`transaction_id`) USING BTREE COMMENT '商户支付单号唯一索引',
  UNIQUE KEY `index_orn` (`out_refund_no`) USING BTREE COMMENT '商户退款单号唯一索引',
  UNIQUE KEY `index_ri` (`refund_id`) USING BTREE COMMENT '退款单号唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
