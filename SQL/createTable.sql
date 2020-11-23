
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- hairshop Table Create SQL
CREATE TABLE hairshop
(
    shop_no          NUMBER           NOT NULL, 
    shop_comp_no     VARCHAR2(50)     NULL, 
    shop_name        VARCHAR2(100)    NULL, 
    shop_addr        VARCHAR2(200)    NULL, 
    shop_phone       char(15)         NULL, 
    shop_time        VARCHAR2(20)     NULL, 
    shop_open        VARCHAR2(20)     NULL, 
    shop_close       VARCHAR2(20)     NULL, 
    shop_holiday     VARCHAR2(20)     NULL, 
    shop_rate        NUMBER           NULL, 
    shop_img         VARCHAR2(300)    NULL, 
    shop_likes       NUMBER           NULL, 
    addr_detail      VARCHAR2(200)    NULL, 
    addr_postcode    char(5)          NULL, 
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

COMMENT ON TABLE hairshop IS '헤어샵'
/

COMMENT ON COLUMN hairshop.shop_no IS '헤어샵번호'
/

COMMENT ON COLUMN hairshop.shop_comp_no IS '사업자등록번호'
/

COMMENT ON COLUMN hairshop.shop_name IS '사업자명'
/

COMMENT ON COLUMN hairshop.shop_addr IS '주소지'
/

COMMENT ON COLUMN hairshop.shop_phone IS '전화번호'
/

COMMENT ON COLUMN hairshop.shop_time IS '영업시간'
/

COMMENT ON COLUMN hairshop.shop_open IS '영업시작시간'
/

COMMENT ON COLUMN hairshop.shop_close IS '영업마감시간'
/

COMMENT ON COLUMN hairshop.shop_holiday IS '정기휴무일'
/

COMMENT ON COLUMN hairshop.shop_rate IS '평점'
/

COMMENT ON COLUMN hairshop.shop_img IS '매장이미지'
/

COMMENT ON COLUMN hairshop.shop_likes IS '좋아요수'
/

COMMENT ON COLUMN hairshop.addr_detail IS '상세주소'
/

COMMENT ON COLUMN hairshop.addr_postcode IS '우편번호'
/


-- hairshop Table Create SQL
CREATE TABLE designer
(
    designer_no         NUMBER            NOT NULL, 
    designer_id         VARCHAR2(20)      NULL, 
    designer_pw         VARCHAR2(20)      NULL, 
    designer_gen        CHAR(3)           NULL, 
    designer_name       VARCHAR2(20)      NULL, 
    designer_email      VARCHAR2(30)      NULL, 
    designer_phone      CHAR(13)          NULL, 
    designer_year       NUMBER            NULL, 
    designer_rank       VARCHAR2(20)      NULL, 
    shop_no             NUMBER            NULL, 
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

COMMENT ON TABLE designer IS '디자이너'
/

COMMENT ON COLUMN designer.designer_no IS '디자이너번호'
/

COMMENT ON COLUMN designer.designer_id IS '아이디'
/

COMMENT ON COLUMN designer.designer_pw IS '비밀번호'
/

COMMENT ON COLUMN designer.designer_gen IS '성별'
/

COMMENT ON COLUMN designer.designer_name IS '이름'
/

COMMENT ON COLUMN designer.designer_email IS '이메일'
/

COMMENT ON COLUMN designer.designer_phone IS '핸드폰번호'
/

COMMENT ON COLUMN designer.designer_year IS '경력'
/

COMMENT ON COLUMN designer.designer_rank IS '직급'
/

COMMENT ON COLUMN designer.shop_no IS '소속미용실'
/

COMMENT ON COLUMN designer.designer_intro IS '소개말'
/

COMMENT ON COLUMN designer.designer_keyword IS '스타일키워드(예정)'
/

COMMENT ON COLUMN designer.designer_img IS '디자이너프로필이미지'
/

ALTER TABLE designer
    ADD CONSTRAINT FK_designer_shop_no_hairshop_s FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/


-- hairshop Table Create SQL
CREATE TABLE hair_info
(
    myhair_curly     VARCHAR2(20)    NULL, 
    myhair_rich      VARCHAR2(20)    NULL, 
    myhair_bold      VARCHAR2(20)    NULL, 
    myhair_vol       VARCHAR2(20)    NULL, 
    myhair_status    VARCHAR2(20)    NULL, 
    myhair_old       VARCHAR2(20)    NULL, 
    customer_no      NUMBER          NULL   
)
/

COMMENT ON TABLE hair_info IS '추가정보'
/

COMMENT ON COLUMN hair_info.myhair_curly IS '곱슬정도'
/

COMMENT ON COLUMN hair_info.myhair_rich IS '머리숱'
/

COMMENT ON COLUMN hair_info.myhair_bold IS '모발굵기'
/

COMMENT ON COLUMN hair_info.myhair_vol IS '모발볼륨'
/

COMMENT ON COLUMN hair_info.myhair_status IS '모발상태'
/

COMMENT ON COLUMN hair_info.myhair_old IS '모발노화상태'
/

COMMENT ON COLUMN hair_info.customer_no IS '회원번호'
/


-- hairshop Table Create SQL
CREATE TABLE customer
(
    customer_no       NUMBER           NOT NULL, 
    customer_id       VARCHAR2(20)     NULL, 
    customer_pw       VARCHAR2(20)     NULL, 
    customer_gen      VARCHAR2(20)     NULL, 
    customer_name     VARCHAR2(20)     NULL, 
    customer_email    varchar2(30)     NULL, 
    customer_addr     varchar2(100)    NULL, 
    customer_phone    char(13)         NULL, 
    addr_detail       varchar2(100)    NULL, 
    addr_postcode     char(5)          NULL, 
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

COMMENT ON TABLE customer IS '회원'
/

COMMENT ON COLUMN customer.customer_no IS '회원번호'
/

COMMENT ON COLUMN customer.customer_id IS '아이디'
/

COMMENT ON COLUMN customer.customer_pw IS '비밀번호'
/

COMMENT ON COLUMN customer.customer_gen IS '성별'
/

COMMENT ON COLUMN customer.customer_name IS '이름'
/

COMMENT ON COLUMN customer.customer_email IS '이메일'
/

COMMENT ON COLUMN customer.customer_addr IS '주소'
/

COMMENT ON COLUMN customer.customer_phone IS '핸드폰번호'
/

COMMENT ON COLUMN customer.addr_detail IS '상세주소'
/

COMMENT ON COLUMN customer.addr_postcode IS '우편번호'
/

ALTER TABLE customer
    ADD CONSTRAINT FK_customer_customer_no_hair_i FOREIGN KEY (customer_no)
        REFERENCES hair_info (customer_no)
/


-- hairshop Table Create SQL
CREATE TABLE style
(
    style_no       NUMBER           NOT NULL, 
    style_type     VARCHAR2(20)     NULL, 
    style_name     VARCHAR2(30)     NULL, 
    style_img      VARCHAR2(300)    NULL, 
    style_likes    NUMBER           NULL, 
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

COMMENT ON TABLE style IS '헤어스타일'
/

COMMENT ON COLUMN style.style_no IS '시술번호'
/

COMMENT ON COLUMN style.style_type IS '시술타입'
/

COMMENT ON COLUMN style.style_name IS '시술명'
/

COMMENT ON COLUMN style.style_img IS '스타일이미지'
/

COMMENT ON COLUMN style.style_likes IS '좋아요수'
/


-- hairshop Table Create SQL
CREATE TABLE review
(
    review_no         NUMBER           NOT NULL, 
    shop_no           NUMBER           NULL, 
    designer_no       NUMBER           NULL, 
    customer_no       NUMBER           NULL, 
    style_no          NUMBER           NULL, 
    review_content    VARCHAR2(200)    NULL, 
    review_rate       NUMBER           NULL, 
    review_likes      NUMBER           NULL, 
    review_date       DATE             NULL, 
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

COMMENT ON TABLE review IS '리뷰'
/

COMMENT ON COLUMN review.review_no IS '리뷰번호'
/

COMMENT ON COLUMN review.shop_no IS '미용실번호'
/

COMMENT ON COLUMN review.designer_no IS '디자이너번호'
/

COMMENT ON COLUMN review.customer_no IS '회원번호'
/

COMMENT ON COLUMN review.style_no IS '시술번호'
/

COMMENT ON COLUMN review.review_content IS '리뷰내용'
/

COMMENT ON COLUMN review.review_rate IS '평점'
/

COMMENT ON COLUMN review.review_likes IS '좋아요수'
/

COMMENT ON COLUMN review.review_date IS '작성날짜'
/

COMMENT ON COLUMN review.review_img IS '리뷰이미지'
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
    customer_no              NUMBER           NULL, 
    designer_no              NUMBER           NULL, 
    shop_no                  NUMBER           NULL, 
    reserve_date             DATE             NULL, 
    reserve_status           char(9)          NULL, 
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

COMMENT ON TABLE reserve IS '예약'
/

COMMENT ON COLUMN reserve.reserve_no IS '예약번호'
/

COMMENT ON COLUMN reserve.customer_no IS '손님번호'
/

COMMENT ON COLUMN reserve.designer_no IS '디자이너번호'
/

COMMENT ON COLUMN reserve.shop_no IS '미용실번호'
/

COMMENT ON COLUMN reserve.reserve_date IS '예약일시'
/

COMMENT ON COLUMN reserve.reserve_status IS '상태코드'
/

COMMENT ON COLUMN reserve.reserve_cust_req IS '손님 요청사항'
/

COMMENT ON COLUMN reserve.reserve_designer_req IS '디자이너 요청사항'
/

COMMENT ON COLUMN reserve.reserve_designer_memo IS '디자이너 손님에 대한 메모'
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
    shop_no            NUMBER    NULL, 
    designer_no        NUMBER    NULL, 
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

COMMENT ON TABLE designer_list IS '디자이너리스트'
/

COMMENT ON COLUMN designer_list.designerlist_no IS '디자이너리스트목록번호'
/

COMMENT ON COLUMN designer_list.shop_no IS '헤어샵번호'
/

COMMENT ON COLUMN designer_list.designer_no IS '디자이너번호'
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
    style_no        NUMBER    NULL, 
    designer_no     NUMBER    NULL, 
    price           NUMBER    NULL, 
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

COMMENT ON TABLE style_list IS '헤어스타일리스트'
/

COMMENT ON COLUMN style_list.stylelist_no IS '헤어스타일리스트번호'
/

COMMENT ON COLUMN style_list.style_no IS '헤어스타일번호'
/

COMMENT ON COLUMN style_list.designer_no IS '디자이너번호'
/

COMMENT ON COLUMN style_list.price IS '시술가격'
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
CREATE TABLE like
(
    like_no         NUMBER     NOT NULL, 
    customer_no     NUMBER     NULL, 
    like_type       char(1)    NULL, 
    like_type_no    NUMBER     NULL, 
    CONSTRAINT LIKE_PK PRIMARY KEY (like_no)
)
/

CREATE SEQUENCE like_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER like_AI_TRG
BEFORE INSERT ON like 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT like_SEQ.NEXTVAL
    INTO :NEW.like_no
    FROM DUAL;
END;
/

--DROP TRIGGER like_AI_TRG;
/

--DROP SEQUENCE like_SEQ;
/

COMMENT ON TABLE like IS '좋아요'
/

COMMENT ON COLUMN like.like_no IS '좋아요번호'
/

COMMENT ON COLUMN like.customer_no IS '회원번호'
/

COMMENT ON COLUMN like.like_type IS '구분타입(h, r,s)'
/

COMMENT ON COLUMN like.like_type_no IS '헤어샵번호 or 시술번호'
/

ALTER TABLE like
    ADD CONSTRAINT FK_like_customer_no_customer_c FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no)
/


