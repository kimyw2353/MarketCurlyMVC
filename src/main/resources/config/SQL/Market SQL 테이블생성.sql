--/  ���̺����  /-------------------------

ALTER TABLE Category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Category;

/* ī�װ� */
DROP TABLE Category 
	CASCADE CONSTRAINTS;

/* ī�װ� */
CREATE TABLE Category (
	cg_num Number(8) NOT NULL, /* ī�װ���ȣ */
	cg_code Varchar2(20) NOT NULL, /* ī�װ��ڵ� */
	cg_name VARCHAR2(50) NOT NULL /* ī�װ��� */
);

COMMENT ON TABLE Category IS 'ī�װ�';

COMMENT ON COLUMN Category.cg_num IS 'ī�װ���ȣ';

COMMENT ON COLUMN Category.cg_code IS 'ī�װ��ڵ�';

COMMENT ON COLUMN Category.cg_name IS 'ī�װ���';

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

/* ��ǰ */
DROP TABLE Product 
	CASCADE CONSTRAINTS;

/* ��ǰ */
CREATE TABLE Product (
	pnum Number(8) NOT NULL, /* ��ǰ��ȣ */
	pname VARCHAR2(100) NOT NULL, /* ��ǰ�� */
	pcompany VARCHAR2(50) NOT NULL, /* ������ */
	origin VARCHAR2(20), /* ������ */
	pimage1 VARCHAR2(200), /* ��ǰ�̹���1 */
	pimage2 VARCHAR2(200), /* ��ǰ�̹���2 */
	pimage3 VARCHAR2(200), /* ��ǰ�̹���3 */
	pqty NUMBER(8), /* ���� */
	price NUMBER(8) NOT NULL, /* ��ǰ���� */
	saleprice NUMBER(8) NOT NULL, /* ��ǰ�ǸŰ� */
	pcontents VARCHAR2(1000), /* ��ǰ���� */
	pspec VARCHAR2(20), /* ��ǰ���� */
	point NUMBER(8), /* ����Ʈ */
	pindate DATE, /* ��ǰ�԰��� */
	sbdate NUMBER(8), /* ������� */
	cg_num Number(8) /* ī�װ���ȣ */
);

COMMENT ON TABLE Product IS '��ǰ';

COMMENT ON COLUMN Product.pnum IS '��ǰ��ȣ';

COMMENT ON COLUMN Product.pname IS '��ǰ��';

COMMENT ON COLUMN Product.pcompany IS '������';

COMMENT ON COLUMN Product.origin IS '������';

COMMENT ON COLUMN Product.pimage1 IS '��ǰ�̹���1';

COMMENT ON COLUMN Product.pimage2 IS '��ǰ�̹���2';

COMMENT ON COLUMN Product.pimage3 IS '��ǰ�̹���3';

COMMENT ON COLUMN Product.pqty IS '����';

COMMENT ON COLUMN Product.price IS '��ǰ����';

COMMENT ON COLUMN Product.saleprice IS '��ǰ�ǸŰ�';

COMMENT ON COLUMN Product.pcontents IS '��ǰ����';

COMMENT ON COLUMN Product.pspec IS '��ǰ����';

COMMENT ON COLUMN Product.point IS '����Ʈ';

COMMENT ON COLUMN Product.pindate IS '��ǰ�԰���';

COMMENT ON COLUMN Product.sbdate IS '�������';

COMMENT ON COLUMN Product.cg_num IS 'ī�װ���ȣ';

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

/* ȸ�� */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* ȸ�� */
CREATE TABLE Member (
	idx Number(8) NOT NULL, /* ȸ����ȣ */
	name VARCHAR2(30), /* �̸� */
	userid VARCHAR2(30), /* ���̵� */
	pwd VARCHAR2(30), /* ��й�ȣ */
	hp1 CHAR(3), /* ����ó1 */
	hp2 CHAR(4), /* ����ó2 */
	hp3 CHAR(4), /* ����ó3 */
	zipcode CHAR(5), /* �����ȣ */
	addr1 VARCHAR2(200), /* �ּ�1 */
	addr2 VARCHAR2(200), /* �ּ�2 */
	mileage NUMBER(8) /* ���ϸ��� */
);

COMMENT ON TABLE Member IS 'ȸ��';

COMMENT ON COLUMN Member.idx IS 'ȸ����ȣ';

COMMENT ON COLUMN Member.name IS '�̸�';

COMMENT ON COLUMN Member.userid IS '���̵�';

COMMENT ON COLUMN Member.pwd IS '��й�ȣ';

COMMENT ON COLUMN Member.hp1 IS '����ó1';

COMMENT ON COLUMN Member.hp2 IS '����ó2';

COMMENT ON COLUMN Member.hp3 IS '����ó3';

COMMENT ON COLUMN Member.zipcode IS '�����ȣ';

COMMENT ON COLUMN Member.addr1 IS '�ּ�1';

COMMENT ON COLUMN Member.addr2 IS '�ּ�2';

COMMENT ON COLUMN Member.mileage IS '���ϸ���';

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

/* ��ٱ��� */
DROP TABLE Cart 
	CASCADE CONSTRAINTS;

/* ��ٱ��� */
CREATE TABLE Cart (
	cartNum Number(8) NOT NULL, /* ��ٱ��Ϲ�ȣ */
	oqty Number(8) NOT NULL, /* ���� */
	indate DATE, /* ����� */
	idx_fk Number(8) NOT NULL, /* ȸ����ȣ */
	pnum_fk Number(8) NOT NULL /* ��ǰ��ȣ */
);

COMMENT ON TABLE Cart IS '��ٱ���';

COMMENT ON COLUMN Cart.cartNum IS '��ٱ��Ϲ�ȣ';

COMMENT ON COLUMN Cart.oqty IS '����';

COMMENT ON COLUMN Cart.indate IS '�����';

COMMENT ON COLUMN Cart.idx_fk IS 'ȸ����ȣ';

COMMENT ON COLUMN Cart.pnum_fk IS '��ǰ��ȣ';

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

/* ������ */
DROP TABLE Center 
	CASCADE CONSTRAINTS;

/* ������ */
CREATE TABLE Center (
	cnum NUMBER(8) NOT NULL, /* �۹�ȣ */
	ctitle VARCHAR2(100), /* ���� */
	ccontent VARCHAR2(500), /* �۳��� */
	cwdate DATE, /* �ۼ��� */
	cfilename VARCHAR2(200), /* ÷������ */
	cidx_fk Number(8) /* ȸ����ȣ */
);

COMMENT ON TABLE Center IS '������';

COMMENT ON COLUMN Center.cnum IS '�۹�ȣ';

COMMENT ON COLUMN Center.ctitle IS '����';

COMMENT ON COLUMN Center.ccontent IS '�۳���';

COMMENT ON COLUMN Center.cwdate IS '�ۼ���';

COMMENT ON COLUMN Center.cfilename IS '÷������';

COMMENT ON COLUMN Center.cidx_fk IS 'ȸ����ȣ';

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

/* ���� �Խ��� */
DROP TABLE Review 
	CASCADE CONSTRAINTS;

/* ���� �Խ��� */
CREATE TABLE Review (
	rnum NUMBER(8) NOT NULL, /* �۹�ȣ */
	rtitle VARCHAR2(100), /* ���� */
	rcontent VARCHAR2(500), /* �۳��� */
	rscore NUMBER(2), /* ������ */
	rwdate DATE, /* �ۼ��� */
	rfilename VARCHAR2(200), /* ÷������ */
	ridx_fk Number(8), /* ȸ����ȣ */
	rpnum_fk Number(8) /* ��ǰ��ȣ */
);

COMMENT ON TABLE Review IS '���� �Խ���';

COMMENT ON COLUMN Review.rnum IS '�۹�ȣ';

COMMENT ON COLUMN Review.rtitle IS '����';

COMMENT ON COLUMN Review.rcontent IS '�۳���';

COMMENT ON COLUMN Review.rscore IS '������';

COMMENT ON COLUMN Review.rwdate IS '�ۼ���';

COMMENT ON COLUMN Review.rfilename IS '÷������';

COMMENT ON COLUMN Review.ridx_fk IS 'ȸ����ȣ';

COMMENT ON COLUMN Review.rpnum_fk IS '��ǰ��ȣ';

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

/* �ֹ����� */
DROP TABLE OrderDesc 
	CASCADE CONSTRAINTS;

/* �ֹ����� */
CREATE TABLE OrderDesc (
	onum VARCHAR2(30) NOT NULL, /* �ֹ���ȣ */
	ototalPrice NUMBER(10), /* �Ѱ����ݾ� */
	ototalPoint NUMBER(10), /* ����������Ʈ */
	odeliverCost NUMBER(8), /* ��ۺ� */
	odeliverState VARCHAR2(20), /* ��ۻ��� */
	opayState VARCHAR2(20), /* ���һ��� */
	opayWay VARCHAR2(20), /* ���ҹ�� */
	omaileage NUMBER(8), /* ��븶�ϸ��� */
	orderDate DATE, /* �ֹ��� */
	omemo VARCHAR2(200), /* ��۽ÿ�û���� */
	idx_fk Number(8) /* ȸ����ȣ */
);

COMMENT ON TABLE OrderDesc IS '�ֹ�����';

COMMENT ON COLUMN OrderDesc.onum IS '�ֹ���ȣ';

COMMENT ON COLUMN OrderDesc.ototalPrice IS '�Ѱ����ݾ�';

COMMENT ON COLUMN OrderDesc.ototalPoint IS '����������Ʈ';

COMMENT ON COLUMN OrderDesc.odeliverCost IS '��ۺ�';

COMMENT ON COLUMN OrderDesc.odeliverState IS '��ۻ���';

COMMENT ON COLUMN OrderDesc.opayState IS '���һ���';

COMMENT ON COLUMN OrderDesc.opayWay IS '���ҹ��';

COMMENT ON COLUMN OrderDesc.omaileage IS '��븶�ϸ���';

COMMENT ON COLUMN OrderDesc.orderDate IS '�ֹ���';

COMMENT ON COLUMN OrderDesc.omemo IS '��۽ÿ�û����';

COMMENT ON COLUMN OrderDesc.idx_fk IS 'ȸ����ȣ';

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

/* �ֹ���ǰ */
DROP TABLE Order_Product 
	CASCADE CONSTRAINTS;

/* �ֹ���ǰ */
CREATE TABLE Order_Product (
	onum VARCHAR2(30) NOT NULL, /* �ֹ���ȣ */
	pnum Number(8) NOT NULL, /* ��ǰ��ȣ */
	pimage VARCHAR2(200), /* ��ǰ�̹��� */
	oqty NUMBER(8), /* �ֹ����� */
	opoint NUMBER(8), /* ��������Ʈ */
	saleprice NUMBER(8) /* �ǸŴܰ� */
);

COMMENT ON TABLE Order_Product IS '�ֹ���ǰ';

COMMENT ON COLUMN Order_Product.onum IS '�ֹ���ȣ';

COMMENT ON COLUMN Order_Product.pnum IS '��ǰ��ȣ';

COMMENT ON COLUMN Order_Product.pimage IS '��ǰ�̹���';

COMMENT ON COLUMN Order_Product.oqty IS '�ֹ�����';

COMMENT ON COLUMN Order_Product.opoint IS '��������Ʈ';

COMMENT ON COLUMN Order_Product.saleprice IS '�ǸŴܰ�';

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

/* ������ */
DROP TABLE Receiver 
	CASCADE CONSTRAINTS;

/* ������ */
CREATE TABLE Receiver (
	onum VARCHAR2(30) NOT NULL, /* �ֹ���ȣ */
	rcvname VARCHAR2(30) NOT NULL, /* �������̸� */
	hp1 CHAR(3) NOT NULL, /* ����ó1 */
	hp2 CHAR(4) NOT NULL, /* ����ó2 */
	hp3 CHAR(4) NOT NULL, /* ����ó3 */
	zipcode CHAR(5) NOT NULL, /* �����ȣ */
	addr1 VARCHAR2(200) NOT NULL, /* �ּ�1 */
	addr2 VARCHAR2(200) NOT NULL /* �ּ�2 */
);

COMMENT ON TABLE Receiver IS '������';

COMMENT ON COLUMN Receiver.onum IS '�ֹ���ȣ';

COMMENT ON COLUMN Receiver.rvcname IS '�������̸�';

COMMENT ON COLUMN Receiver.hp1 IS '����ó1';

COMMENT ON COLUMN Receiver.hp2 IS '����ó2';

COMMENT ON COLUMN Receiver.hp3 IS '����ó3';

COMMENT ON COLUMN Receiver.zipcode IS '�����ȣ';

COMMENT ON COLUMN Receiver.addr1 IS '�ּ�1';

COMMENT ON COLUMN Receiver.addr2 IS '�ּ�2';

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

-- ������ ���� -----------------------------
CREATE SEQUENCE CG_NUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE PNUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE IDX_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE ONUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE RNUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE CNUM_SEQ START WITH 1 NOCACHE;
CREATE SEQUENCE CARTNUM_SEQ START WITH 1 NOCACHE;




  
   