-- 회원
ALTER TABLE member
   DROP CONSTRAINT PK_member; -- 회원 기본키

-- 회원
DROP TABLE member;

-- 회원
CREATE TABLE member (
   midx      NUMBER(5)    NOT NULL, -- 회원번호
   email     VARCHAR2(50) NOT NULL, -- 이메일
   pwd       VARCHAR2(20) NOT NULL, -- 비밀번호
   mname     VARCHAR2(30) NOT NULL, -- 이름
   tel       VARCHAR2(20) NOT NULL, -- 연락처
   grade     VARCHAR2(10) DEFAULT '일반', -- 회원등급
   sell      NUMBER(10)   default 0,     -- 총판매금액
   buy       NUMBER(10)   default 0,     -- 총구매금액
   netprofit NUMBER(10)   default 0      -- 순이익금액
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_member
   ON member ( -- 회원
      midx ASC -- 회원번호
   );

-- 회원
ALTER TABLE member
   ADD
      CONSTRAINT PK_member -- 회원 기본키
      PRIMARY KEY (
         midx -- 회원번호
      );

ALTER TABLE member
   ADD
      CONSTRAINT UK_member_email -- 회원 기본키
      UNIQUE (
         email -- 회원번호
      );
      
drop sequence kiwi_member_seq;

CREATE SEQUENCE kiwi_member_seq
START WITH 1
INCREMENT BY 1
NOCACHE;   

insert into member values(kiwi_member_seq.nextval,'yksys11@naver.com','abcd!1234','정용욱','01033241346','일반',0,0,0);
insert into member values(kiwi_member_seq.nextval,'rbfla927@naver.com','abcd!1234','성규림','01045679327','일반',0,0,0);

commit;
select * from member;