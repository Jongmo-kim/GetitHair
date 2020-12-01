--INSERT 예제 입니다. 이 파일은 수정하지말아주세요!!!!
--입력값은 여러분들이 수정해서 넣으셔도 됩니다. 대신 FK 제약조건 잘 지켜서 수정해주세요
--수정할때 이 파일자체에서 수정하지 마시고 새로운 sql 입력창에 복붙하셔서 거기서 수정한뒤 실행해주세요
--되도록 위에 있는것부터 INSERT 하셔야 FK 제약조건 에러가 발생하지 않습니다.
--데이터 INSERT 후 COMMIT 을 필수적으로 해주세요!!!!!!!!!!!!!!!!!!!!!
--고객 테이블 INSERT
--헤어 정보 테이블 INSERT
--CUSTOMER 번호가 존재해야만 오류 발생 없음.
--헤어 샵 INSERT
--사업자번호 유니크입니다.
--헤어샵 시술 가격 테이블 INSERT
--헤어 샵 번호가 존재해야만 오류 발생 없음.
--디자이너 테이블 INSERT
--디자이너 리스트 테이블 INSERT
--SHOP 번호와 DESIGNER 번호가 존재해야만 오류 발생 없음.
--스타일 테이블 INSERT
--스타일 리스트 테이블 INSERT
--STYLE 번호와 DESIGNER 번호가 존재해야만 오류 발생 없음.
--예약 테이블 INSERT
--CUSTOMER 번호, DESINGER 번호, SHOP 번호,STYLE_LIST 번호가 존재해야만 오류 발생 없음.
--리뷰 테이블 INSERT
--SHOP 번호,DESIGNER 번호,CUSTOMER 번호, STYLE 번호가 존재해야만 오류 발생 없음.
--좋아요 테이블 INSERT
--CUSTOMER 번호가 존재해야만 오류 발생 없음.
--LIKE_TYPE 은 1글자의 영문자 H : HAIRSHOP , S : STYLE, R : REVIEW 

DECLARE
NUM1 NUMBER :=1;
BEGIN
    WHILE(NUM1<31)
    LOOP
    INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.NEXTVAL,'user0'||CUSTOMER_SEQ.CURRVAL,'1234','1990-08-08','남성','홍길동','asd@naver.com','경기도 고양시 덕양구','010-1234-5678','상세주소','10001',sysdate);
    INSERT INTO HAIR_INFO VALUES(hair_info_seq.nextval,'지성','곱슬','많음','가는모발','볼륨부족','푸석한모발','새치조금');
    INSERT INTO HAIRSHOP VALUES(HAIRSHOP_SEQ.NEXTVAL,'hair0'||hairshop_seq.currval,'1234',hairshop_seq.currval||'-45-67890','홍길헤어','서울 영등포구 당산동','02-1234-1234','08:00','21:00','매주 화요일',5,0,'상세주소','10123',sysdate);        
    INSERT INTO DESIGNER VALUES(DESIGNER_SEQ.NEXTVAL,'designer0'||designer_SEQ.currval,'1234','김영희','010-1234-5678',3,'직급','안녕하십니까 저는 이시대 최고의 디자이너 디자이너 최라고 합니다. 저의 특기는 컷이고 투블럭, 그중에서도 군대가기전에 장병들이 해야하는...',sysdate);--여까지함
    INSERT INTO DESIGNER_LIST VALUES(DESIGNER_LIST_SEQ.NEXTVAL,DESIGNER_SEQ.currval,DESIGNER_SEQ.currval);
    INSERT INTO STYLE VALUES(STYLE_SEQ.NEXTVAL,'perm','스타일이름',0);
    INSERT INTO STYLE_LIST VALUES(style_list_seq.nextval,style_list_seq.currval,style_list_seq.currval);
    INSERT INTO SHOP_PRICE VALUES(SHOP_PRICE_SEQ.NEXTVAL,SHOP_PRICE_SEQ.currval,15000,style_list_seq.currval);
    INSERT INTO RESERVE VALUES(RESERVE_SEQ.NEXTVAL,1,1,1,1,'예약제목',default,'손님요청','디자이너요청','디자이너메모',sysdate,sysdate + (1/1440*15)*reserve_seq.currval*7, sysdate + (1/1440*15)*reserve_seq.currval*8);
    INSERT INTO REVIEW VALUES(review_seq.nextval,review_seq.currval,review_seq.currval,review_seq.currval,review_seq.currval,'리뷰인데 이 미용실 디자이너분 정말 마음에드네요',5,0,SYSDATE);
    INSERT INTO LIKES VALUES(likes_seq.nextval,likes_seq.currval,decode(MOD(floor(DBMS_RANDOM.VALUE(1,4)),3),0,'h',1,'r',2,'s'),likes_seq.currval);
    INSERT INTO DESIGNER_PORTFOLIO VALUES(DESIGNER_PORTFOLIO_SEQ.NEXTVAL,1,'레이어드컷','레이어드컷 시술 사진입니다.',SYSDATE);    -- 포트폴리오 insert문
    
    NUM1 := NUM1+1; 
    END LOOP;
END;
/
insert into admin values(admin_seq.nextval,'admin', '1234');
-- 필수!!!!!!
COMMIT;

