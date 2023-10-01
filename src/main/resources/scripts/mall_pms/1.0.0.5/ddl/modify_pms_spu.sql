/**/
alter table pms_spu add column `symbol` varchar(20) DEFAULT NULL COMMENT '快速标识';
alter table pms_spu add column `metadata_url` varchar(254) DEFAULT NULL COMMENT '元数据url';
