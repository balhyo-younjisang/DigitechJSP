CREATE TABLE tbl_jumin_201808 (
	jumin	char(14)	PRIMARY KEY,
	pname	varchar2(16),
	tel	 	varchar2(13),
	address varchar2(10)
);

CREATE TABLE tbl_hosp_202108 (
	hospcode	char(4)		PRIMARY KEY,
	hospname	varchar2(10),
	hosptel		varchar2(10),
	hospaddr	varchar2(10)
);

CREATE TABLE tbl_vaccresv_202108 (
	resvno		char(8)		PRIMARY KEY,
	jumin		char(14),
	vcode		char(4),
	hospcode	char(4),
	resvdate	char(8),
	resvtime	char(4)
);

INSERT INTO tbl_jumin_201808 VALUES('700101-1000001', '김주민', '010-1234-0001', '서울');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000002', '이주민', '010-1234-0002', '서울');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000003', '박주민', '010-1234-0003', '서울');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000004', '조주민', '010-1234-0004', '대전');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000005', '홍주민', '010-1234-0005', '대전');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000006', '나주민', '010-1234-0006', '대구');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000007', '황주민', '010-1234-0007', '대구');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000008', '용주민', '010-1234-0008', '광주');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000009', '백주민', '010-1234-0009', '광주');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000010', '송주민', '010-1234-0010', '광주');

INSERT INTO tbl_hosp_202108 VALUES('H001', '가-병원', '1588-0001', '서울');
INSERT INTO tbl_hosp_202108 VALUES('H002', '나-병원', '1588-0002', '대전');
INSERT INTO tbl_hosp_202108 VALUES('H003', '다-병원', '1588-0003', '대구');
INSERT INTO tbl_hosp_202108 VALUES('H004', '라-병원', '1588-0004', '광주');

INSERT INTO tbl_vaccresv_202108 VALUES('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920');
INSERT INTO tbl_vaccresv_202108 VALUES('20210002', '700101-2000002', 'V001', 'H002', '20210901', '1030');
INSERT INTO tbl_vaccresv_202108 VALUES('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130');
INSERT INTO tbl_vaccresv_202108 VALUES('20210004', '700101-2000004', 'V002', 'H001', '20210902', '1230');
INSERT INTO tbl_vaccresv_202108 VALUES('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330');
INSERT INTO tbl_vaccresv_202108 VALUES('20210006', '700101-2000006', 'V003', 'H003', '20210903', '1430');
INSERT INTO tbl_vaccresv_202108 VALUES('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530');
INSERT INTO tbl_vaccresv_202108 VALUES('20210008', '700101-2000008', 'V003', 'H002', '20210903', '1630');
INSERT INTO tbl_vaccresv_202108 VALUES('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730');
INSERT INTO tbl_vaccresv_202108 VALUES('20210010', '700101-2000010', 'V003', 'H001', '20210904', '1830');

commit

select pname, j.jumin, case when SUBSTR(j.jumin, 8, 1) in (1, 3) then '남' else '여' end gender,
tel, TO_CHAR(TO_DATE(resvdate), 'yyyy"년"mm"월"dd"일"') resvdate, resvtime, hospname, hosptel, hospaddr,
case when vcode = 'V001' then 'A백신' when vcode = 'V002' then 'B백신' when vcode = 'V003' then 'C백신' end vname
from tbl_jumin_201808 j, tbl_hosp_202108 h, tbl_vaccresv_202108 v
where j.jumin = v.jumin and h.hospcode = v.hospcode;

select * from (select h.hospcode,  hospname, count(h.hospcode) cnt
from
tbl_hosp_202108 h, tbl_vaccresv_202108 v
where h.hospcode = v.hospcode
group by ROLLUP((h.hospcode,  hospname))
order by h.hospcode)