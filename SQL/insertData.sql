--INSERT ���� �Դϴ�. �� ������ �������������ּ���!!!!
--�Է°��� �����е��� �����ؼ� �����ŵ� �˴ϴ�. ��� FK �������� �� ���Ѽ� �������ּ���
--�����Ҷ� �� ������ü���� �������� ���ð� ���ο� sql �Է�â�� �����ϼż� �ű⼭ �����ѵ� �������ּ���
--�ǵ��� ���� �ִ°ͺ��� INSERT �ϼž� FK �������� ������ �߻����� �ʽ��ϴ�.
--������ INSERT �� COMMIT �� �ʼ������� ���ּ���!!!!!!!!!!!!!!!!!!!!!

--�� ���̺� INSERT
INSERT INTO CUSTOMER 
VALUES(CUSTOMER_SEQ_NEXTVAL,'user01','1234','1990-08-08','����','ȫ�浿','asd@naver.com','��⵵ ���� ���籸','010-1234-5678','���ּ�','10001',sysdate);

--��� ���� ���̺� INSERT
--CUSTOMER ��ȣ�� �����ؾ߸� ���� �߻� ����.
INSERT INTO HAIR_INFO
VALUES(1,'����','����','����','���¸��','��������','Ǫ���Ѹ��','��ġ����');

--��� �� INSERT
INSERT INTO HAIRSHOP
VALUES(DEFAULT,'123-45-67890','ȫ�����','���� �������� ��굿','02-1234-1234','08:00','21:00','���� ȭ����',0,null,0,'���ּ�','10123');

--�� �ü� ���� ���̺� INSERT
--��� �� ��ȣ�� �����ؾ߸� ���� �߻� ����.
INSERT INTO SHOP_PRICE
VALUES(SHOP_PRICE_SEQ.NEXTVAL,1,15000);

--�����̳� ���̺� INSERT
INSERT INTO DESIGNER
VALUES(DEFAULT,'designer01','1234','��','�迵��','asdf@naver.com','010-1234-5678',3,'����','�Ұ�','Ű����',null);

--�����̳� ����Ʈ ���̺� INSERT
--SHOP ��ȣ�� DESIGNER ��ȣ�� �����ؾ߸� ���� �߻� ����.
INSERT INTO DESIGNER_LIST VALUES(DEFAULT,1,1);

--���� ���̺� INSERT
--CUSTOMER ��ȣ, DESINGER ��ȣ, SHOP ��ȣ�� �����ؾ߸� ���� �߻� ����.
INSERT INTO RESERVE 
VALUES(DEFAULT,1,1,1,SYSDATE,'����','���ڰ� ĿƮ ���ּ���','�����̳� ��û����?','�����̳� �޸�');

--��Ÿ�� ���̺� INSERT
INSERT INTO STYLE
VALUES(DEFAULT,'��Ÿ��Ÿ��','��Ÿ���̸�','�̹����ּ�',0);

--��Ÿ�� ����Ʈ ���̺� INSERT
--STYLE ��ȣ�� DESIGNER ��ȣ�� �����ؾ߸� ���� �߻� ����.
INSERT INTO STYLE_LIST
VALUES(DEFAULT,1,1,'25000');

--���� ���̺� INSERT
--SHOP ��ȣ,DESIGNER ��ȣ,CUSTOMER ��ȣ, STYLE ��ȣ�� �����ؾ߸� ���� �߻� ����.
INSERT INTO REVIEW 
VALUES(DEFAULT,1,1,1,1,'�����ε� �� �̿�� �����̳ʺ� ���� ��������׿�',5,0,SYSDATE,NULL);

--���ƿ� ���̺� INSERT
--CUSTOMER ��ȣ�� �����ؾ߸� ���� �߻� ����.
--LIKE_TYPE �� 1������ ������ H : HAIRSHOP , S : STYLE, R : REVIEW 
INSERT INTO LIKES
VALUES(DEFAULT,1,'S',1);

-- �ʼ�!!!!!!
COMMIT;


