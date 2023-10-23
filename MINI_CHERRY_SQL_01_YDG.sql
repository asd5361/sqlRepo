/* 
 *  
 *  
 *  
 *  
 */
 
 --테이블 삭제 구문
DROP TABLE MEMBER CASCADE CONSTRAINTS;          --MEMBER
DROP TABLE AREAS CASCADE CONSTRAINTS;           --AREAS
DROP TABLE MANAGER CASCADE CONSTRAINTS;         --MENAGER
DROP TABLE NOTICE CASCADE CONSTRAINTS;          --NOTICE
DROP TABLE FAQ CASCADE CONSTRAINTS;             --FAQ
DROP TABLE QNA CASCADE CONSTRAINTS;             --QNA
DROP TABLE TRADE CASCADE CONSTRAINTS;           --TRADE
DROP TABLE REVIEW CASCADE CONSTRAINTS;          --REVIEW
DROP TABLE WISHLIST CASCADE CONSTRAINTS;        --WISHLIST
DROP TABLE PURCHASE_HISTORY CASCADE CONSTRAINTS;--PURCHASE_HISTORY
DROP TABLE TOWN CASCADE CONSTRAINTS;            --TOWN
DROP TABLE TOWN_COMMENT CASCADE CONSTRAINTS;    --TOWN_COMMENT

---------------------MEMBER---------------------
CREATE TABLE MEMBER (
	 MEMBER_NO	    NUMBER		        PRIMARY KEY
	,AREAS_CODE	    NUMBER		        NOT NULL
	,ID	            VARCHAR2(100)		NOT NULL    UNIQUE
	,PWD	        VARCHAR2(100)		NOT NULL
	,NICK	        VARCHAR2(100)		NOT NULL    UNIQUE  
	,NAME	        VARCHAR2(10)		NOT NULL   
	,EMAIL 	        VARCHAR2(100)		NOT NULL    UNIQUE
	,PHONE	        CHAR(11)		    NOT NULL    UNIQUE
	,ADDRESS	    VARCHAR2(100)		NOT NULL
	,JOIN_DATE	    TIMESTAMP	        DEFAULT SYSDATE
	,EDIT_DATE	    TIMESTAMP		    
	,QUIT_YN	    CHAR(1)	            DEFAULT 'N'	CHECK(QUIT_YN IN ('Y','N'))
);
---------------------코멘트--------------------
COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '사용자번호';
COMMENT ON COLUMN "MEMBER"."AREAS_CODE" IS '동네번호';
COMMENT ON COLUMN "MEMBER"."ID" IS '아이디';
COMMENT ON COLUMN "MEMBER"."PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."NICK" IS '닉네임';
COMMENT ON COLUMN "MEMBER"."NAME" IS '사용자명';
COMMENT ON COLUMN "MEMBER"."EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."PHONE" IS '전화번호';
COMMENT ON COLUMN "MEMBER"."ADDRESS" IS '주소';
COMMENT ON COLUMN "MEMBER"."JOIN_DATE" IS '가입일자';
COMMENT ON COLUMN "MEMBER"."EDIT_DATE" IS '마지막수정일자';
COMMENT ON COLUMN "MEMBER"."QUIT_YN" IS '탈퇴여부';

---------------------AREAS---------------------
CREATE TABLE AREAS (
	 AREAS_CODE	    NUMBER		 PRIMARY KEY
	,AREAS_NAME	    VARCHAR2(100) NOT NULL
);
---------------------코멘트--------------------
COMMENT ON COLUMN "AREAS"."AREAS_CODE" IS '동네번호';
COMMENT ON COLUMN "AREAS"."AREAS_NAME" IS '동네이름';

---------------------MANAGER---------------------
CREATE TABLE MANAGER (
	MANAGER_NO	    NUMBER		    PRIMARY KEY
	,MANAGER_ID	    VARCHAR2(100)	NOT NULL    UNIQUE
	,PWD	        VARCHAR2(100)	NOT NULL
	,NAME	        VARCHAR2(100)	NOT NULL
	,JOIN_DATE	    TIMESTAMP	    DEFAULT SYSDATE
	,QUIT_YN	    CHAR(1)	        DEFAULT 'N' CHECK(QUIT_YN IN ('Y','N')) 
);
---------------------코멘트--------------------
COMMENT ON COLUMN "MANAGER"."MANAGER_NO" IS '관리자번호';
COMMENT ON COLUMN "MANAGER"."MANAGER_ID" IS '관리자아이디';
COMMENT ON COLUMN "MANAGER"."PWD" IS '비밀번호';
COMMENT ON COLUMN "MANAGER"."NAME" IS '관리자명';
COMMENT ON COLUMN "MANAGER"."JOIN_DATE" IS '가입일자';
COMMENT ON COLUMN "MANAGER"."QUIT_YN" IS '탈퇴여부';

---------------------NOTICE---------------------
CREATE TABLE NOTICE (
	 NOTICE_NO	    NUMBER		        PRIMARY KEY
	,MANAGER_NO	    NUMBER		        NOT NULL
	,TITLE	        VARCHAR2(1000)		NOT NULL
	,CONTENT	    VARCHAR2(4000)		NOT NULL
	,ENROLL_DATE	TIMESTAMP	        DEFAULT SYSDATE
	,SECRET_YN	    CHAR(1)	            DEFAULT 'N'	 CHECK(SECRET_YN IN('Y','N')) 
	,EDIT_DATE	    TIMESTAMP
    ,HIT            NUMBER              DEFAULT 0
);
---------------------코멘트--------------------
COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '게시글번호';
COMMENT ON COLUMN "NOTICE"."MANAGER_NO" IS '작성자번호';
COMMENT ON COLUMN "NOTICE"."TITLE" IS '제목';
COMMENT ON COLUMN "NOTICE"."CONTENT" IS '내용';
COMMENT ON COLUMN "NOTICE"."ENROLL_DATE" IS '작성일';
COMMENT ON COLUMN "NOTICE"."SECRET_YN" IS '공개여부';
COMMENT ON COLUMN "NOTICE"."EDIT_DATE" IS '마지막수정일자';
COMMENT ON COLUMN "NOTICE"."HIT" IS '조회수';

---------------------FAQ---------------------
CREATE TABLE FAQ (
	 FAQ_NO	        NUMBER		    PRIMARY KEY
	,MANAGER_NO	    NUMBER		    NOT NULL
	,TITLE	        VARCHAR2(100)	NOT NULL
    ,CONTENT	    VARCHAR2(4000)	NOT NULL
	,ENROLL_DATE	TIMESTAMP	    DEFAULT SYSDATE
    ,SECRET_YN	    CHAR(1)	        DEFAULT 'N'  CHECK(SECRET_YN IN('Y', 'N'))
    ,EDIT_DATE	    TIMESTAMP
    ,HIT            NUMBER          DEFAULT 0
);
---------------------코멘트--------------------
COMMENT ON COLUMN "FAQ"."FAQ_NO" IS '질문번호';
COMMENT ON COLUMN "FAQ"."MANAGER_NO" IS '관리자번호';
COMMENT ON COLUMN "FAQ"."TITLE" IS '질문제목';
COMMENT ON COLUMN "FAQ"."CONTENT" IS '질문내용';
COMMENT ON COLUMN "FAQ"."ENROLL_DATE" IS '게시글작성일';
COMMENT ON COLUMN "FAQ"."SECRET_YN" IS '공개여부';
COMMENT ON COLUMN "FAQ"."EDIT_DATE" IS '마지막수정일자';
COMMENT ON COLUMN "FAQ"."HIT" IS '조회수';

---------------------QNA---------------------
CREATE TABLE QNA (
      QNA_NO                NUMBER              PRIMARY KEY         
    , MEMBER_NO             NUMBER             
    , MANAGER_NO            NUMBER              
    , TITLE                 VARCHAR2(1000)      NOT NULL
    , CONTENT               VARCHAR2(4000)      NOT NULL
    , HIT                   NUMBER              DEFAULT 0
    , MEMBER_ENROLL_DATE    TIMESTAMP           DEFAULT SYSDATE
    , SECRET_YN             CHAR(1)             DEFAULT 'N' CHECK(SECRET_YN IN('Y', 'N'))
    , ANSWER                VARCHAR2(4000)
    , MANAGER_ENROLL_DATE   TIMESTAMP           DEFAULT SYSDATE
    , MANAGER_EDIT_DATE     TIMESTAMP           DEFAULT SYSDATE
);
---------------------코멘트--------------------
COMMENT ON COLUMN "QNA"."QNA_NO" IS '게시글번호';
COMMENT ON COLUMN "QNA"."MEMBER_NO" IS '사용자번호';
COMMENT ON COLUMN "QNA"."MANAGER_NO" IS '관리자번호';
COMMENT ON COLUMN "QNA"."TITLE" IS '제목';
COMMENT ON COLUMN "QNA"."CONTENT" IS '내용';
COMMENT ON COLUMN "QNA"."HIT" IS '조회수';
COMMENT ON COLUMN "QNA"."MEMBER_ENROLL_DATE" IS '사용자의 게시글작성일';
COMMENT ON COLUMN "QNA"."SECRET_YN" IS '공개여부';
COMMENT ON COLUMN "QNA"."ANSWER" IS '관리자의 답변';
COMMENT ON COLUMN "QNA"."MANAGER_ENROLL_DATE" IS '관리자의 답변 작성일';
COMMENT ON COLUMN "QNA"."MANAGER_EDIT_DATE" IS '관리자 답변 수정 일자';

---------------------TRADE---------------------
CREATE TABLE TRADE (
    BOARD_NO	        NUMBER		        PRIMARY KEY
	,MEMBER_NO	        NUMBER		        NOT NULL
	,AREAS_CODE	        NUMBER		        NOT NULL
	,TITLE	            VARCHAR2(100)		NOT NULL
	,TRADE_AREAS	    VARCHAR2(100)		NOT NULL
	,CONTENT	        VARCHAR2(4000)		NOT NULL
	,COMPLETE_YN	    CHAR(1)	            DEFAULT 'N'	CHECK(COMPLETE_YN IN('Y', 'N'))
	,DEL_YN	            CHAR(1)         	DEFAULT 'N'	CHECK(DEL_YN IN('Y', 'N'))
	,PRODUCT	        VARCHAR2(100)		NOT NULL
	,PRICE	            NUMBER		        NOT NULL
	,ENROLL_DATE	    TIMESTAMP	        DEFAULT SYSDATE
	,EDIT_DATE	        TIMESTAMP
    ,HIT                NUMBER              DEFAULT 0
);
---------------------코멘트--------------------
COMMENT ON COLUMN "TRADE"."BOARD_NO" IS '게시글 번호';
COMMENT ON COLUMN "TRADE"."MEMBER_NO" IS '작성자 번호';
COMMENT ON COLUMN "TRADE"."AREAS_CODE" IS '동네 코드';
COMMENT ON COLUMN "TRADE"."TITLE" IS '제목';
COMMENT ON COLUMN "TRADE"."TRADE_AREAS" IS '거래 장소';
COMMENT ON COLUMN "TRADE"."CONTENT" IS '내용';
COMMENT ON COLUMN "TRADE"."COMPLETE_YN" IS '거래 상태';
COMMENT ON COLUMN "TRADE"."DEL_YN" IS '게시글 삭제 여부';
COMMENT ON COLUMN "TRADE"."PRODUCT" IS '상품명';
COMMENT ON COLUMN "TRADE"."PRICE" IS '가격';
COMMENT ON COLUMN "TRADE"."ENROLL_DATE" IS '작성일';
COMMENT ON COLUMN "TRADE"."EDIT_DATE" IS '마지막 수정일자';
COMMENT ON COLUMN "TRADE"."HIT" IS '조회수';

---------------------REVIEW---------------------
CREATE TABLE REVIEW (
	 REVIEW_NO	    NUMBER		        PRIMARY KEY
	,PURCHASE_NO	NUMBER		        NOT NULL
	,SCORE	        NUMBER		        NOT NULL
	,CONTENT	    VARCHAR2(100)		NOT NULL
	,ENROLL_DATE	TIMESTAMP	        DEFAULT SYSDATE
);
---------------------코멘트--------------------
COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '후기 번호';
COMMENT ON COLUMN "REVIEW"."PURCHASE_NO" IS '구매내역 번호';
COMMENT ON COLUMN "REVIEW"."SCORE" IS '매너온도 평가';
COMMENT ON COLUMN "REVIEW"."CONTENT" IS '내용';
COMMENT ON COLUMN "REVIEW"."ENROLL_DATE" IS '작성일';

---------------------WISHLIST---------------------
CREATE TABLE WISHLIST (
	 WISHLIST_NO	NUMBER		PRIMARY KEY
	,BOARD_NO	    NUMBER		NOT NULL
	,MEMBER_NO	    NUMBER		NOT NULL
    ,CONSTRAINT UNIQUE_WISHLIST UNIQUE(MEMBER_NO, BOARD_NO)
);
---------------------코멘트--------------------
COMMENT ON COLUMN "WISHLIST"."WISHLIST_NO" IS '관심목록번호';
COMMENT ON COLUMN "WISHLIST"."BOARD_NO" IS '게시글번호';
COMMENT ON COLUMN "WISHLIST"."MEMBER_NO" IS '유저번호';

---------------------PURCHASE_HISTORY---------------------
CREATE TABLE PURCHASE_HISTORY (
	 PURCHASE_NO	NUMBER		PRIMARY KEY
	,BUYER_NO	    NUMBER		NOT NULL
	,BOARD_NO	    NUMBER		NOT NULL
	,ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE
);
---------------------코멘트--------------------
COMMENT ON COLUMN "PURCHASE_HISTORY"."PURCHASE_NO" IS '구매내역번호';
COMMENT ON COLUMN "PURCHASE_HISTORY"."BUYER_NO" IS '구매자';
COMMENT ON COLUMN "PURCHASE_HISTORY"."BOARD_NO" IS '구매한 게시글 번호';
COMMENT ON COLUMN "PURCHASE_HISTORY"."ENROLL_DATE" IS '구매일시';

---------------------TOWN---------------------
CREATE TABLE TOWN(
	  TOWN_NO		NUMBER		    PRIMARY KEY
	, MEMBER_NO	    NUMBER		    NOT NULL
	, TITLE		    VARCHAR2(100)	NOT NULL
	, CONTENT	    VARCHAR2(1000) 	NOT NULL
	, ENROLL_DATE	TIMESTAMP	    DEFAULT SYSDATE
	, DELETE_YN	    CHAR(1)		    DEFAULT 'N'	CHECK(DELETE_YN IN('Y', 'N'))
	, EDIT_DATE	    TIMESTAMP       
	, CATEGORY	    VARCHAR2(100)	NOT NULL
    , HIT           NUMBER          DEFAULT 0
);
---------------------코멘트--------------------
COMMENT ON COLUMN "TOWN"."TOWN_NO" IS '게시판번호';
COMMENT ON COLUMN "TOWN"."MEMBER_NO" IS '사용자번호';
COMMENT ON COLUMN "TOWN"."TITLE" IS '제목';
COMMENT ON COLUMN "TOWN"."CONTENT" IS '내용';
COMMENT ON COLUMN "TOWN"."ENROLL_DATE" IS '작성일';
COMMENT ON COLUMN "TOWN"."DELETE_YN" IS '삭제여부';
COMMENT ON COLUMN "TOWN"."EDIT_DATE" IS '마지막수정일자';
COMMENT ON COLUMN "TOWN"."CATEGORY" IS '카테고리';
COMMENT ON COLUMN "TOWN"."HIT" IS '조회수';

---------------------TOWN_COMMENT---------------------
CREATE TABLE TOWN_COMMENT(
	  COMMENT_NO	NUMBER		    PRIMARY KEY
	, TOWN_NO	    NUMBER		    NOT NULL
	, MEMBER_NO	    NUMBER		    NOT NULL
	, ENROLL_DATE 	TIMESTAMP	    DEFAULT SYSDATE
	, CONTENT	    VARCHAR2(100)	NOT NULL
);

---------------------코멘트--------------------
COMMENT ON COLUMN "TOWN_COMMENT"."COMMENT_NO" IS '댓글번호';
COMMENT ON COLUMN "TOWN_COMMENT"."TOWN_NO" IS '게시글번호';
COMMENT ON COLUMN "TOWN_COMMENT"."MEMBER_NO" IS '작성자번호';
COMMENT ON COLUMN "TOWN_COMMENT"."ENROLL_DATE" IS '작성일';
COMMENT ON COLUMN "TOWN_COMMENT"."CONTENT" IS '댓글내용';



---------------------시퀀스--------------------
--MEMBER
DROP SEQUENCE SEQ_MEMBER;
CREATE SEQUENCE SEQ_MEMBER NOCYCLE NOCACHE;
--SEQ_MEMBER.NEXTVAL;

--AREAS
DROP SEQUENCE SEQ_AREAS;
CREATE SEQUENCE SEQ_AREAS NOCYCLE NOCACHE;
--SEQ_AREAS.NEXTVAL;

--MANAGER
DROP SEQUENCE SEQ_MANAGER;
CREATE SEQUENCE SEQ_MANAGER NOCYCLE NOCACHE;
--SEQ_MANAGER.NEXTVAL;

--NOTICE
DROP SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_NOTICE_NO NOCYCLE NOCACHE;


--FAQ
DROP SEQUENCE SEQ_FAQ_NO;
CREATE SEQUENCE SEQ_FAQ_NO NOCYCLE NOCACHE;

--QNA
DROP SEQUENCE SEQ_QNA_NO;
CREATE SEQUENCE SEQ_QNA_NO NOCYCLE NOCACHE;

--BOARD
DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE NOCYCLE;

--REVIEW
DROP SEQUENCE SEQ_REVIEW_NO;
CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE NOCYCLE;

--WISHLIST
DROP SEQUENCE SEQ_WISHLIST_NO;
CREATE SEQUENCE SEQ_WISHLIST_NO NOCACHE NOCYCLE;

--PURCHASE
DROP SEQUENCE SEQ_PURCHASE_NO;
CREATE SEQUENCE SEQ_PURCHASE_NO NOCACHE NOCYCLE;

--TOWN
DROP SEQUENCE SEQ_TOWN_NO;
DROP SEQUENCE SEQ_TOWN_COMMENT_NO;
--TOWN
CREATE SEQUENCE SEQ_TOWN_NO NOCYCLE NOCACHE ;
CREATE SEQUENCE SEQ_TOWN_COMMENT_NO NOCYCLE NOCACHE ;

-------------------외래키----------------------
--FK_MEMBER
ALTER TABLE MEMBER 
ADD CONSTRAINT FK_MEMBER
FOREIGN KEY (AREAS_CODE) REFERENCES AREAS(AREAS_CODE);

--FK_NOTICE
ALTER TABLE NOTICE 
ADD CONSTRAINT FK_NOTICE 
FOREIGN KEY(MANAGER_NO)REFERENCES MANAGER(MANAGER_NO);

--FK_QNA
ALTER TABLE QNA
ADD CONSTRAINT FK_QNA1 
FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER (MEMBER_NO);

--FK_QNA
ALTER TABLE QNA
ADD CONSTRAINT FK_QNA2
FOREIGN KEY(MANAGER_NO) REFERENCES MANAGER (MANAGER_NO);

-- FK_TRADE
ALTER TABLE TRADE 
ADD CONSTRAINT FK_TRADE1
FOREIGN KEY (MEMBER_NO)
REFERENCES MEMBER (MEMBER_NO);

--FK_TRADE
ALTER TABLE TRADE
ADD CONSTRAINT FK_TRADE2
FOREIGN KEY (AREAS_CODE)
REFERENCES AREAS (AREAS_CODE);

--FK_REVIEW
ALTER TABLE REVIEW 
ADD CONSTRAINT FK_REVIEW 
FOREIGN KEY (PURCHASE_NO)
REFERENCES PURCHASE_HISTORY (PURCHASE_NO);

--FK_WISHLIST
ALTER TABLE WISHLIST 
ADD CONSTRAINT FK_WISHLIST1 
FOREIGN KEY (BOARD_NO)
REFERENCES TRADE (BOARD_NO);

--FK_WISHLIST
ALTER TABLE WISHLIST 
ADD CONSTRAINT FK_WISHLIST2 
FOREIGN KEY (MEMBER_NO)
REFERENCES MEMBER (MEMBER_NO);

--FK_HISTORY
ALTER TABLE PURCHASE_HISTORY 
ADD CONSTRAINT FK_HISTORY1 
FOREIGN KEY (BUYER_NO)
REFERENCES MEMBER (MEMBER_NO);

-- FK_HISTORY 
ALTER TABLE PURCHASE_HISTORY 
ADD CONSTRAINT FK_HISTORY2 
FOREIGN KEY (BOARD_NO)
REFERENCES TRADE (BOARD_NO);

--FK_TOWN
ALTER TABLE TOWN 
ADD CONSTRAINT FK_TOWN
FOREIGN KEY (MEMBER_NO)
REFERENCES MEMBER (MEMBER_NO); 

--FK_COMMENT
ALTER TABLE TOWN_COMMENT 
ADD CONSTRAINT FK_COMMENT1 
FOREIGN KEY (TOWN_NO)
REFERENCES TOWN (TOWN_NO);

--FK_COMMENT
ALTER TABLE TOWN_COMMENT 
ADD CONSTRAINT FK_COMMENT2
FOREIGN KEY (MEMBER_NO)
REFERENCES MEMBER (MEMBER_NO);


