/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS `bms_coin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(254) DEFAULT NULL COMMENT '获取途径描述',
  `from_type` int(4) DEFAULT NULL COMMENT '获取途径类型',
  `coin_type` int(4) DEFAULT NULL COMMENT '奖励积分类型',
  `coin_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '获取奖励比率',
  `stick_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '持仓奖励比率',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-可用,1-不可用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1440 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='L值奖励配置表';
