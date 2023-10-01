/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS `pms_airdrop_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(254) DEFAULT NULL COMMENT '活动名称',
  `detail` json DEFAULT NULL COMMENT '活动描述',
  `spu_id` bigint(20) DEFAULT NULL COMMENT '奖励SpuId',
  `spu_count` tinyint(4) DEFAULT 1 COMMENT '奖励Spu数量',
  `coin_type` int(4) DEFAULT NULL COMMENT '奖励积分类型',
  `coin_count` decimal(20,4) DEFAULT '0.0000' COMMENT '获取积分',
  `sort` int(11) DEFAULT '0' COMMENT '活动排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '活动状态：0-未开启 1-进行中 2-已结束',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-可用,1-不可用',
  `started` datetime DEFAULT NULL COMMENT '活动开始时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='空投活动配置表';
