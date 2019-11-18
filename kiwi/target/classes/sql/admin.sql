-- 관리자
ALTER TABLE admin
   DROP CONSTRAINT PK_admin; -- 관리자 기본키

-- 관리자
DROP TABLE admin;

-- 관리자
CREATE TABLE admin (
   aidx   NUMBER(5)    NOT NULL, -- 관리자번호
   aemail VARCHAR2(50) NOT NULL, -- 이메일
   apwd   VARCHAR2(16) NOT NULL  -- 비밀번호
);

-- 관리자 기본키
CREATE UNIQUE INDEX PK_admin
   ON admin ( -- 관리자
      aidx ASC -- 관리자번호
   );

-- 관리자
ALTER TABLE admin
   ADD
      CONSTRAINT PK_admin -- 관리자 기본키
      PRIMARY KEY (
         aidx -- 관리자번호
      );
      
create sequence admin_idx_seq
start with 1
increment by 1
nocache;
--------------------------------------------------------------------------------
insert into admin values(admin_idx_seq.nextval,'admin','admin');
insert into admin values(admin_idx_seq.nextval,'ww@ww.ww', '1234');
commit;
select * from admin;