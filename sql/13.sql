use naver_db;

drop table if exists buy, member;
create table member(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null);

describe member;

drop table if exists buy, member;
create table member(
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    height tinyint unsigned null,
    primary key(mem_id));
    
create table buy(
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(8) not null,
    foreign key(mem_id) references member(mem_id)
    on update cascade
    on delete cascade);
    
insert into member value("BLK", '블랙핑크', 163);
insert into buy value(null, 'blk', '지갑');
insert into buy value(null, 'blk', '맥북');

update member set mem_id = "pink" where mem_id = "blk";
delete from member where mem_id = 'pink';

drop table if exists buy, member;
create table member(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null,
    email char(30) null unique);

insert into member value("BLK", '블랙핑크', 163, 'pink@gmail.com');
insert into member value("TWC", '트와이스', 167, null);
insert into member value("APN", '에이핑크', 164, 'pink@gmail.com');

drop table if exists buy, member;
create table member(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null check (height >= 100),
    phone1 char(3) null);

insert into member value("BLK", '블랙핑크', 163, null);
insert into member value("TWC", '트와이스', 99, null);

alter table member
	add constraint
    check (phone1 in ('02', '031', '032'));
    
insert into member value("OMY", '오마이걸', 101, "010");

drop table if exists buy, member;
create table member(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null default 160,
    phone1 char(3) null default "02");
insert into member value("red", '레드벨벳', default, default);