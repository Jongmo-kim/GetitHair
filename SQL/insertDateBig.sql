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
DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<101)
    LOOP
    
INSERT INTO HAIRSHOP
VALUES(DEFAULT,
         lpad(floor(DBMS_RANDOM.VALUE(0,999)),3,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99)),2,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99999)),5,0),
        'ȫ�����',
        '���� �������� ��굿',
        '0'||floor(DBMS_RANDOM.VALUE(0,99))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0),
        '08:00','21:00',
        '���� ȭ����'
        ,0,null,0,'���ּ�','10123');
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
    '��',
    '�迵��'
    ,
    dbms_random.string('l', 8)||'@'||dbms_random.string('l', 7)||'.com'
    ,'01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)
    ,floor(DBMS_RANDOM.VALUE(0,4)),'����','�Ұ�','Ű����',null);
    NUM1 := NUM1+1; 
    END LOOP;
END;
/
select * from design

INSERT INTO DESIGNER
VALUES(DEFAULT,'designer01','1234','��','�迵��','asdf@naver.com','010-1234-5678',3,'����','�Ұ�','Ű����',null);

select * from hairshop;
select * from hairshop;
INSERT INTO HAIRSHOP
VALUES(DEFAULT,'123-45-67890','ȫ�����','���� �������� ��굿','02-1234-1234','08:00','21:00','���� ȭ����',0,null,0,'���ּ�','10123');

--�����
select '0'||floor(DBMS_RANDOM.VALUE(0,99))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0) rand from dual;

--����
select lpad(floor(DBMS_RANDOM.VALUE(0,999)),3,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99)),2,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,99999)),5,0) rand from dual;

--�ڵ���
select '01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0) rand from dual;


select * from customer;
select '01'||floor(DBMS_RANDOM.VALUE(0,9))||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0)||'-'||lpad(floor(DBMS_RANDOM.VALUE(0,9999)),4,0) rand from dual;

select floor(dbms_random.value(1, 10)) from dual;