create table emp_tbl(
	empno		number(5)		primary key,
	empname		varchar2(21)	not null,
	empphone	varchar2(11),
	empdate		date
)

insert into emp_tbl values ('10001', '정우성', '01012122323', '20141008');
insert into emp_tbl values ('10002', '김태희', '01023233434', '20150109');
insert into emp_tbl values ('10003', '한가인', '01034344545', '20200402');
insert into emp_tbl values ('10004', '이나영', '01045455656', '20200105');
insert into emp_tbl values ('10005', '원빈', '01056566767', '20101122');
insert into emp_tbl values ('10006', '장동건', '01067677878', '20050302');

create table product_tbl(
	productno		char(5)		primary key,
	productname		varchar2(60)		not null,
	productprice	number,
	producttype		char(1),
	productstock	number
)

insert into product_tbl values ('A0001', '나이키 에어맥스 95', 169000, '1', 150);
insert into product_tbl values ('A0002', '나이키 에어맥스 98', 149000, '1', 170);
insert into product_tbl values ('A0003', '나이키 윈드러너', 95000, '2', 80);
insert into product_tbl values ('A0004', '나이키 드라이핏', 79000, '2', 75);
insert into product_tbl values ('B0001', '프레쉬폼X', 139000, '1', 200);
insert into product_tbl values ('B0002', '서밋 언노운', 129000, '1', 155);

create table sell_tbl(
	empno		number(5)	not null,
	productno	char(5)		not null,
	selldate	date		not null,
	selltime	char(4)		not null,
	sellcount	number,
	constraint sell_pk	primary key (empno, productno, selldate, selltime)
)

insert into sell_tbl values ('10001', 'A0001', '20200408', '1200', 1);
insert into sell_tbl values ('10002', 'A0002', '20200408', '1250', 5);
insert into sell_tbl values ('10001', 'B0001', '20200408', '1305', 2);
insert into sell_tbl values ('10003', 'A0004', '20200409', '0920', 2);
insert into sell_tbl values ('10003', 'B0001', '20200409', '0925', 3);
insert into sell_tbl values ('10004', 'B0002', '20200409', '1130', 1);
insert into sell_tbl values ('10005', 'B0001', '20200409', '1145', 2);
insert into sell_tbl values ('10006', 'A0002', '20200409', '1240', 4);
insert into sell_tbl values ('10006', 'A0002', '20200409', '1325', 3);
insert into sell_tbl values ('10006', 'B0002', '20200409', '1400', 5);

SELECT PRODUCTNO, PRODUCTNAME, TRIM(TO_CHAR(PRODUCTPRICE, '999,999,999')) PRODUCTPRICE, 
CASE WHEN PRODUCTTYPE = '1' THEN '신발' WHEN PRODUCTTYPE = '2' THEN '기능성 의류' ELSE '일반 의류' END PRODUCTTYPE, PRODUCTSTOCK FROM PRODUCT_TBL ORDER BY PRODUCTNO ASC