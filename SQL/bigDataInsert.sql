--대량 입력


--고객 테이블 INSERT (종모)
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

--헤어 정보 테이블 INSERT  (도현)
--CUSTOMER 번호가 존재해야만 오류 발생 없음.
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
INSERT INTO HAIR_INFO 
    VALUES(
    NUM1,
    '지성',
    '곱슬',
    '많음',
    '가는모발',
    '볼륨부족',
    '푸석한모발',
    '새치조금');
    NUM1 := NUM1+1; 
    END LOOP;
END;
/

--헤어샵 시술 가격 테이블 INSERT (도현)
--헤어 샵 번호가 존재해야만 오류 발생 없음.
INSERT INTO SHOP_PRICE
VALUES(SHOP_PRICE_SEQ.NEXTVAL,1,15000);
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
INSERT INTO SHOP_PRICE
    VALUES(SHOP_PRICE_SEQ.NEXTVAL,1,15000);
    NUM1 := NUM1+1; 
    END LOOP;
END;
COMMIT;
