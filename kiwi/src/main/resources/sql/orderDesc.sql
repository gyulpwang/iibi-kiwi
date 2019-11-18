-- 주문
ALTER TABLE orderDesc
	DROP CONSTRAINT FK_member_TO_orderDesc; -- 회원 -> 주문

-- 주문
ALTER TABLE orderDesc
	DROP CONSTRAINT FK_talent_TO_orderDesc; -- 재능 -> 주문

-- 주문
ALTER TABLE orderDesc
	DROP CONSTRAINT PK_orderDesc; -- 주문 기본키

-- 주문
DROP TABLE orderDesc;

-- 주문
CREATE TABLE orderDesc (
	onum        NUMBER(5)      NOT NULL, 			 -- 주문번호
	midx        NUMBER(5)      NOT NULL, 			 -- 회원번호
	tnum        NUMBER(10)     NOT NULL, 			 -- 재능번호
	oname       VARCHAR2(10)   NOT NULL, 			 -- 회원이름
	otalent     VARCHAR2(100)  NULL,     			 -- 주문재능명
	oqty        NUMBER(8)      NULL,     			 -- 주문재능수량
	ototalprice NUMBER(10)     NULL,     			 -- 주문총금액
	opaystate   VARCHAR2(10)   default '미지불',     -- 지불상태
	orderdate   DATE           NULL,   				 -- 주문일
	ordermemo   VARCHAR2(1000) NULL,  				 -- 요청사항
	yn          VARCHAR2(5)    default 'n',		     -- 완료여부
	paymethod   NUMBER(5)      NULL     			 -- 지불방법
);

-- 주문 기본키
CREATE UNIQUE INDEX PK_orderDesc
	ON orderDesc ( -- 주문
		onum ASC -- 주문번호
	);

-- 주문
ALTER TABLE orderDesc
	ADD
		CONSTRAINT PK_orderDesc -- 주문 기본키
		PRIMARY KEY (
			onum -- 주문번호
		);

-- 주문
ALTER TABLE orderDesc
	ADD
		CONSTRAINT FK_member_TO_orderDesc -- 회원 -> 주문
		FOREIGN KEY (
			midx -- 회원번호
		)
		REFERENCES member ( -- 회원
			midx -- 회원번호
		);

-- 주문
ALTER TABLE orderDesc
	ADD
		CONSTRAINT FK_talent_TO_orderDesc -- 재능 -> 주문
		FOREIGN KEY (
			tnum -- 재능번호
		)
		REFERENCES talent ( -- 재능
			tnum -- 재능번호
		);
		
DROP SEQUENCE orderdesc_onum_SEQ;	
CREATE SEQUENCE orderdesc_onum_SEQ NOCACHE;	

select * from orderdesc;