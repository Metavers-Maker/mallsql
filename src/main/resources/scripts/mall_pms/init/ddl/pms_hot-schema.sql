/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_hot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `ext` json DEFAULT NULL COMMENT '扩展字段',
  `content_type` tinyint(1) DEFAULT '0' COMMENT '内容类型:0 主题 1 产品',
  `content_id` bigint(20) DEFAULT '0' COMMENT '内容ID',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-隐藏 1-可见',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品热度表';
