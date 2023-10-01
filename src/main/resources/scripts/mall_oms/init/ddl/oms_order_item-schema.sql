/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `spu_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '0-NFT 1-盲盒',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `spu_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(64) DEFAULT NULL COMMENT '苹果商品ID',
  `sku_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '商品编码',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '规格名称',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `price` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品单价(单位：分)',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `total_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品总价(单位：分)',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除标识(1:已删除；0:正常)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单id索引'
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单商品信息表';
