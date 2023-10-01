alter table pms_spu add column `subject_id` bigint(20) DEFAULT NULL COMMENT '系列ID';
alter table pms_spu add column `publish_status` int(2) DEFAULT 0 COMMENT '发行状态 0未发行，1已发行';
alter table pms_spu add column  `source_url` varchar(255) DEFAULT NULL COMMENT '资源链接';

alter table pms_brand add column  `simple_dsp` varchar(1024) DEFAULT NULL COMMENT '简单描述';
