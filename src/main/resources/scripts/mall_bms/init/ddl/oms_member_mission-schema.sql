/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_member_mission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT '0' COMMENT '会员id',
  `mission_config_id` bigint(20) DEFAULT '0' COMMENT '关联任务id',
  `mission_group_id` bigint(20) DEFAULT '0' COMMENT '任务包id',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `content` json DEFAULT NULL COMMENT '用户上传的信息',
  `reward` tinyint(1) DEFAULT '0' COMMENT '是否发放奖励',
  `status` int(11) DEFAULT '0' COMMENT '任务状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
