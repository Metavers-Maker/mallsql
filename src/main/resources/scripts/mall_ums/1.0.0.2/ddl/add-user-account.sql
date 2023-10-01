/**/

alter table ums_account_chain add column `bank_card_code` varchar(255) DEFAULT NULL COMMENT '银行卡号';
alter table ums_account_chain add column `bank_username` varchar(255) DEFAULT NULL COMMENT '银行卡用户名称';
alter table ums_account_chain add column `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称';
