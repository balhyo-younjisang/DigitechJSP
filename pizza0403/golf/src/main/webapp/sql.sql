create table tbl_teacher_202305(
	teacher_cd		varchar2(3)		primary key,
	teacher_nm		varchar2(15),
	class_nm		varchar2(20),
	class_price		number(8),
	register_date	varchar2(8)
)

truncate table tbl_teacher_202305;

SELECT class_nm, class_price, teacher_cd from tbl_teacher_202305;

insert into tbl_teacher_202305 values ('100', '이초급', '초급반', 100000, '20220101');
insert into tbl_teacher_202305 values ('200', '김중급', '중급반', 200000, '20220102');
insert into tbl_teacher_202305 values ('300', '박고급', '고급반', 300000, '20220103');
insert into tbl_teacher_202305 values ('400', '정심화', '심화반', 400000, '20220104');

create table tbl_member_202305(
	mem_no		varchar2(5)		primary key,
	mem_nm		varchar2(15),
	phone		varchar2(11),
	address		varchar2(50)
)

insert into tbl_member_202305 values ('10001', '홍길동', '01011112222', '서울시 강남구');
insert into tbl_member_202305 values ('10002', '장발장', '01022223333', '성남시 분당구');
insert into tbl_member_202305 values ('10003', '임꺽정', '01033334444', '대전시 유성구');
insert into tbl_member_202305 values ('20001', '성춘향', '01044445555', '부산시 서구');
insert into tbl_member_202305 values ('20002', '이몽룡', '01055556666', '대구시 북구');

create table tbl_class_202305(
	class_ym		varchar2(6)		not null,
	mem_no			varchar2(5)		not null,
	class_loc		varchar2(15),
	class_price		number(8),
	teacher_cd		varchar2(3),
	constraint class_pk	primary key(class_ym, mem_no)
)

select * from tbl_class_202305;
delete from tbl_class_202305 where mem_no = '10002' and class_ym = '202504';

insert into tbl_class_202305 values ('202203', '10001', '서울본원', 100000, '100');
insert into tbl_class_202305 values ('202203', '10002', '성남분원', 100000, '100');
insert into tbl_class_202305 values ('202203', '10003', '대전분원', 200000, '200');
insert into tbl_class_202305 values ('202203', '20001', '부산분원', 150000, '300');
insert into tbl_class_202305 values ('202203', '20002', '대구분원', 200000, '400');

truncate table tbl_class_202305;

SELECT m.MEM_NO, MEM_NM, to_char(to_date(class_ym, 'yyyymm'), 'yyyy"년"mm"월"') class_ym, class_nm, class_loc, 
trim(to_char(case when substr(m.mem_no, 1, 1) = '2' then ( t.class_price / 2) else t.class_price end, 'L999,999,999')) class_price,
case when substr(m.mem_no, 1, 1) = '2' then 'VIP' else '일반' end grade
FROM TBL_MEMBER_202305 m, tbl_class_202305 c, tbl_teacher_202305 t
where m.mem_no = c.mem_no and c.teacher_cd = t.teacher_cd
;

SELECT teacher_cd, teacher_nm, class_nm, TRIM(TO_CHAR(class_price, 'L999,999,999')), TO_CHAR(TO_DATE(register_date), 'yyyy"년"mm"월"dd"일"') from tbl_teacher_202305;


SELECT c.TEACHER_CD, TEACHER_NM, CLASS_NM, TRIM(TO_CHAR(SUM(c.CLASS_PRICE), 'L999,999,999')) CLASS_PRICE
FROM TBL_CLASS_202305 c, TBL_TEACHER_202305 t
WHERE c.TEACHER_CD = t.TEACHER_CD
GROUP BY c.TEACHER_CD, TEACHER_NM, CLASS_NM
ORDER BY c.TEACHER_CD