/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;
CREATE TABLE IF NOT EXISTS  `statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `record_time` bigint(20) DEFAULT NULL COMMENT '记录时间',
  `added_member_amount` bigint(20) DEFAULT NULL COMMENT '新增用户数',
  `sale_amount` bigint(20) DEFAULT NULL COMMENT '一级市场销售额',
  `order_amount` int(11) DEFAULT '0' COMMENT '一级市场订单数',
  `order_payed_amount` int(11) DEFAULT '0' COMMENT '一级市场支付订单数',
  `ordered_member_amount` int(11) DEFAULT '0' COMMENT '一级市场下单用户数',
  `sku_total_amount` int(11) NULL DEFAULT '0' COMMENT '藏品数量',
  `time_dimension` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:日，2:月',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_statistics` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='统计表';
