create table member_tbl_03(
	id		varchar2(5)		primary key,
	name	varchar2(20),
	gender	char(1)
);

create table score_tbl_03(
	id		varchar2(5)		primary key,
	korean	number(3),
	english	number(3),
	math	number(3),
	history	number(3)
);

insert into member_tbl_03 values ('10301', '권이준', '1');
insert into member_tbl_03 values ('10302', '구지우', '2');
insert into member_tbl_03 values ('10303', '권태준', '1');
insert into member_tbl_03 values ('10304', '금기연', '2');
insert into member_tbl_03 values ('10305', '김영진', '1');
insert into member_tbl_03 values ('10401', '김주현', '1');
insert into member_tbl_03 values ('10402', '김태민', '2');
insert into member_tbl_03 values ('10403', '임수민', '2');
insert into member_tbl_03 values ('10404', '남상도', '1');
insert into member_tbl_03 values ('10405', '조은호', '2');

insert into score_tbl_03 values ('10301', 70, 80, 75, 95);
insert into score_tbl_03 values ('10302',80, 73, 80, 85);
insert into score_tbl_03 values ('10303',  45, 75, 45, 75);
insert into score_tbl_03 values ('10304', 65, 73, 65, 65);
insert into score_tbl_03 values ('10305', 90, 100, 68, 95);
insert into score_tbl_03 values ('10401', 95, 75, 84, 60);
insert into score_tbl_03 values ('10402', 65, 70, 50, 94);
insert into score_tbl_03 values ('10403', 80, 60, 100, 80);
insert into score_tbl_03 values ('10404', 64, 50, 40, 65);
insert into score_tbl_03 values ('10405', 55, 70, 80, 75);

select id, name, substr(id, 1, 1) grade, substr(id, 2, 2) class, substr(id, 4,2) num,
case when gender = '1' then '남' else '여' end gender from member_tbl_03 order by id;


select ltrim(substr(id, 2, 2), '0') || '반' grade, 
round(avg(korean), 0) korean,
round(avg(english), 0) english,
round(avg(math), 0) math,
round(avg(history), 0) history,
trim(to_char(sum(korean + english + math + history), '999,999,999')) total
from score_tbl_03
group by ltrim(substr(id, 2, 2), '0') || '반'
order by grade;

select * from (select m.id, name, korean, english, math, history, korean + english + math + history total,
rank() over (order by korean + english + math + history desc) as rank_total
from score_tbl_03 s, member_tbl_03 m
where s.id = m.id) where rownum <= 3;