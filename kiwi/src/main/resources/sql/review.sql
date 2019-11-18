-- 후기 게시판
ALTER TABLE review
	DROP CONSTRAINT FK_member_TO_review; -- 회원 -> 후기 게시판

-- 후기 게시판
ALTER TABLE review
	DROP CONSTRAINT FK_talent_TO_review; -- 재능 -> 후기 게시판

-- 후기 게시판
ALTER TABLE review
	DROP CONSTRAINT PK_review; -- 후기 게시판 기본키

-- 후기 게시판
DROP TABLE review;

-- 후기 게시판
CREATE TABLE review (
	rnum      NUMBER(8)     NOT NULL, -- 글번호
	midx      NUMBER(5)     NOT NULL, -- 회원번호
	tnum      NUMBER(10)    NULL,     -- 재능번호
	rtitle    VARCHAR2(200) NULL,     -- 제목
	rcontents VARCHAR2(500) NULL,     -- 내용
	rscore    NUMBER(5)     NULL,     -- 평가점수
	rwriter   VARCHAR2(30)  NULL,     -- 작성자
	wdate     DATE          NULL      -- 작성일
);

-- 후기 게시판 기본키
CREATE UNIQUE INDEX PK_review
	ON review ( -- 후기 게시판
		rnum ASC -- 글번호
	);

-- 후기 게시판
ALTER TABLE review
	ADD
		CONSTRAINT PK_review -- 후기 게시판 기본키
		PRIMARY KEY (
			rnum -- 글번호
		);

-- 후기 게시판
ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review -- 회원 -> 후기 게시판
		FOREIGN KEY (
			midx -- 회원번호
		)
		REFERENCES member ( -- 회원
			midx -- 회원번호
		);

-- 후기 게시판
ALTER TABLE review
	ADD
		CONSTRAINT FK_talent_TO_review -- 재능 -> 후기 게시판
		FOREIGN KEY (
			tnum -- 재능번호
		)
		REFERENCES talent ( -- 재능
			tnum -- 재능번호
		);
		
-- 후기 시퀀스
DROP SEQUENCE REVIEW_RNUM_SEQ;

CREATE SEQUENCE REVIEW_RNUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;		

DESC REVIEW;		
----------------------------------------------------------------------------------		