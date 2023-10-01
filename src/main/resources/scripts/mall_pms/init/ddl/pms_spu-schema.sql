/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_spu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '商品名称',
  `subject_id` bigint(20) NOT NULL COMMENT '商品主题ID',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '商品品牌ID',
  `product_id` varchar(64) DEFAULT NULL COMMENT '苹果支付产品ID',
  `contract` varchar(255) DEFAULT NULL COMMENT '合约地址',
  `source_type` tinyint(1) DEFAULT '0' COMMENT '源类型：0-图片 1-视频 2-3D模型 3-音频',
  `type` tinyint(1) DEFAULT '0' COMMENT ' 商品类型：0-NFT 1-盲盒',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则ID用于盲盒',
  `price` bigint(20) NOT NULL COMMENT '现价【起】',
  `total` int(11) DEFAULT '0' COMMENT '发行量',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品主图',
  `album` json DEFAULT NULL COMMENT '商品图册',
  `images` json DEFAULT NULL COMMENT '图集',
  `icons` json DEFAULT NULL COMMENT '图标地址集',
  `ext` json DEFAULT NULL COMMENT '扩展字段',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定状态:( 0:未绑定 1:绑定)',
  `visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示状态:( 0:隐藏 1:显示)',
  `status` tinyint(1) DEFAULT '0' COMMENT '商品状态：0-下架 1-上架',
  `dev` tinyint(1) DEFAULT '0' COMMENT '环境：0-正式 1-开发',
  `started` datetime DEFAULT NULL COMMENT '开售时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_pms_spu_pms_brand` (`brand_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';
