create table TBL_PATIENT_202004 (
	P_NO		char(4)		primary key,
	P_NAME		varchar2(20),
	P_BIRTH		char(8),
	P_GENDER	char(1),
	P_TEL1		char(3),
	P_TEL2		char(4),
	P_TEL3		char(4),
	P_CITY		char(2)
);


insert into TBL_PATIENT_202004 values ('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into TBL_PATIENT_202004 values ('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20');
insert into TBL_PATIENT_202004 values ('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30');
insert into TBL_PATIENT_202004 values ('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
insert into TBL_PATIENT_202004 values ('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
insert into TBL_PATIENT_202004 values ('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
insert into TBL_PATIENT_202004 values ('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');


drop table TBL_LAB_TEST_202004;
CREATE TABLE TBL_LAB_TEST_202004 (
	T_CODE		char(4)		primary key,
	T_NAME		varchar2(20)
)

insert into TBL_LAB_TEST_202004 values ('T001', '결핵');
insert into TBL_LAB_TEST_202004 values ('T002', '장티푸스');
insert into TBL_LAB_TEST_202004 values ('T003', '수두');
insert into TBL_LAB_TEST_202004 values ('T004', '홍역');
insert into TBL_LAB_TEST_202004 values ('T005', '콜레라');
drop table TBL_RESULT_202004;
CREATE TABLE TBL_RESULT_202004 (
	P_NO		char(4) 	not null,
	T_CODE		char(4),
	T_SDATE		date,
	T_STATUS	char(1),
	T_LDATE		date,
	T_RESULT	char(1),
	constraint RESULT_PK primary key (P_NO, T_CODE, T_SDATE)
)

insert into TBL_RESULT_202004 values ('1001', 'T001', '2020-01-01', '1', '2020-01-02', 'X');
insert into TBL_RESULT_202004 values ('1002', 'T002', '2020-01-01', '2', '2020-01-02', 'P');
insert into TBL_RESULT_202004 values ('1003', 'T003', '2020-01-01', '2', '2020-01-02', 'N');
insert into TBL_RESULT_202004 values ('1004', 'T004', '2020-01-01', '2', '2020-01-02', 'P');
insert into TBL_RESULT_202004 values ('1005', 'T005', '2020-01-01', '2', '2020-01-02', 'P');
insert into TBL_RESULT_202004 values ('1006', 'T001', '2020-01-01', '2', '2020-01-02', 'N');
insert into TBL_RESULT_202004 values ('1007', 'T002', '2020-01-01', '2', '2020-01-02', 'P');
insert into TBL_RESULT_202004 values ('1005', 'T003', '2020-01-01', '2', '2020-01-02', 'P');
insert into TBL_RESULT_202004 values ('1006', 'T004', '2020-01-01', '2', '2020-01-02', 'N');
insert into TBL_RESULT_202004 values ('1007', 'T005', '2020-01-01', '2', '2020-01-02', 'N');

select * from tbl_result_202004;
select P_NO, P_NAME, TO_CHAR(TO_DATE(P_BIRTH), 'YYYY"년"MM"월"DD"일"') P_BIRTH, 
CASE WHEN P_GENDER = 'M' THEN '남' WHEN P_GENDER = 'F' THEN '여' END P_GENDER,
P_TEL1 || '-' ||  P_TEL2 || '-' || P_TEL3 P_TEL,
CASE WHEN P_CITY = '10' THEN '서울' WHEN P_CITY = '20' THEN '경기' WHEN P_CITY = '30' THEN '강원' WHEN P_CITY = '40' THEN '대구' END P_CITY
FROM TBL_PATIENT_202004;

select p.P_NO, p.P_NAME, t.T_NAME, TO_CHAR(r.T_SDATE, 'YYYY-MM-DD') T_SDATE,
case when r.T_STATUS = '1' THEN '검사중' when  r.T_STATUS = '2' then '검사완료' END T_STATUS,
TO_CHAR(r.T_LDATE, 'YYYY-MM-DD') T_LDATE,
CASE WHEN r.T_RESULT = 'X' THEN '미입력' WHEN r.T_RESULT = 'P' THEN '양성' WHEN r.T_RESULT = 'N' THEN '음성' END T_RESULT
from TBL_RESULT_202004 r,  TBL_PATIENT_202004 p, TBL_LAB_TEST_202004 t
WHERE r.P_NO = p.P_NO and t.T_CODE = r.T_CODE order by p.P_NO;

select p.P_CITY P_CITY_CODE,
CASE WHEN p.P_CITY = '10' THEN '서울' WHEN p.P_CITY = '20' THEN '경기' WHEN p.P_CITY = '30' THEN '강원' WHEN p.P_CITY = '40' THEN '대구' END P_CITY,
count(*) 
from TBL_PATIENT_202004 p, TBL_RESULT_202004 r
where p.P_NO = r.P_NO group by P_CITY ORDER BY P_CITY_CODE