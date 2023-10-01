/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_brand` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '品牌名称',
  `logo_url` varchar(255) DEFAULT NULL COMMENT 'LOGO图片',
  `images` json DEFAULT NULL COMMENT '图集',
  `icons` json DEFAULT NULL,
  `ext` json DEFAULT NULL COMMENT '扩展字段',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-隐藏 1-可见',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-下架 1-上架',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品品牌表';
