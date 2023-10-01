/**/

alter table mall_ums.ums_account_chain
    drop column `bsn_chain`,
    drop column `mobile`,
    add column `chain_type` integer(4) DEFAULT 0 COMMENT '0 bsn,1 eth',
    add column `address` varchar(255) DEFAULT NULL COMMENT '合约地址',
    add column `prikey` varchar(255) DEFAULT NULL COMMENT '私钥';
