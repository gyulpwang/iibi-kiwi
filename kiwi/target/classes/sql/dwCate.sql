-- 하위분류
ALTER TABLE dwCate
	DROP CONSTRAINT FK_upCate_TO_dwCate; -- 상위분류 -> 하위분류

-- 하위분류
ALTER TABLE dwCate
	DROP CONSTRAINT PK_dwCate; -- 하위분류 기본키

-- 하위분류
DROP TABLE dwCate;

-- 하위분류
CREATE TABLE dwCate (
	dwcode NUMBER(10)   NOT NULL, -- 하위분류코드
	upcode NUMBER(10)   NOT NULL, -- 상위분류코드
	dwname VARCHAR2(30) NOT NULL  -- 하위분류명
);

-- 하위분류 기본키
CREATE UNIQUE INDEX PK_dwCate
	ON dwCate ( -- 하위분류
		dwcode ASC, -- 하위분류코드
		upcode ASC  -- 상위분류코드
	);

-- 하위분류
ALTER TABLE dwCate
	ADD
		CONSTRAINT PK_dwCate -- 하위분류 기본키
		PRIMARY KEY (
			dwcode, -- 하위분류코드
			upcode  -- 상위분류코드
		);

-- 하위분류
ALTER TABLE dwCate
	ADD
		CONSTRAINT FK_upCate_TO_dwCate -- 상위분류 -> 하위분류
		FOREIGN KEY (
			upcode -- 상위분류코드
		)
		REFERENCES upCate ( -- 상위분류
			upcode -- 상위분류코드
		);
		
-- 하위분류 시퀀스
DROP SEQUENCE DWCATE_DWCODE_SEQ;

CREATE SEQUENCE DWCATE_DWCODE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;		

DESC dwCate;

-- 1. 디자인 / 2. 광고및미디어 / 3. 컴퓨터 / 4. 번역및작성 / 5. 핸드메이드
-- 1. 디자인
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 1, '로고디자인');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 1, '배너및상세페이지');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 1, '포토샵편집');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 1, '캐리커쳐및인물');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 1, '3D모델링및도면');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 1, '기타');

-- 2. 광고및미디어
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 2, '영상제작및편집');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 2, '스톱모션');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 2, '애니메이션및3D');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 2, '음악제작및편집');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 2, '더빙및녹음');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 2, '기타');

-- 3. 컴퓨터
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 3, '워드프레스');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 3, '웹사이트개발');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 3, '모바일앱및웹');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 3, '프로그램개발');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 3, '기술지원');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 3, '기타');

-- 4. 번역및작성
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 4, '번역및통역');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 4, '교정및편집');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 4, '창작및대필');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 4, '타이핑');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 4, '이력서및자기소개서');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 4, '기타');

-- 5. 핸드메이드
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 5, '캔들및방향제');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 5, '패션');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 5, '악세사리');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 5, '문구및팬시');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 5, '인테리어소품');
insert into dwCate(dwcode, upcode, dwname) values(dwCate_dwcode_seq.nextval, 5, '기타');

select * from dwCate order by dwcode asc;
commit;