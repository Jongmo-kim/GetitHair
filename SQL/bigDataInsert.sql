--�뷮 �Է�


--�� ���̺� INSERT (����)
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
    decode(MOD(NUM1,2),1,'����',0,'����'),'ȫ�浿',
    dbms_random.string('l', 8)||'@'||dbms_random.string('l', 7)||'.com',
    '��⵵ ���� ���籸',
    '01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0),
    '���ּ�',
    '10001',
    sysdate);
    NUM1 := NUM1+1; 
    END LOOP;
END;
/

--��� ���� ���̺� INSERT  (����)
--CUSTOMER ��ȣ�� �����ؾ߸� ���� �߻� ����.
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
INSERT INTO HAIR_INFO 
    VALUES(
    NUM1,
    '����',
    '����',
    '����',
    '���¸��',
    '��������',
    'Ǫ���Ѹ��',
    '��ġ����');
    NUM1 := NUM1+1; 
    END LOOP;
END;
/

--�� �ü� ���� ���̺� INSERT (����)
--��� �� ��ȣ�� �����ؾ߸� ���� �߻� ����.
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
