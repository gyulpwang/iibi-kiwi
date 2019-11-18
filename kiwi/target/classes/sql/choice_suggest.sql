
-- 새 테이블2
DROP TABLE choice_suggest;

-- 새 테이블2
CREATE TABLE choice_suggest (
   helpidx    NUMBER(5) NOT NULL, -- 글번호
   no         NUMBER(5) NOT NULL, -- 번호
   choice_idx NUMBER(5) NOT NULL  -- 선택번호
);

CREATE UNIQUE INDEX PK_choice_suggest
   ON choice_suggest ( -- 제안하기
      choice_idx ASC -- 번호
   );

      
      
      drop sequence choice_suggest_idx;
      
      create sequence choice_suggest_idx
      start with 1
      increment by 1
      nocache;
      
      
      select * from choice_suggest;
      delete choice_suggest;
      update help set hmode='n' where helpidx=7;

      commit;