alter table oms_member_item add column  `source_url` varchar(255) DEFAULT NULL COMMENT '资源url';
alter table oms_member_item add column  `source_type` tinyint(1) DEFAULT '0'  COMMENT '资源类型';
alter table oms_member_item add column  `cur_address` varchar(255) DEFAULT NULL COMMENT '当前BSN地址';
