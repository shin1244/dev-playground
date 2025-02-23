use market_db;

select * from member where mem_name = "블랙핑크";

select * from member where mem_number = 4;

select mem_id, mem_name from member where height <= 162;

select mem_id, mem_name from member where height >= 165 and mem_number > 6;

select mem_id, mem_name from member where height >= 165 or mem_number > 6;

select mem_name, addr from member where height between 163 and 165;

select mem_name, addr from member where addr in("경기", "전남", "경남");

select * from member where mem_name like "우%";

select * from member where mem_name like "__핑크";