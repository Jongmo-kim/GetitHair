--INSERT ���� �Դϴ�. �� ������ �������������ּ���!!!!
--�Է°��� �����е��� �����ؼ� �����ŵ� �˴ϴ�. ��� FK �������� �� ���Ѽ� �������ּ���
--�����Ҷ� �� ������ü���� �������� ���ð� ���ο� sql �Է�â�� �����ϼż� �ű⼭ �����ѵ� �������ּ���
--�ǵ��� ���� �ִ°ͺ��� INSERT �ϼž� FK �������� ������ �߻����� �ʽ��ϴ�.
--������ INSERT �� COMMIT �� �ʼ������� ���ּ���!!!!!!!!!!!!!!!!!!!!!
--�� ���̺� INSERT
--��� ���� ���̺� INSERT
--CUSTOMER ��ȣ�� �����ؾ߸� ���� �߻� ����.
--��� �� INSERT
--����ڹ�ȣ ����ũ�Դϴ�.
--�� �ü� ���� ���̺� INSERT
--��� �� ��ȣ�� �����ؾ߸� ���� �߻� ����.
--�����̳� ���̺� INSERT
--�����̳� ����Ʈ ���̺� INSERT
--SHOP ��ȣ�� DESIGNER ��ȣ�� �����ؾ߸� ���� �߻� ����.
--��Ÿ�� ���̺� INSERT
--��Ÿ�� ����Ʈ ���̺� INSERT
--STYLE ��ȣ�� DESIGNER ��ȣ�� �����ؾ߸� ���� �߻� ����.
--���� ���̺� INSERT
--CUSTOMER ��ȣ, DESINGER ��ȣ, SHOP ��ȣ,STYLE_LIST ��ȣ�� �����ؾ߸� ���� �߻� ����.
--���� ���̺� INSERT
--SHOP ��ȣ,DESIGNER ��ȣ,CUSTOMER ��ȣ, STYLE ��ȣ�� �����ؾ߸� ���� �߻� ����.
--���ƿ� ���̺� INSERT
--CUSTOMER ��ȣ�� �����ؾ߸� ���� �߻� ����.
--LIKE_TYPE �� 1������ ������ H : HAIRSHOP , S : STYLE, R : REVIEW 

DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<31)
    LOOP
    INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.NEXTVAL,'user0'||CUSTOMER_SEQ.CURRVAL,'1234','1990-08-08','����','ȫ�浿','asd@naver.com','��⵵ ���� ���籸','010-1234-5678','���ּ�','10001',sysdate);
    INSERT INTO HAIR_INFO VALUES(hair_info_seq.nextval,'����','����','����','���¸��','��������','Ǫ���Ѹ��','��ġ����');
    INSERT INTO HAIRSHOP VALUES(HAIRSHOP_SEQ.NEXTVAL,'hair0'||hairshop_seq.currval,'1234',hairshop_seq.currval||'-45-67890','ȫ�����','���� �������� ��굿','02-1234-1234','08:00','21:00','���� ȭ����',5,0,'���ּ�','10123',sysdate);        
    INSERT INTO DESIGNER VALUES(DESIGNER_SEQ.NEXTVAL,'designer0'||designer_SEQ.currval,'1234','�迵��','010-1234-5678',3,'����','�ȳ��Ͻʴϱ� ���� �̽ô� �ְ��� �����̳� �����̳� �ֶ�� �մϴ�. ���� Ư��� ���̰� ����, ���߿����� ���밡������ �庴���� �ؾ��ϴ�...',sysdate);--��������
    INSERT INTO DESIGNER_LIST VALUES(DESIGNER_LIST_SEQ.NEXTVAL,DESIGNER_SEQ.currval,DESIGNER_SEQ.currval);
    INSERT INTO STYLE VALUES(STYLE_SEQ.NEXTVAL,'perm','��Ÿ���̸�',0);
    INSERT INTO STYLE_LIST VALUES(style_list_seq.nextval,style_list_seq.currval,style_list_seq.currval);
    INSERT INTO SHOP_PRICE VALUES(SHOP_PRICE_SEQ.NEXTVAL,SHOP_PRICE_SEQ.currval,15000,style_list_seq.currval);
    INSERT INTO RESERVE VALUES(RESERVE_SEQ.NEXTVAL,1,1,1,1,'��������',default,'�մԿ�û','�����̳ʿ�û','�����̳ʸ޸�',sysdate,sysdate + (1/1440*15)*reserve_seq.currval*7, sysdate + (1/1440*15)*reserve_seq.currval*8);
    INSERT INTO REVIEW VALUES(review_seq.nextval,review_seq.currval,review_seq.currval,review_seq.currval,review_seq.currval,'�����ε� �� �̿�� �����̳ʺ� ���� ��������׿�',5,0,SYSDATE);
    INSERT INTO LIKES VALUES(likes_seq.nextval,likes_seq.currval,decode(MOD(floor(DBMS_RANDOM.VALUE(1,4)),3),0,'h',1,'r',2,'s'),likes_seq.currval);
    INSERT INTO DESIGNER_PORTFOLIO VALUES(DESIGNER_PORTFOLIO_SEQ.NEXTVAL,1,'���̾����','���̾���� �ü� �����Դϴ�.',SYSDATE);    -- ��Ʈ������ insert��
    
    NUM1 := NUM1+1; 
    END LOOP;
END;
/
insert into admin values(admin_seq.nextval,'admin', '1234');
-- �ʼ�!!!!!!
COMMIT;

