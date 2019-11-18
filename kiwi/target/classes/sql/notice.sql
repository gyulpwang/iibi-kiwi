-- 고객센터_공지사항
ALTER TABLE notice
	DROP CONSTRAINT FK_admin_TO_notice; -- 관리자 -> 고객센터_공지사항

-- 고객센터_공지사항
ALTER TABLE notice
	DROP CONSTRAINT PK_notice; -- 고객센터_공지사항 기본키

-- 고객센터_공지사항
DROP TABLE notice;

-- 고객센터_공지사항
CREATE TABLE notice (
	nidx     NUMBER(5)      NOT NULL, -- 공지글번호0
	title    VARCHAR2(70)   NOT NULL, -- 제목
	contents VARCHAR2(3000) NOT NULL, -- 내용
	writer   VARCHAR2(50)   NULL,     -- 작성자
	wdate    DATE           NULL,     -- 작성일
	READNUM  NUMBER(20)     DEFAULT 0,-- 조회수
	impt     VARCHAR2(10)   NULL,     -- 중요도
	clip     VARCHAR2(300)  NULL,     -- 첨부파일
	aidx     NUMBER(5)      NULL      -- 관리자번호
);

-- 고객센터_공지사항 기본키
CREATE UNIQUE INDEX PK_notice
	ON notice ( -- 고객센터_공지사항
		nidx ASC -- 공지글번호
	);

-- 고객센터_공지사항
ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice -- 고객센터_공지사항 기본키
		PRIMARY KEY (
			nidx -- 공지글번호
		);

-- 고객센터_공지사항
ALTER TABLE notice
	ADD
		CONSTRAINT FK_admin_TO_notice -- 관리자 -> 고객센터_공지사항
		FOREIGN KEY (
			aidx -- 관리자번호
		)
		REFERENCES admin ( -- 관리자
			aidx -- 관리자번호
		);
		
DROP SEQUENCE notice_nidx_SEQ;

CREATE SEQUENCE notice_nidx_SEQ NOCACHE;

------------------------------------------------------------------------------
insert into notice values(notice_nidx_seq.nextval,'키위의 3가지 큰 변화를 소개합니다 !','키위의 3가지 큰 변화를 소개합니다 !  빠밤 1. 거래 관련 데이터들을 한 눈에 확인하여 만족도 높은 거래를 성사할 수 있습니다 2. 현재 진행중인 판/ 구매 관리 내용들을 볼수 있습니다 3. 보다 깔끔하게 정리된메뉴, 빠르게 원하는 곳으로 이동할 수 있습니다.','관리자',sysdate,default,'','',1);
insert into notice values(notice_nidx_seq.nextval,'주문 접수 단계가 사라집니다 ','보다 빠르고 책임감 있는 거래 진행을 위해 주문 접수 과정이 사라집니다 !','관리자',sysdate,default,'','noti2.PNG',1);
insert into notice values(notice_nidx_seq.nextval,'재능등록양식 변경 안내','신선한 디자인, 명확한 구성 그리고 임시저장 기능까지!새롭게 바뀐 재능등록페이지 둘러볼까요?','관리자',sysdate,default,'중요','noti3.PNG',1);
insert into notice values(notice_nidx_seq.nextval,'재능등록 페이지 개선관련 안내 ','
1. 카테고리 세분화 작업새롭게 카테고리들이 구성되어 기존 재능들에 대한 정화작업이 순차적으로 진행되고 있습니다.
판매자 분들의 경우 회원님들의 재능을 검토 하시어 재능을 상품화하여 주시고 새로운 카테고리에 맞게 재구성 부탁드립니다.
 2. 모니터 키위 출격
재능클린정책을 효과적으로 운영하기 위하여 모니터링 직원이 카테고리에 맞게 재능의 집을 찾아드리고 있으며
재능 승인부서와 협력하여 수정이 필요한 재능들에 대하여 가이드 안내 작업을 진행 하고 있습니다. 
또한 회원님들의 피해방지를 위하여
모든 채널을 동원하여 깨끗한 크몽을 만들기 위하여 두눈 크게 뜨고 청소하고 있답니다.
3. 재능등록시스템 변경
구매자 분들의 재능을 구매하기 위해 확인 작업해야 하는 내용이 너무 많다는 의견을 수렴하여
재능을 적극적으로 상품화 하기 위하여 재능등록시스템을 변경하며 재능등록가이드 서비스를 진행합니다.
','관리자',sysdate,default,'','',1);
insert into notice values(notice_nidx_seq.nextval,'네이버 광고 규제 재능 수정 가이드 안내','네이버 광고 규제 재능 수정 가이드

현재 키위는 네이버 사에서 "키위" 검색 시 검색 노출이 시행되고 있으며, 추가적인 광고 진행을 위한
기초작업(재능 검수 작업)이 지난 2015년 10월부터 순차적으로 진행되고 있습니다.

검수작업 시 적용되는 재능 수정 가이드를 제시하여 드리오니 참고하시어 아직 재능을 수정하지 않은
회원님께서는 하루 빨리 수정해주시면 감사하겠습니다.

','관리자',sysdate,default,'','',1);
insert into notice values(notice_nidx_seq.nextval,'사이트 변경사항 공지','
반적인 오픈마켓과 다소 상이한 프로세스로 불편함이 많으셨던 구매자 분들을 ​ 위하여 키위팀이  합심하여 대대적인 개편작업을 진행하였습니다.
우리 한번 엿볼까요??

새롭게 단장한 구매관리','관리자',sysdate,default,'','noti3.PNG',1);
insert into notice values(notice_nidx_seq.nextval,'재능 카테고리 변경 안내','재능 카테고리 개선

판매자의 매출 신장 극대화와 구매자들의 재능 선택 편리성을 높이기 위하여 카테고리 개선 작업이 2016.02.11 예정되어 있습니다.
판매자분들의 재능은 변경 및 신설되는 카테고리 성격에 따라 임의 변경될 예정으로
보다 명확한 재능의 분류를 기대하고 있습니다.

','관리자',sysdate,default,'','',1);
insert into notice values(notice_nidx_seq.nextval,'새로운 판매옵션 소개','안녕하세요, 재능마켓 키위입니다.
판매자님들의 매출 신장과 빠른 결과물을 받고 싶어 하신 구매자님들의 의견을 수렴하여
새로운 기능을 도입하게 되었습니다.','관리자',sysdate,default,'','noti4.PNG',1);
insert into notice values(notice_nidx_seq.nextval,'저작권 관련 내용 및 안내사항 ','
안녕하세요, 키위입니다!
요즘 추웠다가 안 추웠다가를 반복하고 있는 변덕의 계절이 찾아왔습니다.
덕분에 감기도 실컷 걸리고 몸져 눕기도 수차례하고 있습니다.
 
많은 판,구매자님들이 중요한 부분이지만 놓치고 계신 분들이 많은 것으로 생각되어 이렇게 공지를 통해 전달드립니다.

위 내용은 상당히 중요한 내용인데요,
그 이유를 하나의 예로 들어 설명을 드리겠습니다.
만약 회원님들이 피땀 흘려 만든 로고나 디자인 또는 글들을 다른 사람들이 동의 없이 가져다 쓰고
이를 판매한다면 굉장히 속이 상하고 짜증도 많이 날 것입니다. 
심하게 되면 그 일을 해결하기 위해 법원까지 가게 되는 큰일이 될 수 있습니다.

때문에 저작권은 너무너무 중요합니다.
','관리자',sysdate,default,'중요','noti5.PNG',1);
insert into notice values(notice_nidx_seq.nextval,'8월에 변경되는 키위의 중요한 안내사항 
','안녕하세요 회원님 키위팀 입니다.
회원님들께 8월 변경되는 키위에 대해 안내해드리오니 읽어주시길 바랍니다. 

2016.07.31(금) 23시 ~  2016.08.01(토) 11시

키위 서버 이전 작업으로 인해 키위 사이트 이용이 제한됩니다. ','관리자',sysdate,default,'중요','',1);
insert into notice values(notice_nidx_seq.nextval,'판매자 연락처 전면 공개 관련 ','안녕하세요, 키위팀입니다. 
우선 지난 결제를 완료한 고객을 대상으로 한 판매자 연락처 공개 정책에 대해
적극적으로 협조해주신 많은 판매자 분들께 진심으로 감사하다는 말씀을 전해 드립니다.
 
판매자님의 연락처 공개 후 기존보다 판/구매자님들 간 거래에 대한 원활한 커뮤니케이션이 가능해져
거래 기일이 단축되고 전반적인 재능 결과물에 대한 만족도가 향상되는 등 긍정적인 효과를 불러오고 있습니다.
','관리자',sysdate,default,'','noti6.PNG',1);
insert into notice values(notice_nidx_seq.nextval,'
부가세 정책 변경 관련 ','전체 결제 금액 내에서 부가세가 포함된 금액으로 발행 되오니
착오 없으시기를 당부 드리겠습니다.
 
더 궁금하신 사항이 있으시면
고객센터(000-000-0000)로 문의 부탁 드립니다.
 
감사합니다.','관리자',sysdate,default,'중요','noti7.PNG',1);




commit;
select * from notice;