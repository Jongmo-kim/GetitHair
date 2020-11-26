DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
INSERT INTO CUSTOMER 
    VALUES(
    customer_seq.nextval,
    'user0'||customer_seq.currval,
    '1234',
    to_char((sysdate-customer_seq.currval-100),'yyyy-mm-dd'),
    decode(MOD(NUM1,2),1,'남성',0,'여자'),'홍길동',
    dbms_random.string('l', 8)||'@'||dbms_random.string('l', 7)||'.com',
    '경기도 고양시 덕양구',
    '01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0),
    '상세주소',
    '10001',
    sysdate);
    NUM1 := NUM1+1; 
    END LOOP;
END;
/
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
    
INSERT INTO HAIRSHOP
VALUES(DEFAULT,
         lpad(floor(DBMS_RANDOM.VALUE(0,999)),3,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99)),2,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99999)),5,0),
        '홍길헤어',
        '서울 영등포구 당산동',
        '0'||floor(DBMS_RANDOM.VALUE(0,99))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0),
        '08:00','21:00',
        '매주 화요일'
        ,0,null,0,'상세주소','10123');
    NUM1 := NUM1+1; 
    END LOOP;
END;
/
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
    
INSERT INTO DESIGNER
VALUES(DEFAULT,
    'designer0'||NUM1,'1234',
    '여',
    '김영희'
    ,
    dbms_random.string('l', 8)||'@'||dbms_random.string('l', 7)||'.com'
    ,'01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)
    ,floor(DBMS_RANDOM.VALUE(0,4)),'직급','소개','키워드',null);
    NUM1 := NUM1+1; 
    END LOOP;
END;
/
select * from design

INSERT INTO DESIGNER
VALUES(DEFAULT,'designer01','1234','여','김영희','asdf@naver.com','010-1234-5678',3,'직급','소개','키워드',null);

select * from hairshop;
select * from hairshop;
INSERT INTO HAIRSHOP
VALUES(DEFAULT,'123-45-67890','홍길헤어','서울 영등포구 당산동','02-1234-1234','08:00','21:00','매주 화요일',0,null,0,'상세주소','10123');

--사업자
select '0'||floor(DBMS_RANDOM.VALUE(0,99))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0) rand from dual;

--지번
select lpad(floor(DBMS_RANDOM.VALUE(0,999)),3,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99)),2,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99999)),5,0) rand from dual;

--핸드폰
select '01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0) rand from dual;


select * from customer;
select '01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0) rand from dual;

select floor(dbms_random.value(1, 10)) from dual;