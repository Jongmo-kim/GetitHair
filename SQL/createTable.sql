-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- hairshop Table Create SQL
CREATE TABLE hairshop
(
    shop_no          NUMBER           NOT NULL, 
    shop_comp_no     VARCHAR2(50)     NOT NULL UNIQUE, 
    shop_name        VARCHAR2(100)    NOT NULL, 
    shop_addr        VARCHAR2(200)    NOT NULL, 
    shop_phone       char(15)         NOT NULL, 
    shop_open        VARCHAR2(20)     NOT NULL, 
    shop_close       VARCHAR2(20)     NOT NULL, 
    shop_holiday     VARCHAR2(20)     NOT NULL, 
    shop_rate        NUMBER          DEFAULT 0 NOT NULL, 
    shop_img         VARCHAR2(300)    NULL, 
    shop_likes       NUMBER          DEFAULT 0 NOT NULL, 
    addr_detail      VARCHAR2(200)    NOT NULL, 
    addr_postcode    char(5)          NOT NULL, 
    CONSTRAINT HAIRSHOP_PK PRIMARY KEY (shop_no)
)
/

CREATE SEQUENCE hairshop_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER hairshop_AI_TRG
BEFORE INSERT ON hairshop 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT hairshop_SEQ.NEXTVAL
    INTO :NEW.shop_no
    FROM DUAL;
END;
/

--DROP TRIGGER hairshop_AI_TRG;
/

--DROP SEQUENCE hairshop_SEQ;
/

COMMENT ON TABLE hairshop IS '��'
/

COMMENT ON COLUMN hairshop.shop_no IS '����ȣ'
/

COMMENT ON COLUMN hairshop.shop_comp_no IS '����ڵ�Ϲ�ȣ'
/

COMMENT ON COLUMN hairshop.shop_name IS '����ڸ�'
/

COMMENT ON COLUMN hairshop.shop_addr IS '�ּ���'
/

COMMENT ON COLUMN hairshop.shop_phone IS '��ȭ��ȣ'
/

COMMENT ON COLUMN hairshop.shop_time IS '�����ð�'
/

COMMENT ON COLUMN hairshop.shop_open IS '�������۽ð�'
/

COMMENT ON COLUMN hairshop.shop_close IS '���������ð�'
/

COMMENT ON COLUMN hairshop.shop_holiday IS '�����޹���'
/

COMMENT ON COLUMN hairshop.shop_rate IS '����'
/

COMMENT ON COLUMN hairshop.shop_img IS '�����̹���'
/

COMMENT ON COLUMN hairshop.shop_likes IS '���ƿ��'
/

COMMENT ON COLUMN hairshop.addr_detail IS '���ּ�'
/

COMMENT ON COLUMN hairshop.addr_postcode IS '�����ȣ'
/


-- hairshop Table Create SQL
CREATE TABLE designer
(
    designer_no         NUMBER            NOT NULL, 
    shop_no             NUMBER            NULL, 
    designer_id         VARCHAR2(20)      NOT NULL UNIQUE, 
    designer_pw         VARCHAR2(20)      NOT NULL, 
    designer_gen        CHAR(3)           NOT NULL, 
    designer_name       VARCHAR2(20)      NOT NULL, 
    designer_email      VARCHAR2(30)      NOT NULL, 
    designer_phone      CHAR(13)          NOT NULL, 
    designer_year       NUMBER            NOT NULL, 
    designer_rank       VARCHAR2(20)      NOT NULL, 
    designer_intro      VARCHAR2(2000)    NULL, 
    designer_keyword    VARCHAR2(300)     NULL, 
    designer_img        VARCHAR2(300)     NULL, 
    CONSTRAINT DESIGNER_PK PRIMARY KEY (designer_no)
)
/

CREATE SEQUENCE designer_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER designer_AI_TRG
BEFORE INSERT ON designer 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT designer_SEQ.NEXTVAL
    INTO :NEW.designer_no
    FROM DUAL;
END;
/

--DROP TRIGGER designer_AI_TRG;
/

--DROP SEQUENCE designer_SEQ;
/

COMMENT ON TABLE designer IS '�����̳�'
/

COMMENT ON COLUMN designer.designer_no IS '�����̳ʹ�ȣ'
/

COMMENT ON COLUMN designer.shop_no IS '�Ҽӹ̿��'
/

COMMENT ON COLUMN designer.designer_id IS '���̵�'
/

COMMENT ON COLUMN designer.designer_pw IS '��й�ȣ'
/

COMMENT ON COLUMN designer.designer_gen IS '����'
/

COMMENT ON COLUMN designer.designer_name IS '�̸�'
/

COMMENT ON COLUMN designer.designer_email IS '�̸���'
/

COMMENT ON COLUMN designer.designer_phone IS '�ڵ�����ȣ'
/

COMMENT ON COLUMN designer.designer_year IS '���'
/

COMMENT ON COLUMN designer.designer_rank IS '����'
/

COMMENT ON COLUMN designer.designer_intro IS '�Ұ���'
/

COMMENT ON COLUMN designer.designer_keyword IS '��Ÿ��Ű����(����'
/

COMMENT ON COLUMN designer.designer_img IS '�����̳��������̹���'
/

ALTER TABLE designer
    ADD CONSTRAINT FK_designer_shop_no_hairshop_s FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/


-- hairshop Table Create SQL
CREATE TABLE customer
(
    customer_no       NUMBER           NOT NULL, 
    customer_id       VARCHAR2(20)     NOT NULL UNIQUE, 
    customer_pw       VARCHAR2(20)     NOT NULL, 
    customer_birthdate CHAR(10)        NOT NULL,
    customer_gen      VARCHAR2(20)     NOT NULL, 
    customer_name     VARCHAR2(20)     NOT NULL, 
    customer_email    varchar2(30)     NOT NULL, 
    customer_addr     varchar2(100)    NOT NULL, 
    customer_phone    char(13)         NOT NULL, 
    addr_detail       varchar2(100)    NOT NULL,
    addr_postcode     char(5)          NOT NULL,
    customer_enrolldate DATE           NOT NULL,
    CONSTRAINT CUSTOMER_PK PRIMARY KEY (customer_no)
)
/

CREATE SEQUENCE customer_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER customer_AI_TRG
BEFORE INSERT ON customer 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT customer_SEQ.NEXTVAL
    INTO :NEW.customer_no
    FROM DUAL;
END;
/

--DROP TRIGGER customer_AI_TRG;
/

--DROP SEQUENCE customer_SEQ;
/

COMMENT ON TABLE customer IS 'ȸ��'
/

COMMENT ON COLUMN customer.customer_no IS 'ȸ����ȣ'
/

COMMENT ON COLUMN customer.customer_id IS '���̵�'
/

COMMENT ON COLUMN customer.customer_pw IS '��й�ȣ'
/

COMMENT ON COLUMN customer.customer_gen IS '����'
/

COMMENT ON COLUMN customer.customer_name IS '�̸�'
/

COMMENT ON COLUMN customer.customer_email IS '�̸���'
/

COMMENT ON COLUMN customer.customer_addr IS '�ּ�'
/

COMMENT ON COLUMN customer.customer_phone IS '�ڵ�����ȣ'
/

COMMENT ON COLUMN customer.addr_detail IS '���ּ�'
/

COMMENT ON COLUMN customer.addr_postcode IS '�����ȣ'
/


-- hairshop Table Create SQL
CREATE TABLE style
(
    style_no       NUMBER           NOT NULL, 
    style_type     VARCHAR2(20)     NOT NULL, 
    style_name     VARCHAR2(30)     NOT NULL, 
    style_img      VARCHAR2(300)    NOT NULL, 
    style_likes    NUMBER           DEFAULT 0 NOT NULL, 
    CONSTRAINT STYLE_PK PRIMARY KEY (style_no)
)
/

CREATE SEQUENCE style_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER style_AI_TRG
BEFORE INSERT ON style 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT style_SEQ.NEXTVAL
    INTO :NEW.style_no
    FROM DUAL;
END;
/

--DROP TRIGGER style_AI_TRG;
/

--DROP SEQUENCE style_SEQ;
/

COMMENT ON TABLE style IS '��Ÿ��'
/

COMMENT ON COLUMN style.style_no IS '�ü���ȣ'
/

COMMENT ON COLUMN style.style_type IS '�ü�Ÿ��'
/

COMMENT ON COLUMN style.style_name IS '�ü���'
/

COMMENT ON COLUMN style.style_img IS '��Ÿ���̹���'
/

COMMENT ON COLUMN style.style_likes IS '���ƿ��'
/


-- hairshop Table Create SQL
CREATE TABLE hair_info
(
    customer_no      NUMBER          NOT NULL,
    myhair_scalp     VARCHAR2(20)    NULL,
    myhair_curly     VARCHAR2(20)    NULL, 
    myhair_rich      VARCHAR2(20)    NULL, 
    myhair_bold      VARCHAR2(20)    NULL, 
    myhair_vol       VARCHAR2(20)    NULL, 
    myhair_status    VARCHAR2(20)    NULL, 
    myhair_old       VARCHAR2(20)    NULL, 
    CONSTRAINT HAIR_INFO_PK PRIMARY KEY (customer_no)
)
/

COMMENT ON TABLE hair_info IS '�߰�����'
/

COMMENT ON COLUMN hair_info.customer_no IS 'ȸ����ȣ'
/

COMMENT ON COLUMN hair_info.myhair_curly IS '��������'
/

COMMENT ON COLUMN hair_info.myhair_rich IS '�Ӹ���'
/

COMMENT ON COLUMN hair_info.myhair_bold IS '��߱���'
/

COMMENT ON COLUMN hair_info.myhair_vol IS '��ߺ���'
/

COMMENT ON COLUMN hair_info.myhair_status IS '��߻���'
/

COMMENT ON COLUMN hair_info.myhair_old IS '��߳�ȭ����'
/

ALTER TABLE hair_info
    ADD CONSTRAINT FK_hair_info_customer_no_custo FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no)
/


-- hairshop Table Create SQL
CREATE TABLE review
(
    review_no         NUMBER           NOT NULL, 
    shop_no           NUMBER           NOT NULL, 
    designer_no       NUMBER           NOT NULL, 
    customer_no       NUMBER           NOT NULL, 
    style_no          NUMBER           NOT NULL, 
    review_content    VARCHAR2(200)    NOT NULL, 
    review_rate       NUMBER           NOT NULL, 
    review_likes      NUMBER           DEFAULT 0 NOT NULL, 
    review_date       DATE             NOT NULL, 
    review_img        VARCHAR2(300)    NULL, 
    CONSTRAINT REVIEW_PK PRIMARY KEY (review_no)
)
/

CREATE SEQUENCE review_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER review_AI_TRG
BEFORE INSERT ON review 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT review_SEQ.NEXTVAL
    INTO :NEW.review_no
    FROM DUAL;
END;
/

--DROP TRIGGER review_AI_TRG;
/

--DROP SEQUENCE review_SEQ;
/

COMMENT ON TABLE review IS '����'
/

COMMENT ON COLUMN review.review_no IS '�����ȣ'
/

COMMENT ON COLUMN review.shop_no IS '�̿�ǹ�ȣ'
/

COMMENT ON COLUMN review.designer_no IS '�����̳ʹ�ȣ'
/

COMMENT ON COLUMN review.customer_no IS 'ȸ����ȣ'
/

COMMENT ON COLUMN review.style_no IS '�ü���ȣ'
/

COMMENT ON COLUMN review.review_content IS '���䳻��'
/

COMMENT ON COLUMN review.review_rate IS '����'
/

COMMENT ON COLUMN review.review_likes IS '���ƿ��'
/

COMMENT ON COLUMN review.review_date IS '�ۼ���¥'
/

COMMENT ON COLUMN review.review_img IS '�����̹���'
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_shop_no_hairshop_sho FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_designer_no_designer FOREIGN KEY (designer_no)
        REFERENCES designer (designer_no)
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_customer_no_customer FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no)
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_style_no_style_style FOREIGN KEY (style_no)
        REFERENCES style (style_no)
/


-- hairshop Table Create SQL
CREATE TABLE reserve
(
    reserve_no               NUMBER           NOT NULL, 
    customer_no              NUMBER           NOT NULL, 
    designer_no              NUMBER           NOT NULL, 
    shop_no                  NUMBER           NOT NULL, 
    reserve_date             DATE             NOT NULL, 
    reserve_status           char(9)          NOT NULL, 
    reserve_cust_req         VARCHAR2(300)    NULL, 
    reserve_designer_req     VARCHAR2(300)    NULL, 
    reserve_designer_memo    VARCHAR2(300)    NULL, 
    CONSTRAINT RESERVE_PK PRIMARY KEY (reserve_no)
)
/

CREATE SEQUENCE reserve_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER reserve_AI_TRG
BEFORE INSERT ON reserve 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT reserve_SEQ.NEXTVAL
    INTO :NEW.reserve_no
    FROM DUAL;
END;
/

--DROP TRIGGER reserve_AI_TRG;
/

--DROP SEQUENCE reserve_SEQ;
/

COMMENT ON TABLE reserve IS '����'
/

COMMENT ON COLUMN reserve.reserve_no IS '�����ȣ'
/

COMMENT ON COLUMN reserve.customer_no IS '�մԹ�ȣ'
/

COMMENT ON COLUMN reserve.designer_no IS '�����̳ʹ�ȣ'
/

COMMENT ON COLUMN reserve.shop_no IS '�̿�ǹ�ȣ'
/

COMMENT ON COLUMN reserve.reserve_date IS '�����Ͻ�'
/

COMMENT ON COLUMN reserve.reserve_status IS '�����ڵ�'
/

COMMENT ON COLUMN reserve.reserve_cust_req IS '�մ� ��û����'
/

COMMENT ON COLUMN reserve.reserve_designer_req IS '�����̳� ��û����'
/

COMMENT ON COLUMN reserve.reserve_designer_memo IS '�����̳� �մԿ� ���� �޸�'
/

ALTER TABLE reserve
    ADD CONSTRAINT FK_reserve_customer_no_custome FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no)
/

ALTER TABLE reserve
    ADD CONSTRAINT FK_reserve_designer_no_designe FOREIGN KEY (designer_no)
        REFERENCES designer (designer_no)
/

ALTER TABLE reserve
    ADD CONSTRAINT FK_reserve_shop_no_hairshop_sh FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/


-- hairshop Table Create SQL
CREATE TABLE designer_list
(
    designerlist_no    NUMBER    NOT NULL, 
    shop_no            NUMBER    NOT NULL, 
    designer_no        NUMBER    NOT NULL, 
    CONSTRAINT DESIGNER_LIST_PK PRIMARY KEY (designerlist_no)
)
/

CREATE SEQUENCE designer_list_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER designer_list_AI_TRG
BEFORE INSERT ON designer_list 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT designer_list_SEQ.NEXTVAL
    INTO :NEW.designerlist_no
    FROM DUAL;
END;
/

--DROP TRIGGER designer_list_AI_TRG;
/

--DROP SEQUENCE designer_list_SEQ;
/

COMMENT ON TABLE designer_list IS '�����̳ʸ���Ʈ'
/

COMMENT ON COLUMN designer_list.designerlist_no IS '�����̳ʸ���Ʈ��Ϲ�ȣ'
/

COMMENT ON COLUMN designer_list.shop_no IS '����ȣ'
/

COMMENT ON COLUMN designer_list.designer_no IS '�����̳ʹ�ȣ'
/

ALTER TABLE designer_list
    ADD CONSTRAINT FK_designer_list_shop_no_hairs FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/

ALTER TABLE designer_list
    ADD CONSTRAINT FK_designer_list_designer_no_d FOREIGN KEY (designer_no)
        REFERENCES designer (designer_no)
/


-- hairshop Table Create SQL
CREATE TABLE style_list
(
    stylelist_no    NUMBER    NOT NULL, 
    style_no        NUMBER    NOT NULL, 
    designer_no     NUMBER    NOT NULL, 
    price           NUMBER    NOT NULL, 
    CONSTRAINT STYLE_LIST_PK PRIMARY KEY (stylelist_no)
)
/

CREATE SEQUENCE style_list_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER style_list_AI_TRG
BEFORE INSERT ON style_list 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT style_list_SEQ.NEXTVAL
    INTO :NEW.stylelist_no
    FROM DUAL;
END;
/

--DROP TRIGGER style_list_AI_TRG;
/

--DROP SEQUENCE style_list_SEQ;
/

COMMENT ON TABLE style_list IS '��Ÿ�ϸ���Ʈ'
/

COMMENT ON COLUMN style_list.stylelist_no IS '��Ÿ�ϸ���Ʈ��ȣ'
/

COMMENT ON COLUMN style_list.style_no IS '��Ÿ�Ϲ�ȣ'
/

COMMENT ON COLUMN style_list.designer_no IS '�����̳ʹ�ȣ'
/

COMMENT ON COLUMN style_list.price IS '�ü�����'
/

ALTER TABLE style_list
    ADD CONSTRAINT FK_style_list_designer_no_desi FOREIGN KEY (designer_no)
        REFERENCES designer (designer_no)
/

ALTER TABLE style_list
    ADD CONSTRAINT FK_style_list_style_no_style_s FOREIGN KEY (style_no)
        REFERENCES style (style_no)
/


-- hairshop Table Create SQL
CREATE TABLE likes
(
    like_no         NUMBER     NOT NULL, 
    customer_no     NUMBER     NOT NULL, 
    like_type       char(1)    NOT NULL, 
    like_type_no    NUMBER     NOT NULL, 
    CONSTRAINT LIKES_PK PRIMARY KEY (like_no)
)
/

CREATE SEQUENCE likes_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER likes_AI_TRG
BEFORE INSERT ON likes 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT likes_SEQ.NEXTVAL
    INTO :NEW.like_no
    FROM DUAL;
END;
/

--DROP TRIGGER likes_AI_TRG;
/

--DROP SEQUENCE likes_SEQ;
/

COMMENT ON TABLE likes IS '���ƿ�'
/

COMMENT ON COLUMN likes.like_no IS '���ƿ��ȣ'
/

COMMENT ON COLUMN likes.customer_no IS 'ȸ����ȣ'
/

COMMENT ON COLUMN likes.like_type IS '����Ÿ��(h rs'
/

COMMENT ON COLUMN likes.like_type_no IS '����ȣ or �ü���ȣ'
/

ALTER TABLE likes
    ADD CONSTRAINT FK_likes_customer_no_customer_ FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no)
/


-- hairshop Table Create SQL
CREATE TABLE admin
(
    admin_no    NUMBER          NOT NULL, 
    admin_id    VARCHAR2(20)    NOT NULL UNIQUE, 
    admin_pw    VARCHAR2(20)    NOT NULL, 
    CONSTRAINT ADMIN_PK PRIMARY KEY (admin_no)
)
/

CREATE SEQUENCE admin_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER admin_AI_TRG
BEFORE INSERT ON admin 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT admin_SEQ.NEXTVAL
    INTO :NEW.admin_no
    FROM DUAL;
END;
/

--DROP TRIGGER admin_AI_TRG;
/

--DROP SEQUENCE admin_SEQ;
/


