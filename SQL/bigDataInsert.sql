
--���� ���� customer ������ �뷮 INSERT
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
INSERT INTO CUSTOMER 
    VALUES(
    default,
    'user0'||customer_seq.currval,
    '1234',to_char((sysdate-customer_seq.currval-100),'yyyy-mm-dd'),decode(MOD(NUM1,2),1,'����',0,'����'),'ȫ�浿',
    'asd@naver.com',
    '��⵵ ���� ���籸',
    '010-1234-5678',
    '���ּ�',
    '10001',
    sysdate);
    NUM1 := NUM1+1; 
    END LOOP;
END;