-- 상위분류
ALTER TABLE upCate
	DROP CONSTRAINT PK_upCate; -- 상위분류 기본키

-- 상위분류
DROP TABLE upCate;

-- 상위분류
CREATE TABLE upCate (
	upcode NUMBER(10)   NOT NULL, -- 상위분류코드
	upname VARCHAR2(30) NOT NULL  -- 상위분류명
);

-- 상위분류 기본키
CREATE UNIQUE INDEX PK_upCate
	ON upCate ( -- 상위분류
		upcode ASC -- 상위분류코드
	);

-- 상위분류
ALTER TABLE upCate
	ADD
		CONSTRAINT PK_upCate -- 상위분류 기본키
		PRIMARY KEY (
			upcode -- 상위분류코드
		);
		
-- 상위분류 시퀀스
DROP SEQUENCE UPCATE_UPCODE_SEQ;

CREATE SEQUENCE UPCATE_UPCODE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;		

DESC UP;

insert into upCate(upcode, upname)
values(upCate_upcode_seq.nextval, '디자인');

insert into upCate(upcode, upname)
values(upCate_upcode_seq.nextval, '광고및미디어');

insert into upCate(upcode, upname)
values(upCate_upcode_seq.nextval, '컴퓨터');

insert into upCate(upcode, upname)
values(upCate_upcode_seq.nextval, '번역및작성');

insert into upCate(upcode, upname)
values(upCate_upcode_seq.nextval, '핸드메이드');

commit;
select * from upCate;