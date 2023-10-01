/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `link_type` tinyint(1) DEFAULT '0' COMMENT '链接类型:0 外链 1 内链',
  `link` varchar(255) DEFAULT '0' COMMENT '链接',
  `source` varchar(255) DEFAULT NULL COMMENT 'url',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-隐藏 1-可见',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播表';
