/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_member_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `type` tinyint(1) DEFAULT '0' COMMENT '0-NFT 1-盲盒',
  `spu_id` bigint(20) DEFAULT NULL,
  `hex_id` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
  `contract` varchar(255) DEFAULT NULL COMMENT '合约地址',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `hash` varchar(255) DEFAULT NULL,
  `item_no` varchar(20) DEFAULT NULL,
  `bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定状态:( 0:未绑定 1:绑定)',
  `inside` tinyint(1) DEFAULT '0' COMMENT '转赠状态:0-内部 1-外部',
  `transfer` tinyint(1) DEFAULT '0' COMMENT '转移状态 0未转移 1已转移',
  `status` tinyint(1) DEFAULT '0' COMMENT '铸造状态 0未铸造 1铸造中 2已铸造',
  `freeze_type` tinyint(1) DEFAULT '0' COMMENT '冻结类型:0-默认 1-市场 2-挖矿',
  `freeze` tinyint(1) DEFAULT '0' COMMENT '冻结状态:0- 未冻结 1-已冻结',
  `started` datetime DEFAULT NULL COMMENT '开始时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`member_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
