USE market_db;

select * from buy inner join member on buy.mem_id = member.mem_id
	where buy.mem_id = "GRL";
select * from buy inner join member on buy.mem_id = member.mem_id;

select buy.mem_id, mem_name, prod_name, addr, concat(phone1, phone2) "연락처" from buy inner join member on buy.mem_id = member.mem_id;

select member.mem_id, mem_name, prod_name, addr from member left outer join buy on  member.mem_id =  buy.mem_id;

select * from buy cross join member;

select count(*) "데이터 수" from sakila.inventory cross join world.city;