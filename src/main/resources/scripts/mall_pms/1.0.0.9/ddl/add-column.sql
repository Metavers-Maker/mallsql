alter table pms_spu add column `detail` json DEFAULT NULL COMMENT '商品细节描述';
alter table pms_spu add column `publish_id` bigint(20) DEFAULT NULL COMMENT '发行方ID';

alter table pms_brand add column  `role` int(4) DEFAULT NULL COMMENT '角色0 作者，1发行方';
alter table pms_brand add column  `pic_url` varchar(255) DEFAULT NULL COMMENT 'LOGO图片';
alter table pms_brand add column  `dsp` text COMMENT '介绍';
