create view v_member
as 
	select mem_id, mem_name, addr from member;

select * from v_member;

select mem_name, addr from v_member
	where addr in ('서울', "경기");
    
select buy.mem_id, member.mem_name, buy.prod_name, member.addr, concat(member.phone1, member.phone2)
	from buy inner join member on buy.mem_id = member.mem_id;
    
create view v_memberbuy
as
	select buy.mem_id, member.mem_name, buy.prod_name, member.addr, concat(member.phone1, member.phone2)
		from buy inner join member on buy.mem_id = member.mem_id;

select * from v_memberbuy where mem_name = "에이핑크";

drop view v_memberbuy;

create or replace view v_viewtest
as
	select mem_id, mem_name, addr from member;
    
update v_member set addr = "부산" where mem_id = "BLK";
select * from v_member;

create or replace view v_167
as
	select * from member where height >= 167 with check option;
    
select * from v_167;

delete from v_167 where height < 167;

insert into v_167 values('TRA', '티아라', 6, '서울', null, null, 159, '2005.1.1');

drop table member, buy;

check table v_167;