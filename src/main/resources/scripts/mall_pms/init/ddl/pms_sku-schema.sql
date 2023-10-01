/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_sku` (
  `id` bigint(20) NOT NULL,
  `spu_id` bigint(20) NOT NULL COMMENT 'SPU ID',
  `name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `price` bigint(20) DEFAULT NULL COMMENT '商品价格(单位：分)',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品主图',
  `stock_num` int(11) DEFAULT '0' COMMENT '用于订单购买的可用sku库存数量',
  `locked_stock_num` int(11) DEFAULT '0' COMMENT '用于订单购买的锁定sku库存数量',
  `mint_num` int(11) DEFAULT '0' COMMENT '铸造数量',
  `visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示状态:( 0:隐藏 1:显示)',
  `closed` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_pms_sku_pms_spu` (`spu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品库存表';
