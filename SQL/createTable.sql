-- 테이블 삭제
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE HAIRSHOP CASCADE CONSTRAINTS;
DROP TABLE DESIGNER CASCADE CONSTRAINTS;
DROP TABLE HAIR_INFO CASCADE CONSTRAINTS;
DROP TABLE DESIGNER_LIST CASCADE CONSTRAINTS;
DROP TABLE LIKES CASCADE CONSTRAINTS;
DROP TABLE STYLE CASCADE CONSTRAINTS;
DROP TABLE STYLE_LIST CASCADE CONSTRAINTS;
DROP TABLE SHOP_PRICE CASCADE CONSTRAINTS;
DROP TABLE RESERVE CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE REVIEW_COMMENT CASCADE CONSTRAINTS;
DROP TABLE DESIGNER_PORTFOLIO CASCADE CONSTRAINTS;
-- 시퀀스 삭제
DROP SEQUENCE hairshop_SEQ;
DROP SEQUENCE designer_SEQ;
DROP SEQUENCE customer_SEQ;
DROP SEQUENCE style_SEQ;
DROP SEQUENCE review_SEQ;
DROP SEQUENCE reserve_SEQ;
DROP SEQUENCE designer_list_SEQ;
DROP SEQUENCE style_list_SEQ;
DROP SEQUENCE shop_price_SEQ;
DROP SEQUENCE likes_SEQ;
DROP SEQUENCE admin_SEQ;
DROP SEQUENCE REVIEW_COMMENT_SEQ;
drop sequence hair_info_seq;
DROP SEQUENCE DESIGNER_PORTFOLIO_SEQ;

-------------------------------------
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- hairshop Table Create SQL
create sequence hair_info_seq;
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

COMMENT ON COLUMN designer.designer_intro IS '소개말'
/

COMMENT ON COLUMN designer.designer_keyword IS '스타일키워드(예정'
/

COMMENT ON COLUMN designer.designer_img IS '디자이너프로필이미지'
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


-- hairshop Table Create SQL
CREATE TABLE style
(
    style_no       NUMBER           NOT NULL, 
    style_type     VARCHAR2(20)     NOT NULL, 
    style_name     VARCHAR2(30)     NOT NULL, 
    style_img      VARCHAR2(300)    NOT NULL, 
    style_likes    NUMBER           DEFAULT 0 NOT NULL, 
    CONSTRAINT STYLE_PK PRIMARY KEY (style_no),
    check(style_type in ('cut','perm','color','etc'))
)
/

CREATE SEQUENCE style_SEQ
START WITH 1
INCREMENT BY 1;
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
CREATE TABLE hair_info
(
    customer_no      NUMBER          NOT NULL,
    myhair_scalp     VARCHAR2(20)    NULL, --두피상태 myhair_scalp //in(지성,건성,비듬,민감성,중성,모름)
    myhair_curly     VARCHAR2(20)    NULL, --곱슬정도 myhair_curly //in(곱슬,반곱슬,직모,모름)
    myhair_rich      VARCHAR2(20)    NULL, --머리숱 myhair_rich    //in(많음,보통,적음,탈모,모름)
    myhair_bold      VARCHAR2(20)    NULL, --모발굵기 myhair_bold  //in(가는모발,중간모발,두꺼운모발,모름)
    myhair_vol       VARCHAR2(20)    NULL, --볼륨 myhair_vol    //in(볼륨부족,뜨는머리,고민없음,모름)
    myhair_status    VARCHAR2(20)    NULL, --모발상태 myhair_status //in(끊기는모발,푸석한모발,건강한모발,모름)
    myhair_old       VARCHAR2(20)    NULL, --모발노화상태 myhair_old   //in(새치조금,새치많음,새치없음,모름)
    CONSTRAINT HAIR_INFO_PK PRIMARY KEY (customer_no),   
    check(myhair_scalp in ('지성','건성','비듬','민감성','중성','모름')),
    check(myhair_curly in ('곱슬','반곱슬','직모','모름')),
    check(myhair_rich in ('많음','보통','적음','탈모','모름')),
    check(myhair_bold in ('가는모발','중간모발','두꺼운모발','모름')),
    check(myhair_vol in ('볼륨부족','뜨는머리','고민없음','모름')),
    check(myhair_status in ('끊기는모발','푸석한모발','건강한모발','모름')),
    check(myhair_old in ('새치조금','새치많음','새치없음','모름'))
);

/

COMMENT ON TABLE hair_info IS '추가정보'
/

COMMENT ON COLUMN hair_info.customer_no IS '회원번호'
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

ALTER TABLE hair_info
    ADD CONSTRAINT FK_hair_info_customer_no_custo FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no)
        ON DELETE CASCADE
/


-- hairshop Table Create SQL
CREATE TABLE review
(
    review_no         NUMBER           NOT NULL, 
    shop_no           NUMBER           NOT NULL, 
    designer_no       NUMBER           NULL, 
    customer_no       NUMBER           NULL, 
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
        REFERENCES designer (designer_no) ON DELETE SET NULL
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_customer_no_customer FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no) ON DELETE SET NULL
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_style_no_style_style FOREIGN KEY (style_no)
        REFERENCES style (style_no)
/
-- 시술 가격 테이블
CREATE TABLE shop_price
(
    shop_price_no    NUMBER    NOT NULL, 
    shop_no        NUMBER    NOT NULL, 
    price           NUMBER     NULL, 
    CONSTRAINT SHOP_PRICE_PK PRIMARY KEY (shop_price_no)
)
/
CREATE SEQUENCE shop_price_SEQ
START WITH 1
INCREMENT BY 1;
/
--외래키 추가
ALTER TABLE shop_price
    ADD CONSTRAINT shop_price_shop_noFK FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/
-- hairshop Table Create SQL
CREATE TABLE style_list
(
    stylelist_no    NUMBER    NOT NULL, 
    style_no        NUMBER    NOT NULL, 
    designer_no     NUMBER    NULL, 
    shop_price_no           NUMBER    NOT NULL, 
    CONSTRAINT STYLE_LIST_PK PRIMARY KEY (stylelist_no)
)
/
CREATE SEQUENCE style_list_SEQ
START WITH 1
INCREMENT BY 1;
/
ALTER TABLE style_list
    ADD CONSTRAINT FK_style_list_shop_price_no FOREIGN KEY (shop_price_no)
        REFERENCES shop_price(shop_price_no)
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

ALTER TABLE style_list
    ADD CONSTRAINT FK_style_list_designer_no_desi FOREIGN KEY (designer_no)
        REFERENCES designer (designer_no)  ON DELETE CASCADE
/

ALTER TABLE style_list
    ADD CONSTRAINT FK_style_list_style_no_style_s FOREIGN KEY (style_no)
        REFERENCES style (style_no)
/
-- hairshop Table Create SQL
CREATE TABLE reserve
(
    reserve_no               NUMBER           NOT NULL, 
    customer_no              NUMBER           NULL, 
    designer_no              NUMBER           NULL, 
    shop_no                  NUMBER           NOT NULL, 
    stylelist_no             NUMBER           NULL,
    reserve_date             DATE             NOT NULL, 
    reserve_status           char(6)          NOT NULL, 
    reserve_cust_req         VARCHAR2(300)    NULL, 
    reserve_designer_req     VARCHAR2(300)    NULL, 
    reserve_designer_memo    VARCHAR2(300)    NULL, 
    CONSTRAINT RESERVE_PK PRIMARY KEY (reserve_no),
    --태민 check 제약조건 추가
    check(reserve_status in ('예약','완료','취소'))
)
/

CREATE SEQUENCE reserve_SEQ
START WITH 1
INCREMENT BY 1;
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
        REFERENCES customer (customer_no) ON DELETE CASCADE
/

ALTER TABLE reserve
    ADD CONSTRAINT FK_reserve_designer_no_designe FOREIGN KEY (designer_no)
        REFERENCES designer (designer_no) ON DELETE SET NULL
/

ALTER TABLE reserve
    ADD CONSTRAINT FK_reserve_shop_no_hairshop_sh FOREIGN KEY (shop_no)
        REFERENCES hairshop (shop_no)
/
ALTER TABLE reserve
    ADD CONSTRAINT FK_reserve_stylelist_no_styl  FOREIGN KEY (stylelist_no)
        REFERENCES style_list (stylelist_no) ON DELETE SET NULL
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
        REFERENCES designer (designer_no) ON DELETE CASCADE

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



--DROP TRIGGER likes_AI_TRG;
/

--DROP SEQUENCE likes_SEQ;
/

COMMENT ON TABLE likes IS '좋아요'
/

COMMENT ON COLUMN likes.like_no IS '좋아요번호'
/

COMMENT ON COLUMN likes.customer_no IS '회원번호'
/

COMMENT ON COLUMN likes.like_type IS '구분타입(h rs'
/

COMMENT ON COLUMN likes.like_type_no IS '헤어샵번호 or 시술번호'
/

ALTER TABLE likes
    ADD CONSTRAINT FK_likes_customer_no_customer_ FOREIGN KEY (customer_no)
        REFERENCES customer (customer_no) ON DELETE CASCADE
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


/

--DROP TRIGGER admin_AI_TRG;
/

--DROP SEQUENCE admin_SEQ;
/
-- review_comment table (은영)
CREATE TABLE REVIEW_COMMENT(
    REVIEW_COMMENT_NO    NUMBER PRIMARY KEY,    -- 답글 식별번호
    REVIEW_COMMENT_WRITER VARCHAR2(20),         -- 답글 작성자
    REVIEW_COMMENT_CONTENT VARCHAR2(1000),      -- 답글 내용
    REVIEW_REF NUMBER,                          -- 어떤 리뷰의 답글인지 기록하는 값
    REVIEW_COMMENT_DATE VARCHAR2(10),
    CONSTRAINT FK_REVIEW_COMMENT_WRITER FOREIGN KEY (REVIEW_COMMENT_WRITER) REFERENCES DESIGNER(DESIGNER_ID) ON DELETE SET NULL,
    CONSTRAINT FK_REVIEW_REF FOREIGN KEY (REVIEW_REF) REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE
);

CREATE SEQUENCE REVIEW_COMMENT_SEQ;
--김종모가함
create or replace trigger likes_tri
    AFTER INSERT ON likes
    for each row
    begin
        update HAIRSHOP set  shop_likes = shop_likes +1 where shop_no = :NEW.like_type_no;
        update review set  review_likes = review_likes +1  where review_no = :NEW.like_type_no;
        update style set style_likes = style_likes + 1 where style_no = :NEW.like_type_no;
    end;
    /

-- designer_portfolio table (은영)
CREATE TABLE DESIGNER_PORTFOLIO(
    DESIGNER_PORTFOLIO_NO NUMBER PRIMARY KEY,   -- 글번호
    DESIGNER_NO NUMBER,                         -- 작성자
    DESIGNER_PORTFOLIO_STYLE_NAME VARCHAR2(30), -- 시술명
    DESIGNER_PORTFOLIO_CONTENT VARCHAR2(600),   -- 코멘트
    FILEPATH VARCHAR2(300),                     -- 시술사진
    DESIGNER_PORTFOLIO_DATE VARCHAR2(10),       -- 글작성날짜
    FOREIGN KEY (DESIGNER_NO) REFERENCES DESIGNER (DESIGNER_NO) ON DELETE SET NULL
);
CREATE SEQUENCE DESIGNER_PORTFOLIO_SEQ;


commit;