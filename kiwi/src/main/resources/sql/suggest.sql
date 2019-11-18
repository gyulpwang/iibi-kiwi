-- 제안하기
ALTER TABLE suggest
   DROP CONSTRAINT FK_help_TO_suggest; -- 도와주세요 -> 제안하기

-- 제안하기
ALTER TABLE suggest
   DROP CONSTRAINT PK_suggest; -- 제안하기 기본키

-- 제안하기
DROP TABLE suggest;

-- 제안하기
CREATE TABLE suggest (
   no       NUMBER(5)      NOT NULL, -- 번호
   helpidx  NUMBER(5)      NOT NULL,     -- 글번호
   email    VARCHAR2(50)   NOT NULL, -- 이메일
   name     VARCHAR2(10)   NOT NULL, -- 이름
   contents VARCHAR2(1000) NOT NULL, -- 내용
   workdate VARCHAR2(30) NOT NULL,
   price VARCHAR2(20) default '협의',
   wdate    DATE           NOT NULL,
   midx     NUMBER(5)      NOT NULL,-- 작성일
   smode VARCHAR2(30) default 'n'
   
);

-- 제안하기 기본키
CREATE UNIQUE INDEX PK_suggest
   ON suggest ( -- 제안하기
      no ASC -- 번호
   );

-- 제안하기
ALTER TABLE suggest
   ADD
      CONSTRAINT PK_suggest -- 제안하기 기본키
      PRIMARY KEY (
         no -- 번호
      );

-- 제안하기
ALTER TABLE suggest
   ADD
      CONSTRAINT FK_help_TO_suggest -- 도와주세요 -> 제안하기
      FOREIGN KEY (
         helpidx -- 글번호
      )
      REFERENCES help ( -- 도와주세요
         helpidx -- 글번호
         on delete cascade
      );
      
      ALTER TABLE suggest
   ADD
      CONSTRAINT FK_member_TO_suggest -- 회원 -> 제안하기
      FOREIGN KEY (
         midx -- 회원번호
      )
      REFERENCES member ( -- 회원
         midx -- 회원번호
      );
      
      drop sequence suggest_no_seq;
      
      create sequence suggest_no_seq
      start with 1
      increment by 1
      nocache;
      
      select * from suggest;
      
