/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_order_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `delivery_company` varchar(64) NOT NULL DEFAULT '' COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '物流单号',
  `receiver_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `receiver_post_code` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_province` varchar(32) NOT NULL DEFAULT '' COMMENT '省份/直辖市',
  `receiver_city` varchar(32) NOT NULL DEFAULT '' COMMENT '城市',
  `receiver_region` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `receiver_detail_address` varchar(500) NOT NULL DEFAULT '' COMMENT '详细地址',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `delivery_status` tinyint(4) DEFAULT '0' COMMENT '物流状态【0->运输中；1->已收货】',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除【0->正常；1->已删除】',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单物流记录表';
