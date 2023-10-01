/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_member_mission_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `mission_group_id` bigint(20) DEFAULT '0' COMMENT '任务包ID',
  `percent` int(11) DEFAULT '0' COMMENT '任务进度0-100',
  `status` tinyint(1) DEFAULT '0' COMMENT '任务状态0进行中，1完成',
  `reward_status` tinyint(1) DEFAULT '0' COMMENT '奖励状态0未奖励，1完成',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
