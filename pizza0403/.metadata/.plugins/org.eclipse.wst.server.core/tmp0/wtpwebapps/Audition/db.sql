drop table TBL_ARTIST_201905;

create table TBL_ARTIST_201905(
	ARTIST_ID		char(4)		primary key,
	ARTIST_NAME		varchar2(20),
	ARTIST_BIRTH	char(8),
	ARTIST_GENDER	char(1),
	TALENT			char(1),
	AGENCY			varchar2(30)
);

insert into TBL_ARTIST_201905 values ('A001', '김스타', '19970101', 'F', '1', 'A엔터테인먼트');
insert into TBL_ARTIST_201905 values ('A002', '조스타', '19980201', 'M', '2', 'B엔터테인먼트');
insert into TBL_ARTIST_201905 values ('A003', '왕스타', '19900301', 'M', '3', 'C엔터테인먼트');
insert into TBL_ARTIST_201905 values ('A004', '정스타', '20000401', 'M', '1', 'D엔터테인먼트');
insert into TBL_ARTIST_201905 values ('A005', '홍스타', '20010501', 'F', '2', 'E엔터테인먼트');

drop table TBL_MENTO_201905;

create table TBL_MENTO_201905(
	MENTO_ID		char(4)		primary key,
	MENTO_NAME		varchar2(20)
)

insert into TBL_MENTO_201905 values ('J001', '황멘토');
insert into TBL_MENTO_201905 values ('J002', '박멘토');
insert into TBL_MENTO_201905 values ('J003', '장멘토');

drop table TBL_POINT_201905;

create table TBL_POINT_201905(
	SERIAL_NO		varchar2(8)		primary key,
	ARTIST_ID		char(4),
	MENTO_ID		char(4),
	POINT			number(3)
)

insert into TBL_POINT_201905 values ('20190001', 'A001', 'J001', 78);
insert into TBL_POINT_201905 values ('20190002', 'A001', 'J002', 76);
insert into TBL_POINT_201905 values ('20190003', 'A001', 'J003', 70);
insert into TBL_POINT_201905 values ('20190004', 'A002', 'J001', 80);
insert into TBL_POINT_201905 values ('20190005', 'A002', 'J002', 72);
insert into TBL_POINT_201905 values ('20190006', 'A002', 'J003', 78);
insert into TBL_POINT_201905 values ('20190007', 'A003', 'J001', 90);
insert into TBL_POINT_201905 values ('20190008', 'A003', 'J002', 92);
insert into TBL_POINT_201905 values ('20190009', 'A003', 'J003', 88);
insert into TBL_POINT_201905 values ('20190010', 'A004', 'J001', 96);
insert into TBL_POINT_201905 values ('20190011', 'A004', 'J002', 90);
insert into TBL_POINT_201905 values ('20190012', 'A004', 'J003', 98);
insert into TBL_POINT_201905 values ('20190013', 'A005', 'J001', 88);
insert into TBL_POINT_201905 values ('20190014', 'A005', 'J002', 86);
insert into TBL_POINT_201905 values ('20190015', 'A005', 'J003', 86);


select ARTIST_ID, ARTIST_NAME, TO_CHAR(TO_DATE(ARTIST_BIRTH), 'YYYY"년"MM"월"DD"일"') ARTIST_BIRTH,
case when ARTIST_GENDER = 'M' then '남자' when ARTIST_GENDER = 'F' then '여자' end ARTIST_GENDER,
case when TALENT = '1' then '보컬' when TALENT = '2' then '댄스' when TALENT = '3' then '랩' end TALENT,
AGENCY FROM TBL_ARTIST_201905 order by ARTIST_ID asc;

select SERIAL_NO, A.ARTIST_ID, ARTIST_NAME, TO_CHAR(TO_DATE(ARTIST_BIRTH), 'YYYY"년"MM"월"DD"일"') ARTIST_BIRTH, POINT,
case when POINT >= 90 then 'A'  when POINT >= 80 then 'B'  when POINT >= 70 then 'C' else 'D' end GRADE,
MENTO_NAME FROM TBL_POINT_201905 P, TBL_ARTIST_201905 A, TBL_MENTO_201905 M where P.ARTIST_ID = A.ARTIST_ID and P.MENTO_ID = M.MENTO_ID
order by SERIAL_NO asc;

select A.ARTIST_ID, A.ARTIST_NAME, SUM(P.POINT) SUM_POINT, TO_CHAR(ROUND(AVG(P.POINT), 2), '99.99') AVG_POINT, DENSE_RANK() OVER (ORDER BY SUM(P.POINT) DESC) RANK
from TBL_ARTIST_201905 A, TBL_POINT_201905 P where A.ARTIST_ID = P.ARTIST_ID
group by A.ARTIST_ID, ARTIST_NAME;


