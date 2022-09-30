--/  테이블생성  /-------------------------

ALTER TABLE Category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Category;

/* 카테고리 */
DROP TABLE Category 
	CASCADE CONSTRAINTS;

/* 카테고리 */
CREATE TABLE Category (
	cg_num Number(8) NOT NULL, /* 카테고리번호 */
	cg_code Varchar2(20) NOT NULL, /* 카테고리코드 */
	cg_name VARCHAR2(50) NOT NULL /* 카테고리명 */
);

COMMENT ON TABLE Category IS '카테고리';

COMMENT ON COLUMN Category.cg_num IS '카테고리번호';

COMMENT ON COLUMN Category.cg_code IS '카테고리코드';

COMMENT ON COLUMN Category.cg_name IS '카테고리명';

CREATE UNIQUE INDEX PK_Category
	ON Category (
		cg_num ASC
	);

ALTER TABLE Category
	ADD
		CONSTRAINT PK_Category
		PRIMARY KEY (
			cg_num
		);
    
-------------------------------------------------
    
ALTER TABLE Product
	DROP
		CONSTRAINT FK_Category_TO_Product
		CASCADE;

ALTER TABLE Product
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Product;

/* 상품 */
DROP TABLE Product 
	CASCADE CONSTRAINTS;

/* 상품 */
CREATE TABLE Product (
	pnum Number(8) NOT NULL, /* 상품번호 */
	pname VARCHAR2(100) NOT NULL, /* 상품명 */
	pcompany VARCHAR2(50) NOT NULL, /* 제조사 */
	origin VARCHAR2(20), /* 원산지 */
	pimage1 VARCHAR2(200), /* 상품이미지1 */
	pimage2 VARCHAR2(200), /* 상품이미지2 */
	pimage3 VARCHAR2(200), /* 상품이미지3 */
	pqty NUMBER(8), /* 수량 */
	price NUMBER(8) NOT NULL, /* 상품정가 */
	saleprice NUMBER(8) NOT NULL, /* 상품판매가 */
	pcontents VARCHAR2(1000), /* 상품설명 */
	pspec VARCHAR2(20), /* 상품스펙 */
	point NUMBER(8), /* 포인트 */
	pindate DATE, /* 상품입고일 */
	sbdate NUMBER(8), /* 유통기한 */
	cg_num Number(8) /* 카테고리번호 */
);

COMMENT ON TABLE Product IS '상품';

COMMENT ON COLUMN Product.pnum IS '상품번호';

COMMENT ON COLUMN Product.pname IS '상품명';

COMMENT ON COLUMN Product.pcompany IS '제조사';

COMMENT ON COLUMN Product.origin IS '원산지';

COMMENT ON COLUMN Product.pimage1 IS '상품이미지1';

COMMENT ON COLUMN Product.pimage2 IS '상품이미지2';

COMMENT ON COLUMN Product.pimage3 IS '상품이미지3';

COMMENT ON COLUMN Product.pqty IS '수량';

COMMENT ON COLUMN Product.price IS '상품정가';

COMMENT ON COLUMN Product.saleprice IS '상품판매가';

COMMENT ON COLUMN Product.pcontents IS '상품설명';

COMMENT ON COLUMN Product.pspec IS '상품스펙';

COMMENT ON COLUMN Product.point IS '포인트';

COMMENT ON COLUMN Product.pindate IS '상품입고일';

COMMENT ON COLUMN Product.sbdate IS '유통기한';

COMMENT ON COLUMN Product.cg_num IS '카테고리번호';

CREATE UNIQUE INDEX PK_Product
	ON Product (
		pnum ASC
	);

ALTER TABLE Product
	ADD
		CONSTRAINT PK_Product
		PRIMARY KEY (
			pnum
		);

ALTER TABLE Product
	ADD
		CONSTRAINT FK_Category_TO_Product
		FOREIGN KEY (
			cg_num
		)
		REFERENCES Category (
			cg_num
		);
-----------------------------------------------------------
ALTER TABLE Member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Member;

/* 회원 */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE Member (
	idx Number(8) NOT NULL, /* 회원번호 */
	name VARCHAR2(30), /* 이름 */
	userid VARCHAR2(30), /* 아이디 */
	pwd VARCHAR2(30), /* 비밀번호 */
	hp1 CHAR(3), /* 연락처1 */
	hp2 CHAR(4), /* 연락처2 */
	hp3 CHAR(4), /* 연락처3 */
	zipcode CHAR(5), /* 우편번호 */
	addr1 VARCHAR2(200), /* 주소1 */
	addr2 VARCHAR2(200), /* 주소2 */
	mileage NUMBER(8) /* 마일리지 */
);

COMMENT ON TABLE Member IS '회원';

COMMENT ON COLUMN Member.idx IS '회원번호';

COMMENT ON COLUMN Member.name IS '이름';

COMMENT ON COLUMN Member.userid IS '아이디';

COMMENT ON COLUMN Member.pwd IS '비밀번호';

COMMENT ON COLUMN Member.hp1 IS '연락처1';

COMMENT ON COLUMN Member.hp2 IS '연락처2';

COMMENT ON COLUMN Member.hp3 IS '연락처3';

COMMENT ON COLUMN Member.zipcode IS '우편번호';

COMMENT ON COLUMN Member.addr1 IS '주소1';

COMMENT ON COLUMN Member.addr2 IS '주소2';

COMMENT ON COLUMN Member.mileage IS '마일리지';

CREATE UNIQUE INDEX PK_Member
	ON Member (
		idx ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			idx
		);
------------------------------------------------------------
    
  ALTER TABLE Cart
	DROP
		CONSTRAINT FK_Member_TO_Cart
		CASCADE;

ALTER TABLE Cart
	DROP
		CONSTRAINT FK_Product_TO_Cart
		CASCADE;

ALTER TABLE Cart
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Cart;

/* 장바구니 */
DROP TABLE Cart 
	CASCADE CONSTRAINTS;

/* 장바구니 */
CREATE TABLE Cart (
	cartNum Number(8) NOT NULL, /* 장바구니번호 */
	oqty Number(8) NOT NULL, /* 수량 */
	indate DATE, /* 등록일 */
	idx_fk Number(8) NOT NULL, /* 회원번호 */
	pnum_fk Number(8) NOT NULL /* 상품번호 */
);

COMMENT ON TABLE Cart IS '장바구니';

COMMENT ON COLUMN Cart.cartNum IS '장바구니번호';

COMMENT ON COLUMN Cart.oqty IS '수량';

COMMENT ON COLUMN Cart.indate IS '등록일';

COMMENT ON COLUMN Cart.idx_fk IS '회원번호';

COMMENT ON COLUMN Cart.pnum_fk IS '상품번호';

CREATE UNIQUE INDEX PK_Cart
	ON Cart (
		cartNum ASC
	);

ALTER TABLE Cart
	ADD
		CONSTRAINT PK_Cart
		PRIMARY KEY (
			cartNum
		);

ALTER TABLE Cart
	ADD
		CONSTRAINT FK_Member_TO_Cart
		FOREIGN KEY (
			idx_fk
		)
		REFERENCES Member (
			idx
		);

ALTER TABLE Cart
	ADD
		CONSTRAINT FK_Product_TO_Cart
		FOREIGN KEY (
			pnum_fk
		)
		REFERENCES Product (
			pnum
		);
-----------------------------------------
ALTER TABLE Center
	DROP
		CONSTRAINT FK_Member_TO_Center
		CASCADE;

ALTER TABLE Center
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Center;

/* 고객센터 */
DROP TABLE Center 
	CASCADE CONSTRAINTS;

/* 고객센터 */
CREATE TABLE Center (
	cnum NUMBER(8) NOT NULL, /* 글번호 */
	ctitle VARCHAR2(100), /* 제목 */
	ccontent VARCHAR2(500), /* 글내용 */
	cwdate DATE, /* 작성일 */
	cfilename VARCHAR2(200), /* 첨부파일 */
	cidx_fk Number(8) /* 회원번호 */
);

COMMENT ON TABLE Center IS '고객센터';

COMMENT ON COLUMN Center.cnum IS '글번호';

COMMENT ON COLUMN Center.ctitle IS '제목';

COMMENT ON COLUMN Center.ccontent IS '글내용';

COMMENT ON COLUMN Center.cwdate IS '작성일';

COMMENT ON COLUMN Center.cfilename IS '첨부파일';

COMMENT ON COLUMN Center.cidx_fk IS '회원번호';

CREATE UNIQUE INDEX PK_Center
	ON Center (
		cnum ASC
	);

ALTER TABLE Center
	ADD
		CONSTRAINT PK_Center
		PRIMARY KEY (
			cnum
		);

ALTER TABLE Center
	ADD
		CONSTRAINT FK_Member_TO_Center
		FOREIGN KEY (
			cidx_fk
		)
		REFERENCES Member (
			idx
		);
------------------------------------------
ALTER TABLE Review
	DROP
		CONSTRAINT FK_Product_TO_Review
		CASCADE;

ALTER TABLE Review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Review;

/* 리뷰 게시판 */
DROP TABLE Review 
	CASCADE CONSTRAINTS;

/* 리뷰 게시판 */
CREATE TABLE Review (
	rnum NUMBER(8) NOT NULL, /* 글번호 */
	rtitle VARCHAR2(100), /* 제목 */
	rcontent VARCHAR2(500), /* 글내용 */
	rscore NUMBER(2), /* 평가점수 */
	rwdate DATE, /* 작성일 */
	rfilename VARCHAR2(200), /* 첨부파일 */
	ridx_fk Number(8), /* 회원번호 */
	rpnum_fk Number(8) /* 상품번호 */
);

COMMENT ON TABLE Review IS '리뷰 게시판';

COMMENT ON COLUMN Review.rnum IS '글번호';

COMMENT ON COLUMN Review.rtitle IS '제목';

COMMENT ON COLUMN Review.rcontent IS '글내용';

COMMENT ON COLUMN Review.rscore IS '평가점수';

COMMENT ON COLUMN Review.rwdate IS '작성일';

COMMENT ON COLUMN Review.rfilename IS '첨부파일';

COMMENT ON COLUMN Review.ridx_fk IS '회원번호';

COMMENT ON COLUMN Review.rpnum_fk IS '상품번호';

CREATE UNIQUE INDEX PK_Review
	ON Review (
		rnum ASC
	);

ALTER TABLE Review
	ADD
		CONSTRAINT PK_Review
		PRIMARY KEY (
			rnum
		);

ALTER TABLE Review
	ADD
		CONSTRAINT FK_Member_TO_Review
		FOREIGN KEY (
			ridx_fk
		)
		REFERENCES Member (
			idx
		);

ALTER TABLE Review
	ADD
		CONSTRAINT FK_Product_TO_Review
		FOREIGN KEY (
			rpnum_fk
		)
		REFERENCES Product (
			pnum
		);
-----------------------------------------
    
    ALTER TABLE OrderDesc
	DROP
		CONSTRAINT FK_Member_TO_OrderDesc
		CASCADE;

ALTER TABLE OrderDesc
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_OrderDesc;

/* 주문개요 */
DROP TABLE OrderDesc 
	CASCADE CONSTRAINTS;

/* 주문개요 */
CREATE TABLE OrderDesc (
	onum VARCHAR2(30) NOT NULL, /* 주문번호 */
	ototalPrice NUMBER(10), /* 총결제금액 */
	ototalPoint NUMBER(10), /* 총적립포인트 */
	odeliverCost NUMBER(8), /* 배송비 */
	odeliverState VARCHAR2(20), /* 배송상태 */
	opayState VARCHAR2(20), /* 지불상태 */
	opayWay VARCHAR2(20), /* 지불방법 */
	omaileage NUMBER(8), /* 사용마일리지 */
	orderDate DATE, /* 주문일 */
	omemo VARCHAR2(200), /* 배송시요청사항 */
	idx_fk Number(8) /* 회원번호 */
);

COMMENT ON TABLE OrderDesc IS '주문개요';

COMMENT ON COLUMN OrderDesc.onum IS '주문번호';

COMMENT ON COLUMN OrderDesc.ototalPrice IS '총결제금액';

COMMENT ON COLUMN OrderDesc.ototalPoint IS '총적립포인트';

COMMENT ON COLUMN OrderDesc.odeliverCost IS '배송비';

COMMENT ON COLUMN OrderDesc.odeliverState IS '배송상태';

COMMENT ON COLUMN OrderDesc.opayState IS '지불상태';

COMMENT ON COLUMN OrderDesc.opayWay IS '지불방법';

COMMENT ON COLUMN OrderDesc.omaileage IS '사용마일리지';

COMMENT ON COLUMN OrderDesc.orderDate IS '주문일';

COMMENT ON COLUMN OrderDesc.omemo IS '배송시요청사항';

COMMENT ON COLUMN OrderDesc.idx_fk IS '회원번호';

CREATE UNIQUE INDEX PK_OrderDesc
	ON OrderDesc (
		onum ASC
	);

ALTER TABLE OrderDesc
	ADD
		CONSTRAINT PK_OrderDesc
		PRIMARY KEY (
			onum
		);

ALTER TABLE OrderDesc
	ADD
		CONSTRAINT FK_Member_TO_OrderDesc
		FOREIGN KEY (
			idx_fk
		)
		REFERENCES Member (
			idx
		);
----------------------------------------------
ALTER TABLE Order_Product
	DROP
		CONSTRAINT FK_OrderDesc_TO_Order_Product
		CASCADE;

ALTER TABLE Order_Product
	DROP
		CONSTRAINT FK_Product_TO_Order_Product
		CASCADE;

ALTER TABLE Order_Product
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Order_Product;

/* 주문상품 */
DROP TABLE Order_Product 
	CASCADE CONSTRAINTS;

/* 주문상품 */
CREATE TABLE Order_Product (
	onum VARCHAR2(30) NOT NULL, /* 주문번호 */
	pnum Number(8) NOT NULL, /* 상품번호 */
	pimage VARCHAR2(200), /* 상품이미지 */
	oqty NUMBER(8), /* 주문수량 */
	opoint NUMBER(8), /* 지급포인트 */
	saleprice NUMBER(8) /* 판매단가 */
);

COMMENT ON TABLE Order_Product IS '주문상품';

COMMENT ON COLUMN Order_Product.onum IS '주문번호';

COMMENT ON COLUMN Order_Product.pnum IS '상품번호';

COMMENT ON COLUMN Order_Product.pimage IS '상품이미지';

COMMENT ON COLUMN Order_Product.oqty IS '주문수량';

COMMENT ON COLUMN Order_Product.opoint IS '지급포인트';

COMMENT ON COLUMN Order_Product.saleprice IS '판매단가';

CREATE UNIQUE INDEX PK_Order_Product
	ON Order_Product (
		onum ASC,
		pnum ASC
	);

ALTER TABLE Order_Product
	ADD
		CONSTRAINT PK_Order_Product
		PRIMARY KEY (
			onum,
			pnum
		);

ALTER TABLE Order_Product
	ADD
		CONSTRAINT FK_OrderDesc_TO_Order_Product
		FOREIGN KEY (
			onum
		)
		REFERENCES OrderDesc (
			onum
		);

ALTER TABLE Order_Product
	ADD
		CONSTRAINT FK_Product_TO_Order_Product
		FOREIGN KEY (
			pnum
		)
		REFERENCES Product (
			pnum
		);
-----------------------------------------
ALTER TABLE Receiver
	DROP
		CONSTRAINT FK_OrderDesc_TO_Receiver
		CASCADE;

ALTER TABLE Receiver
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Receiver;

/* 수령자 */
DROP TABLE Receiver 
	CASCADE CONSTRAINTS;

/* 수령자 */
CREATE TABLE Receiver (
	onum VARCHAR2(30) NOT NULL, /* 주문번호 */
	rcvname VARCHAR2(30) NOT NULL, /* 수령자이름 */
	hp1 CHAR(3) NOT NULL, /* 연락처1 */
	hp2 CHAR(4) NOT NULL, /* 연락처2 */
	hp3 CHAR(4) NOT NULL, /* 연락처3 */
	zipcode CHAR(5) NOT NULL, /* 우편번호 */
	addr1 VARCHAR2(200) NOT NULL, /* 주소1 */
	addr2 VARCHAR2(200) NOT NULL /* 주소2 */
);

COMMENT ON TABLE Receiver IS '수령자';

COMMENT ON COLUMN Receiver.onum IS '주문번호';

COMMENT ON COLUMN Receiver.rvcname IS '수령자이름';

COMMENT ON COLUMN Receiver.hp1 IS '연락처1';

COMMENT ON COLUMN Receiver.hp2 IS '연락처2';

COMMENT ON COLUMN Receiver.hp3 IS '연락처3';

COMMENT ON COLUMN Receiver.zipcode IS '우편번호';

COMMENT ON COLUMN Receiver.addr1 IS '주소1';

COMMENT ON COLUMN Receiver.addr2 IS '주소2';

CREATE UNIQUE INDEX PK_Receiver
	ON Receiver (
		onum ASC
	);

ALTER TABLE Receiver
	ADD
		CONSTRAINT PK_Receiver
		PRIMARY KEY (
			onum
		);

ALTER TABLE Receiver
	ADD
		CONSTRAINT FK_OrderDesc_TO_Receiver
		FOREIGN KEY (
			onum
		)
		REFERENCES OrderDesc (
			onum
		);
    
commit;

-- 시퀀스 생성 -----------------------------
CREATE SEQUENCE CG_NUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE PNUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE IDX_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE ONUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE RNUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE CNUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE CARTNUM_SEQ START WITH 1 NOCACHE;




  
   