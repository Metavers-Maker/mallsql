/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(20) DEFAULT '0',
  `ext` text COMMENT '扩展',
  `content` text COMMENT '内容',
  `visible` tinyint(1) DEFAULT '0',
  `sort` int(20) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1585263391925379075 DEFAULT CHARSET=utf8mb4;
