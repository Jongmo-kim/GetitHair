
--종모가 만듦 customer 데이터 대량 INSERT
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
INSERT INTO CUSTOMER 
    VALUES(
    default,
    'user0'||customer_seq.currval,
    '1234',to_char((sysdate-customer_seq.currval-100),'yyyy-mm-dd'),decode(MOD(NUM1,2),1,'남성',0,'여자'),'홍길동',
    'asd@naver.com',
    '경기도 고양시 덕양구',
    '010-1234-5678',
    '상세주소',
    '10001',
    sysdate);
    NUM1 := NUM1+1; 
    END LOOP;
END;