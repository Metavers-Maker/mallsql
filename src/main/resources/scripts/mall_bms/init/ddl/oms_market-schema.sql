/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_market` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员id',
  `item_id` bigint(20) NOT NULL,
  `item_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '物品类型',
  `item_no` varchar(20) NOT NULL DEFAULT '0' COMMENT '物品NO',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `coin_type` tinyint(1) DEFAULT '0' COMMENT '币种',
  `coin_num` decimal(20,2) DEFAULT NULL COMMENT '币数量',
  `fee` decimal(20,2) DEFAULT '0' COMMENT '手续费率',
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `buyer_name` varchar(255) DEFAULT NULL,
  `buy_timed` datetime DEFAULT NULL COMMENT '购买时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
