-- 고객센터_Q&A
ALTER TABLE qna
	DROP CONSTRAINT FK_member_TO_qna; -- 회원 -> 고객센터_Q&A

-- 고객센터_Q&A
ALTER TABLE qna
	DROP CONSTRAINT FK_admin_TO_qna; -- 관리자 -> 고객센터_Q&A

-- 고객센터_Q&A
ALTER TABLE qna
	DROP CONSTRAINT PK_qna; -- 고객센터_Q&A 기본키

-- 고객센터_Q&A
DROP TABLE qna;

-- 고객센터_Q&A
CREATE TABLE qna (
	qidx     NUMBER(5)      NOT NULL, -- 질문번호
	title    VARCHAR2(30)   NOT NULL, -- 제목
	qcate_cd VARCHAR2(3)    NULL,     -- 카테고리코드
	qcate_nm VARCHAR2(30)   NULL,     -- 카테고리명
	contents VARCHAR2(1000) NOT NULL, -- 내용
	writer   VARCHAR2(50)   NOT NULL, -- 작성자
	wdate    DATE           NULL,     -- 작성일
	yn       VARCHAR2(20)   NULL,     -- 답변여부
	clip     VARCHAR2(200)  NULL,     -- 첨부파일
	midx     NUMBER(5)      NULL,     -- 회원번호
	aidx     NUMBER(5)      NULL      -- 관리자번호
);

-- 고객센터_Q&A 기본키
CREATE UNIQUE INDEX PK_qna
	ON qna ( -- 고객센터_Q&A
		qidx ASC -- 질문번호
	);

-- 고객센터_Q&A
ALTER TABLE qna
	ADD
		CONSTRAINT PK_qna -- 고객센터_Q&A 기본키
		PRIMARY KEY (
			qidx -- 질문번호
		);

-- 고객센터_Q&A
ALTER TABLE qna
	ADD
		CONSTRAINT FK_member_TO_qna -- 회원 -> 고객센터_Q&A
		FOREIGN KEY (
			midx -- 회원번호
		)
		REFERENCES member ( -- 회원
			midx -- 회원번호
		);

-- 고객센터_Q&A
ALTER TABLE qna
	ADD
		CONSTRAINT FK_admin_TO_qna -- 관리자 -> 고객센터_Q&A
		FOREIGN KEY (
			aidx -- 관리자번호
		)
		REFERENCES admin ( -- 관리자
			aidx -- 관리자번호
		);
		
		
DROP SEQUENCE QNA_QIDX_SEQ;

CREATE SEQUENCE QNA_QIDX_SEQ NOCACHE;			
		