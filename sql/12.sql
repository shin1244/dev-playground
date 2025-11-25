drop database if exists naver_db;
create database naver_db;

use naver_db;
CREATE TABLE `naver_db`.`member` (
  `mem_id` CHAR(8) NOT NULL,
  `mem_name` VARCHAR(10) NOT NULL,
  `mem_number` TINYINT NOT NULL,
  `addr` CHAR(2) NULL,
  `phone1` CHAR(3) NULL,
  `phone2` CHAR(8) NULL,
  `height` TINYINT UNSIGNED NULL,
  `debut_date` DATE NULL,
  PRIMARY KEY (`mem_id`));
  
drop table if exists buy;
CREATE TABLE `naver_db`.`buy` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `mem_id` CHAR(8) NOT NULL,
  `prod_name` CHAR(6) NOT NULL,
  `group_name` CHAR(4) NULL,
  `price` INT UNSIGNED NULL,
  `amount` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`num`),
  foreign key(mem_id) references member(mem_id));
  
insert into member value("TWC", "트와이스", 9, "서울", '02', '11111111', 167, '2015.02.14');
insert into member value("BLK", "블랙핑크", 4, "경남", '02', '11111111', 167, '2015.02.14');