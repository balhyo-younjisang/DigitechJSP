create table tbl_std_001(
	std_no		varchar2(5)		primary key,
	std_nm		varchar2(10)	not null,
	std_birth	varchar2(9),
	std_address	varchar2(40),
	std_att		char(1),
	constraint std_att_ch check(std_att in ('0', '1'))
);


alter table tbl_std_001 modify std_att default '0';
delete from tbl_std_001 where std_no = '30401';

insert into tbl_std_001 values ('30401', '고길동', '6905011', '서울시 도봉구', '1');
insert into tbl_std_001 values ('30402', '둘리', '8404041', '서울시 도봉구', '1');
insert into tbl_std_001 values ('30403', '도우너', '8805041', '서울시 노원구', '1');
insert into tbl_std_001 values ('30404', '마이콜', '7511071', '서울시 노원구', '1');
insert into tbl_std_001 values ('30405', '고철수', '8206121', '서울시 도봉구', '0');
insert into tbl_std_001 values ('30406', '고영희', '8304222', '서울시 도봉구', '0');

select * from TBL_STD_001;

SELECT TO_CHAR(nvl(max(std_no), 0) + 1, '00000')  FROM tbl_std_001;

SELECT std_no, std_nm, CASE WHEN SUBSTR(std_birth, 1, 1) IN ('0', '1') THEN '20' ELSE '19' END || SUBSTR(std_birth, 1, 2) || '-' || SUBSTR(std_birth, 3, 2) || '-' || SUBSTR(std_birth, 5, 2) AS std_birth, case when SUBSTR(std_birth, 7, 1) in('1', '3') then '남' when SUBSTR(std_birth, 7, 1) in ('2', '4') then '여' end as gender, std_address, case when std_att = '1' then '출석' when std_att = '0' then '결석' end as std_att from tbl_std_001 order by std_no