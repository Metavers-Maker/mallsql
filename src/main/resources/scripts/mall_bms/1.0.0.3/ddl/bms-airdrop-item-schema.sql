
CREATE TABLE IF NOT EXISTS `bms_airdrop_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `airdrop_id` bigint(20) DEFAULT NULL COMMENT '空投活动Id',
  `member_id` bigint(20) NOT NULL COMMENT '用户id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT '空投spuId',
  `spu_count` int(4) DEFAULT NULL COMMENT '空投spu数量',
  `coin_type` int(4) DEFAULT NULL COMMENT '空投积分类型',
  `coin_count` decimal(20,4) DEFAULT '0.0000' COMMENT '空投积分数量',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0未空投，1已空投',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='空投任务表';
