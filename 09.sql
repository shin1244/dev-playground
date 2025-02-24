use market_db;
create table hongong4 (
	tinyint_col tinyint,
    smallint_col smallint,
    int_col int,
    bigint_col bigint);
    
insert into hongong4 value(127, 32767, 2147483647, 900000000000000000);

insert into hongong4 value(1279, 327679, 21474836479, 9000000000000000090);

create table big_table (
	data1 char(255),
    data2 varchar(16383));
    
create database netflix_db;
use netflix_db;

create table movie
	(movie_id int,
    movie_title varchar(30),
    movie_director varchar(20),
    moive_script longtext,
    moive_film longblob);
    
set @myVar1 = 5;
set @myVar2 = 4.25;

select @myVar1;
select @myVar1 + @myVar2;

use market_db;
set @txt = "이름 ==>";
set @height = 166;

select @txt, mem_name from member where height >= @height;

set @count = 3;
prepare mySQL from 'select mem_name, height from member order by height limit ?';
execute mySQL using @count;

select avg(price) '평균 가격' from buy;

select cast(avg(price) as signed) '평균 가격' from buy;