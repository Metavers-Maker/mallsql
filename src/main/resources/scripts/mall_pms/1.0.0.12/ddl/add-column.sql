alter table pms_rnd add column `pic_url` varchar(255) DEFAULT NULL COMMENT '图片';
alter table pms_rnd add column `max_count` int(11) DEFAULT '0' COMMENT '最大数量';
alter table pms_rnd add column `alive_count` int(11) DEFAULT '0' COMMENT '产出数量';
