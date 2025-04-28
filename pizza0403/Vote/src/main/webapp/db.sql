select * from TBL_MEMBER_202005;
drop table TBL_MEMBER_202005;

create table TBL_MEMBER_202005(
	M_NO		CHAR(1)		primary key,
	V_NAME		VARCHAR2(20),
	P_CODE		CHAR(2),
	V_TIME		CHAR(1),
	V_AREA		CHAR(13),
	V_CONFIRM	VARCHAR2(20)
)

insert into TBL_MEMBER_202005 values ('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into TBL_MEMBER_202005 values ('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into TBL_MEMBER_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into TBL_MEMBER_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into TBL_MEMBER_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');


drop table TBL_PARTY_202005;
create table TBL_PARTY_202005(
	P_CODE		CHAR(2)		primary key,
	P_NAME		VARCHAR2(20),
	P_INDATE	DATE,
	P_READER	VARCHAR2(20),
	P_TEL1		CHAR(3),
	P_TEL2		CHAR(4),
	P_TEL3		CHAR(4)
)

insert into TBL_PARTY_202005 values ('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into TBL_PARTY_202005 values ('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into TBL_PARTY_202005 values ('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into TBL_PARTY_202005 values ('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into TBL_PARTY_202005 values ('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');


drop table TBL_VOTE_202005;
create table TBL_VOTE_202005(
	V_JUMIN		CHAR(13)	primary key,
	V_NAME		VARCHAR2(20),
	M_NO		CHAR(1),
	V_TIME		CHAR(4),
	V_AREA		CHAR(20),
	V_CONFIRM	CHAR(1)
)

insert into TBL_VOTE_202005 values ('9901011000001', '김유권', '1', '0930', '제1투표장', 'N');
insert into TBL_VOTE_202005 values ('8901012000002', '이유권', '2', '0930', '제1투표장', 'N');
insert into TBL_VOTE_202005 values ('6901011000003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('5901012000004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('7901011000005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('8901012000006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('5901011000007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('4901012000008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('7901011000009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('8901012000010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('9901011000011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('7901011000012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values ('6901011000013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('8901011000014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('9901011000015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('7901011000016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('8901011000017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('9901011000018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('9901011000019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('7901011000020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('6901011000021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('7901011000022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('9901011000023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values ('5901011000024', '권유권', '3', '1330', '제2투표장', 'Y');


select M_NO, V_NAME, P_NAME, V_AREA, 
case when V_TIME = '1' then '고졸'
	 when V_TIME = '2' then '학사'
	 when V_TIME = '3' then '석사'
	 when V_TIME = '4' then '박사' end V_TIME,
	 V_CONFIRM,
	 P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3
from TBL_MEMBER_202005 m, TBL_PARTY_202005 p
where m.P_CODE = p.P_CODE
order by M_NO;

select v.V_NAME, 
DECODE(SUBSTR(V_JUMIN, 7, 1), '1', '19', '2', '19', '20') || TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yy"년"mm"월"dd"일생"') V_DATE,
'만 ' || case when SUBSTR(V_JUMIN, 7, 1) <= 2 then TO_CHAR(SYSDATE,'YYYY') - CONCAT('19', TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yy')) 
else TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yyyy')
end || '세' V_AGE,
case when SUBSTR(V_JUMIN, 7, 1) in (1, 3) then '남'
when SUBSTR(V_JUMIN, 7, 1) in (2, 4) then '여' end V_GENDER,
SUBSTR(v.V_TIME, 0, 2) || ':' || SUBSTR(v.V_TIME, 3, 2) V_TIME,
v.V_AREA,
case when v.V_CONFIRM = 'Y' then '확인'
when v.V_CONFIRM = 'N' then '미확인' end V_CONFIRM
FROM TBL_VOTE_202005 v, TBL_MEMBER_202005 m
where v.M_NO = m.M_NO and v.V_AREA = '제1투표장';

select * from TBL_VOTE_202005;
delete from TBL_VOTE_202005 where V_NAMe = '윤지상';

select  TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yyyy')
FROM TBL_VOTE_202005;


select m.M_NO, m.V_NAME, P_NAME, count(*) total
from TBL_MEMBER_202005 m, TBL_VOTE_202005 v, TBL_PARTY_202005 p
where m.M_NO = v.M_NO and m.P_CODE = p.P_CODE and v.V_CONFIRM = 'Y'
GROUP BY m.M_NO, m.V_NAME, P_NAME
order by total desc