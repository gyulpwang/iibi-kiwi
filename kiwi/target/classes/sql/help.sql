-- 도와주세요
ALTER TABLE help
   DROP CONSTRAINT FK_member_TO_help; -- 회원 -> 도와주세요

-- 도와주세요
ALTER TABLE help
   DROP CONSTRAINT PK_help; -- 도와주세요 기본키

-- 도와주세요
DROP TABLE help;

-- 도와주세요
CREATE TABLE help (
   helpidx  NUMBER(5)      NOT NULL, -- 글번호
   title    VARCHAR2(30)   NOT NULL, -- 제목
   contents VARCHAR2(1000) NOT NULL, -- 내용
   writer    VARCHAR2(50)   NOT NULL, -- 작성자
   hprice   NUMBER(20)   NULL,     -- 희망금액
   edate    DATE           NULL,     -- 마감일
   midx     NUMBER(5)      NOT NULL,     -- 회원번호
   upcode NUMBER(5) NOT NULL,
   dwcode NUMBER(5) NOT NULL,
   hmode VARCHAR2(30) default 'n'
);



-- 도와주세요 기본키
CREATE UNIQUE INDEX PK_help
   ON help ( -- 도와주세요
      helpidx ASC -- 글번호
   );

-- 도와주세요
ALTER TABLE help
   ADD
      CONSTRAINT PK_help -- 도와주세요 기본키
      PRIMARY KEY (
         helpidx -- 글번호
      );

-- 도와주세요
ALTER TABLE help
   ADD
      CONSTRAINT FK_member_TO_help -- 회원 -> 도와주세요
      FOREIGN KEY (
         midx -- 회원번호
      )
      REFERENCES member ( -- 회원
         midx -- 회원번호
      );
     
DROP SEQUENCE help_idx_seq;
     
CREATE SEQUENCE help_idx_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

select * from help;

insert into help values(help_idx_seq.nextval,'디자인','첫도와주세요','하핫','작성자야','0','2016-08-20','11121우원');

select u.*, d.dwcode, d.dwname
from upCate u join dwCate d on u.upcode=d.upcode 
join help h on h.dwcode=d.dwcode order by helpidx desc;



select u.*, d.dwcode, d.dwname
from upCate u join dwCate d on u.upcode=d.upcode 
join help h on h.dwcode=d.dwcode where helpidx=1 order by helpidx desc;



