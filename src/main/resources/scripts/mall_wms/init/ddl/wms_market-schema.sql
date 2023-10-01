/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_market` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_sn` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(20) DEFAULT NULL COMMENT '会员名称',
  `op_type` tinyint(4) DEFAULT '0' COMMENT '订单类型0买单，1卖单',
  `coin_type` tinyint(4) DEFAULT '0' COMMENT '货币类型',
  `balance` decimal(30,4) DEFAULT '0.0000' COMMENT '数量',
  `fee` decimal(30,4) DEFAULT '0.0000' COMMENT '手续费',
  `buyer_id` bigint(20) DEFAULT '0' COMMENT '购买者ID',
  `buyer_name` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `single_price` decimal(30,4) DEFAULT '0.0000' COMMENT '单价',
  `total_price` decimal(30,4) DEFAULT '0.0000' COMMENT '总价',
  `buy_timed` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '订单状态',
  `step` tinyint(1) DEFAULT '0' COMMENT '订单阶段',
  `dispatch` tinyint(1) DEFAULT '0' COMMENT '是否派利',
  `ext` json DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包表';
