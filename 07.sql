use market_db;

select mem_id, mem_name, debut_date from member order by debut_date;

select mem_id, mem_name, debut_date from member order by debut_date desc;

select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc;

select mem_id, mem_name, debut_date, height from member 
	where height >= 164 order by height desc,debut_date;
    
select * from member limit 3;

select * from member order by debut_date limit 3;

select * from member order by height desc limit 3, 2;

select addr from member;

select distinct addr from member;

select mem_id, sum(amount) "총 구매 개수" from buy group by mem_id;

select mem_id, sum(amount*price) "총 구매 금액" from buy group by mem_id;

select avg(amount) "평균 구매 개수" from buy;

select mem_id, avg(amount) "평균 구매 개수" from buy group by mem_id;

select count(phone1) "연락처가 있는 회원" from member;

select mem_id, sum(amount*price) "총 구매 금액" from buy group by mem_id having sum(price*amount) > 1000;

select mem_id, sum(amount*price) "총 구매 금액" from buy group by mem_id having sum(price*amount) > 1000 order by sum(price*amount) desc;