create table TBL_CAR_202504(
	CAR_ID		NUMBER		primary key,
	CAR_NAME	VARCHAR2(100),
	BUY_PRICE	NUMBER,
	DEALER_ID	NUMBER,
	IS_SOLD		CHAR(1)
)

insert into TBL_CAR_202504 values (1, '쏘나타', 1000, 1, 'Y');
insert into TBL_CAR_202504 values (2, '그랜저', 1500, 2, 'Y');
insert into TBL_CAR_202504 values (3, 'K5', 1200, 1, 'N');
insert into TBL_CAR_202504 values (4, 'K7', 1600, 3, 'Y');
insert into TBL_CAR_202504 values (5, '아반떼', 800, 2, 'Y');
insert into TBL_CAR_202504 values (6, 'SM6', 1100, 3, 'N');
insert into TBL_CAR_202504 values (7, '말리부', 1300, 1, 'N');
insert into TBL_CAR_202504 values (8, '티볼리', 900, 2, 'Y');
insert into TBL_CAR_202504 values (9, '스포티지', 1700, 3, 'Y');
insert into TBL_CAR_202504 values (10, '투싼', 1400, 1, 'N');
insert into TBL_CAR_202504 values (11, '제네시스', 2500, 2, 'Y');
insert into TBL_CAR_202504 values (12, '레이', 700, 3, 'N');

create table TBL_DEALER_202504(
	DEALER_ID		NUMBER		primary key,
	DEALER_NAME		VARCHAR2(100)
)

insert into TBL_DEALER_202504 values (1, '홍길동');
insert into TBL_DEALER_202504 values (2, '김영희');
insert into TBL_DEALER_202504 values (3, '박철수');

create table TBL_SALES_202504(
	SALES_ID		number		primary key,
	CAR_ID			number		not null,
	DEALER_ID		number		not null,
	SELL_PRICE		number,
	constraint CAR_ID_FK foreign key(CAR_ID) references TBL_CAR_202504 (CAR_ID),
	constraint DEALER_ID_FK foreign key(DEALER_ID) references TBL_DEALER_202504 (DEALER_ID)
)

insert into TBL_SALES_202504 values (1, 1, 1, 1200);
insert into TBL_SALES_202504 values (2, 2, 2, 1800);
insert into TBL_SALES_202504 values (3, 4, 3, 1920);
insert into TBL_SALES_202504 values (4, 5, 2, 960);
insert into TBL_SALES_202504 values (5, 8, 2, 1080);
insert into TBL_SALES_202504 values (6, 9, 3, 2040);
insert into TBL_SALES_202504 values (7, 11, 2, 3000);
insert into TBL_SALES_202504 values (8, 12, 3, 840);

select * from TBL_CAR_202504;
delete from TBL_CAR_202504 where CAR_ID = 13;
SELECT nvl(max(car_id), 0) car_id from TBL_CAR_202504

select CAR_ID, CAR_NAME, TRIM(TO_CHAR(BUY_PRICE, '999,999,999')) || '만원' BUY_PRICE,
TRIM(TO_CHAR(BUY_PRICE * 1.2, '999,999,999')) || '만원' SELL_PRICE, 
DEALER_NAME
FROM TBL_CAR_202504 c, TBL_DEALER_202504 d
where c.dealer_id = d.dealer_id and IS_SOLD = 'N'

select DEALER_NAME, COUNT(*) || '건' total, TRIM(TO_CHAR(SUM(SELL_PRICE), '999,999,999')) || '만원' TOTAL_PRICE
FROM TBL_DEALER_202504 d, TBL_SALES_202504 s
where d.DEALER_ID = s.DEALER_ID
GROUP BY DEALER_NAME
ORDER BY DEALER_NAME asc

select DEALER_NAME, TO_NUMBER(TRIM(TO_CHAR(SUM(SELL_PRICE)* 0.05, '999,999,999'))) INSENTIVE,
rank() over(order by SUM(SELL_PRICE) * 0.05 desc) rank_insentive
FROM TBL_DEALER_202504 d, TBL_SALES_202504 s
where d.DEALER_ID = s.DEALER_ID
GROUP BY DEALER_NAME
order by INSENTIVE desc