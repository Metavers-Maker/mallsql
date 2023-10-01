/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_subject` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '商品主题名称',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '缩略图地址',
  `images` json DEFAULT NULL COMMENT '图集',
  `icons` json DEFAULT NULL,
  `ext` json DEFAULT NULL COMMENT '扩展字段',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `visible` tinyint(1) DEFAULT '0' COMMENT '显示状态:( 0:隐藏 1:显示)',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-下架 1-上架',
  `started` datetime DEFAULT NULL COMMENT '开始时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品主题表';
