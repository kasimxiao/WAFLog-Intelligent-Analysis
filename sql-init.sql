-- 创建数据库(如果不存在)
CREATE DATABASE IF NOT EXISTS waf DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE waf;

CREATE TABLE `allow_exception_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `request_value` varchar(100) NOT NULL COMMENT '请求ip/ja3',
  `type` varchar(10) DEFAULT NULL COMMENT '类别',
  `soure_value` varchar(200) DEFAULT NULL COMMENT '源请求',
  `exception_des` varchar(200) DEFAULT NULL COMMENT '异常描述',
  `exception_type` varchar(50) DEFAULT NULL COMMENT '异常类别',
  `opt_suggest` varchar(200) DEFAULT NULL COMMENT '优化建议',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_request_value` (`request_value`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='异常详情表';


CREATE TABLE `block_count_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `ja3` varchar(20) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `ruleid` varchar(100) DEFAULT NULL,
  `ruledetail` varchar(100) DEFAULT NULL,
  `block_count` int DEFAULT NULL COMMENT 'block调用次数',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_ip` (`ip`),
  KEY `idx_ja3` (`ja3`),
  KEY `idx_country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='block调用次数表';

CREATE TABLE `block_ip_set` (
  `ip` varchar(50) NOT NULL,
  `ja3` varchar(100) DEFAULT NULL,
  `block_value` int DEFAULT NULL COMMENT '是否黑名单',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ip`),
  KEY `idx_ip` (`ip`),
  KEY `idx_ja3` (`ja3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='block ip表';