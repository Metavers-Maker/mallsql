/**/

alter table ums_bank add column `sand_sn` varchar(255) DEFAULT NULL COMMENT '杉德流水号';
alter table ums_bank modify column `user_id` varchar(255) DEFAULT NULL COMMENT 'sand用户ID';
