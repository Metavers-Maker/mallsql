/**/

alter table pms_subject drop column `started`;
alter table pms_subject drop column `status`;
alter table pms_subject drop column `images`;
alter table pms_subject drop column `icons`;
alter table pms_subject drop column `icon_url`;
alter table pms_subject add column `pic_url` varchar(255) DEFAULT NULL COMMENT '关联图片';
