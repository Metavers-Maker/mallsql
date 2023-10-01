CREATE TABLE IF NOT EXISTS `bms_bsn_swap` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `item_id` bigint(20) DEFAULT NULL COMMENT '物品ID',
    `item_no` varchar(20) DEFAULT NULL COMMENT '物品编号',
    `spu_id` bigint(20) DEFAULT NULL  COMMENT '商品ID',
    `spu_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
    `pic_url` varchar(255) DEFAULT NULL  COMMENT '封面图',
    `source_url` varchar(255) DEFAULT NULL  COMMENT '资源图',
    `token_id` varchar(64) DEFAULT NULL  COMMENT 'NFT-ID',
    `from_id` bigint(20) DEFAULT NULL COMMENT '源用户ID',
    `to_id` bigint(20) DEFAULT NULL COMMENT '目标用户ID',
    `from_addr` varchar(64) DEFAULT NULL COMMENT '源用户地址',
    `to_addr` varchar(64) DEFAULT NULL COMMENT '目标用户地址',
    `trans_type` tinyint(1) DEFAULT '0' COMMENT '转移类型 0首发，1寄售，2盲盒，3合成，4转赠',
    `status` tinyint(1) DEFAULT '0' COMMENT '转移状态',
    `created` datetime DEFAULT NULL,
    `updated` datetime DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
