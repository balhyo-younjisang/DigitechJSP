drop table tbl_customer;

create table tbl_customer(
	customerid	char(4)		primary key,
	name		varchar2(20),
	jumin		char(13),
	phone		char(13),
	address		varchar2(20),
	email		varchar2(30)
);

select p_number, c.customerid, name, address, case when grade = 'V' then '우수고객' when grade = 'S' then '학생고객' when grade = 'G' then '일반고객' end grade,
m1.menuname n, m2.menuname p, m3.menuname e, to_char(to_date(visitdate), 'yyyy/mm/dd') visitdate 
from 
TBL_CUSTOMER c,
tbl_performance p,
tbl_menu m1,
tbl_menu m2,
tbl_menu m3
where 
c.customerid = p.customerid
and m1.menucode = p.menucode1
and m2.menucode = p.menucode2
and m3.menucode = p.menucode3
order by p_number, visitdate

insert into TBL_CUSTOMER values ('C001', '김고객', '7901012111111', '010-0000-1111', '서울시', 'kim@abc.com');
insert into TBL_CUSTOMER values ('C002', '이고객', '8301012111112', '010-0000-1112', '용인시', 'lee@abc.com');
insert into TBL_CUSTOMER values ('C003', '박고객', '0301014111113', '010-0000-1113', '성남시', 'park@abc.com');
insert into TBL_CUSTOMER values ('C004', '정고객', '9301012111115', '010-0000-1114', '부천시', 'jung@abc.com');
insert into TBL_CUSTOMER values ('C005', '최고객', '8401011111114', '010-0000-1115', '의정부시', 'choi@abc.com');
insert into TBL_CUSTOMER values ('C006', '장고객', '0201014111116', '010-0000-1116', '동두천시', 'jang@abc.com');

drop table tbl_performance;
create table tbl_performance(
	p_number		char(4)		primary key,
	customerid		varchar2(6),
	grade			varchar2(6),
	menucode1		char(4),
	menucode2		char(4),
	menucode3		char(4),
	visitdate		varchar2(6)
)

insert into tbl_performance values ('1', 'C001', 'V', 'N00', 'P01', 'E00', '230801');
insert into tbl_performance values ('2', 'C002', 'G', 'N01', 'P02', 'E00', '230801');
insert into tbl_performance values ('3', 'C003', 'S', 'N00', 'P00', 'E01', '230802');
insert into tbl_performance values ('4', 'C004', 'G', 'N03', 'P03', 'E00', '230802');
insert into tbl_performance values ('5', 'C005', 'V', 'N04', 'P04', 'E00', '230803');
insert into tbl_performance values ('6', 'C006', 'S', 'N05', 'P05', 'E00', '230803');
insert into tbl_performance values ('7', 'C001', 'V', 'N00', 'P00', 'E01', '230804');
insert into tbl_performance values ('8', 'C002', 'G', 'N01', 'P00', 'E01', '230804');

select *
from tbl_performance

drop table tbl_menu;
create table tbl_menu(
	menucode		char(4)		primary key,
	menuname		varchar2(20),
	menutype		char(1),
	price			number(5)
)

insert into tbl_menu values ('N00', '해당 없음', 'N', 0);
insert into tbl_menu values ('N01', '풀코트', 'N', 20000);
insert into tbl_menu values ('N02', '아트/라인아트', 'N', 15000);
insert into tbl_menu values ('N03', '글리트', 'N', 10000);
insert into tbl_menu values ('N04', '글라데이션', 'N', 10000);
insert into tbl_menu values ('N05', '프렌치', 'N', 10000);
insert into tbl_menu values ('P00', '해당없음', 'P', 0);
insert into tbl_menu values ('P01', '풀코트', 'P', 20000);
insert into tbl_menu values ('P02', '아트/라인아트', 'P', 20000);
insert into tbl_menu values ('P03', '글리트', 'P', 15000);
insert into tbl_menu values ('P04', '글라데이션', 'P', 10000);
insert into tbl_menu values ('P05', '프렌치', 'P', 10000);
insert into tbl_menu values ('E00', '해당없음', 'E', 0);
insert into tbl_menu values ('E01', '손/발기본케어', 'E', 30000);

select menucode, menuname, case when menutype = 'N' then '네일' when menutype = 'P' then '패디' when menutype = 'E' then '기타' end menutype, TRIM(TO_CHAR(price, 'L999,999,999')) price from tbl_menu;

select menucode, menuname from tbl_menu where menucode like 'N%'


select  to_char(to_date(visitdate), 'yyyy/mm/dd'), 
count(p.menucode1), 
TRIM(TO_CHAR(sum(case when p.grade = 'V' then m1.price * 0.9 when p.grade = 'S' then m1.price * 0.8 else m1.price end), 'L999,999,999')) total
from TBL_PERFORMANCE p,
tbl_menu m1
where p.menucode1 = m1.menucode and p.menucode1 != 'N00'
group by to_char(to_date(visitdate), 'yyyy/mm/dd')
order by to_char(to_date(visitdate), 'yyyy/mm/dd')


