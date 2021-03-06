-- 재능
ALTER TABLE talent
	DROP CONSTRAINT FK_upCate_TO_talent; -- 상위분류 -> 재능

-- 재능
ALTER TABLE talent
	DROP CONSTRAINT FK_dwCate_TO_talent; -- 하위분류 -> 재능

-- 재능
ALTER TABLE talent
	DROP CONSTRAINT FK_member_TO_talent; -- 회원 -> 재능

-- 재능
ALTER TABLE talent
	DROP CONSTRAINT PK_talent; -- 재능 기본키

-- 재능
DROP TABLE talent;

-- 재능
CREATE TABLE talent (
	tnum      NUMBER(10)     NOT NULL, -- 재능번호
	tname     VARCHAR2(100)  NOT NULL, -- 재능이름
	tprice    NUMBER(10)     NULL,     -- 재능가격
	timg      VARCHAR2(40)   NULL,     -- 재능이미지
	tqty      NUMBER(8)      NULL,     -- 재능수량
	tspec     VARCHAR2(10)   NULL,     -- 스펙
	tscore    NUMBER(5)      NULL,     -- 평가점수
	tcontents VARCHAR2(4000) NULL,     -- 재능설명
	asnrefund VARCHAR2(500)  NULL,     -- AS및환불
	tindate   DATE           NULL,     -- 등록일
	workdate  VARCHAR2(20)   NULL,     -- 작업소요일
	upcode    NUMBER(10)     NOT NULL, -- 상위분류코드
	dwcode    NUMBER(10)     NOT NULL, -- 하위분류코드
	midx      NUMBER(5)      NOT NULL, -- 회원번호
	seller	  VARCHAR2(10)	 NULL	   -- 재능판매자명
);

-- 재능 기본키
CREATE UNIQUE INDEX PK_talent
	ON talent ( -- 재능
		tnum ASC -- 재능번호
	);

-- 재능
ALTER TABLE talent
	ADD
		CONSTRAINT PK_talent -- 재능 기본키
		PRIMARY KEY (
			tnum -- 재능번호
		);

-- 재능
ALTER TABLE talent
	ADD
		CONSTRAINT FK_upCate_TO_talent -- 상위분류 -> 재능
		FOREIGN KEY (
			upcode -- 상위분류코드
		)
		REFERENCES upCate ( -- 상위분류
			upcode -- 상위분류코드
		);

-- 재능
ALTER TABLE talent
	ADD
		CONSTRAINT FK_dwCate_TO_talent -- 하위분류 -> 재능
		FOREIGN KEY (
			dwcode, -- 하위분류코드
			upcode  -- 상위분류코드
		)
		REFERENCES dwCate ( -- 하위분류
			dwcode, -- 하위분류코드
			upcode  -- 상위분류코드
		);

-- 재능
ALTER TABLE talent
	ADD
		CONSTRAINT FK_member_TO_talent -- 회원 -> 재능
		FOREIGN KEY (
			midx -- 회원번호
		)
		REFERENCES member ( -- 회원
			midx -- 회원번호
		);
		
-- 재능 시퀀스
DROP SEQUENCE TALENT_TNUM_SEQ;

CREATE SEQUENCE TALENT_TNUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;		

DESC TALENT;


insert into talent(tnum, tname, tprice, timg, tqty, tspec, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '당신이 찾던, 원하는 브랜딩을 디자인 해드립니다.', 50000, 'BrandSkull.jpg', 100, 'HOT', NULL,   
'1. 디자인 A (+ 0원) :
브랜드 네임 워드 마크의 경우 캘리 및 워드마크 디자인에 대한 부분이 적용되어 있지 않은 무료 서체 및 제가 구비하고있는 브랜딩 작업 라이센스를 취득한 유료 서체를 적용해 드리는 기본 옵션입니다.
캘리 및 워드마크 디자인이 필요하신 의뢰자 분들께서는 디자인 C 옵션 이상을 선택해주셔야 합니다.

2. 디자인 B (+ 50,000원) : 
브랜드 네임 워드 마크의 경우 캘리 및 워드마크 디자인에 대한 부분이 적용되어 있지 않은 무료 서체 및 제가 구비하고있는 
브랜딩 작업 라이센스를 취득한 유료 서체를 적용해 드리는 기본 옵션입니다.
캘리 및 워드마크 디자인이 필요하신 의뢰자 분들께서는 디자인 C 옵션 이상을 선택해주셔야 합니다.

3. 디자인 C (+ 100,000원) : 
원하시는 스타일 또는 제가 브랜드네임에 맞는 워드마크로 국문 또는 영문 중 선택하신 브랜드명을 바탕으로 기존 일반 서체가 
아닌 직접 디자인한 워드마크를 적용해 드립니다.
* 여러가지 시안을 바탕으로 최종 결과물에 구매자의 의도에 맞게 최고의 퀄리티로 디자인하게 됩니다.

4. 디자인 D 메뉴얼북 (+ 300,000원) : 
원하시는 스타일 또는 제가 브랜드네임에 맞는 워드마크로 국문 또는 영문 중 선택하신 브랜드명을 바탕으로 
기존 일반 서체가 아닌 직접 디자인한 워드마크를 적용해 드립니다.
또한 메뉴얼북은 디자인된 CI를 바탕으로 우편봉투, 명함과 같은 지류에서 부터 관련 상품을 제작하기전 적용사례, 
간판과 같은 사인물과 같은 기본 브랜딩 관련 Mock Up 디자인을 적용할 수 있는 메뉴얼북을 작업해 보내드립니다.'
,
'환불규정: 작업에 대한 판매자에게 책임이 있을 경우 협의 환불해드리며, 시안 배송 후 7일이 지나게 되면 자동으로 완료처리가 됩니다. 
시안을 받으시고 원하시는 수정 및 추가 작업에 대한 부분을 검토 하여 메시지 보내주시기 바랍니다.', sysdate, '일주일 이내', 1, 1, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '꿀로고공장장', 70000, 'honeylogo.jpg', 200, null, 
'* 고객맞춤 꿀로고!! 
옵션금액이 정해져 있지만 시안 갯수, 수정 횟수, 작업기간 조율 등으로 원하는 가격에 최대한 맞춰드립니다.

** 주문전 쪽지 메시지로 먼저 문의, 협의해 주세요~

모든 작업이 동시에 진행되고 있기 때문에 전화통화는 불가능합니다. 
공식적으로 기록이 되지 않는 전화통화 대화상의 뉘앙스 차이로 생길 수 있는 오해나 누락되는 부분을 막기위함이니 양해 부탁드립니다. :D (대신 카톡이나 문자 가능)

*** 시안이 나온상태에서 구매자분과 연락두절 시, 판매일로부터 15일이 지나면 현재 시안대로 배송됩니다! 사정이 있다면 꼭 연락주세요!!', 
'판매완료된 로고에 대해서 구매자가 수정을 요청할 경우, 수정 원하시는 부분을 서로 협의 후에 추가 주문하는것을 원칙으로 합니다. 
환불규정: 주문 - 작업이 진행된 경우에는 원칙적으로 환불이 불가합니다 ;ㅅ; 
다만 판매자가 상의 없이 개인사정 등으로 정해진 시일내에 완성된 작업물을 배송하지 못했을땐 협의하에 환불 가능합니다. ', sysdate, '3주 이내', 1, 1, 2, '성규림');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '로고, CI n BI 고퀼리티로 만들어 드립니다 ', 40000, '6328972logo.png', 300, null, 
'* 최종결과물은 하나만 선택가능하시며 , 다른 결과물도 함께 받고싶은 경우 시안당 1만원 추가결제를 하셔야합니다.

* 작업시간에는 전화를 잘 받지 않습니다. 맡기신 작업이름과 함께 문자 남겨주시면, 따로 전화드리겠습니다.

* 캐릭터 디자인은 기본 옵션으로 구매시 한가지 시안 제공됩니다. 두개 받으시려면 수량 두개로 신청해주시면 됩니다.

* 명함디자인, 응용디자인 같은 경우 추가적인 수정 작업은 진행되지 않습니다. 
===============================================================================
경력 10년차 디자인 전공자 입니다.
미국에서 거주하면서 미국, 영국, 아일랜드 등 영어권 나라 Client 들과 오랫동안 작업을 해왔구요, 이번에 한국들어오면서 크몽에 재능판매를 시작하게되었습니다.
아직 재능평가가 별로 없어서 걱정하시는 분들이 있을 걸로 생각됩니다. 여러분에게 좋은평가를 많이 받을 수 있도록, 여러분의 로고를 당당히 포트폴리오에 쓸 수 있도록 디자인하겠습니다. 
믿고 맡겨주시면 후회하지 않으실 겁니다. :)
디자인은 제가 하겠지만, 방향은 구매자님이 잡아주시는게 맞습니다. 
더 많은 정보를 주실수록 원하시는 결과를 얻으실수 있는 확률이 높아지시니 해당 부분 한번 두번 세번 꼭 유의부탁드립니다.
 ===============================================================================
01. 상호명
02. 업종 및 간단한 회사소개
03. 원하는 스타일의 로고 간단히 설명 
( 몇가지 로고를 첨부 해주시면 더욱 더욱 좋습니다. 너무 많은 로고를 첨부해주시면 방향을 잡기 더 어려워 주실 수 있으니 유의부탁드립니다. ^^;; )
04. 기타 남기실 말씀', 
'1차시안 전달 => 1차 수정 => 2차시안 전달 => 2차 수정 후 최종본 전달.
2차 이후 수정에는 추가 비용이 들 수 있습니다. 환불규정: 일정을 넘겨 처리못한 경우 환불 처리가능하나, 작업 시작 후 특별한 이유 없는한 환불 처리는 불가 합니다. ', sysdate, 1, 1, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '로고,캐릭터디자인 쎈쓰있게 디자인해 드립니다 ', 40000, 'SensePark.jpg', 400, null, 
'로고/ CI,BI /캐릭터/ 웹툰- 로고의 여왕 쎈쓰박이 디자인해드립니다

안녕하세요 로고디자이너 쎈쓰박입니다^^
회사를 대표해서 디자인을 발주하시는 실무자분께 프로젝트에 대한 확실한 이해와 표현을 전제로 신중하게 디자인을 스피디하고 정확하게 전달해드립니다. 
정확한 컨셉이해와 올바른 디자인^^
충무로 광고일러스트레이터로 출발 풍부한 경험의 실무경력 10년차 이상의 전문가로 어렵지않은 착한 디자인을 선보이겠습니다. 
디자이너 마인드로 귀사에 대해 충분히 고민하고 생각하겠습니다^^ 최강 최상 로고를 만드는 로고의 여왕~ 디자이너 쎈쓰박입니다.
착한가격 좋은 퀄리티로 귀사에 맞는 적합한 최선의 브랜드 로고가 되도록 하겠습니다.
-BI,CI,캐릭터,웹툰제작의 최강자 쎈쓰박에게 지금 문의주세요.

1.상호기재
2.업종기재
3.벤치마크 사이트나 참고샘플 사진혹은 스케치 첨부

*디자인 작업시 이해와 선호도 파악을 위한 것입니다.

당신의 디자인에 힘을 실어드립니다^^ 
', 
'1회 무료 수정..오타,문구,기본적인 컬러수정등의 경우
2회차부터 유료수정 1만원이 추가되오니
 환불규정: 재능결제 입금확인후 부터 디자인 작업이 진행됩니다..
시안 등록후 
 환불은 불가합니다..  ', sysdate, '1달 이상', 1, 1, 2, '성규림');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '9년차 P.M 파닥몬이 로고(시안 제한없음) 디자인을 제작 해 드립니다', 80000, 'padakmon.png', 500, null, 
'안녕하세요. 디자인 프리랜서 5년 + 웹 퍼블리셔 4년 = P.M 파닥몬 입니다.
최신 유행 트랜드, 새로운 느낌, 감각을 추구하여 로고를 전문적으로 만들어 드립니다.

0. 사용절차
구매자의 요구분석이 확실하게 반영되었을 때 사업 관계상 로고를 만들기 급하신 분들이나 저렴한 가격으로 로고를 구매하시려는 분들이 많으며, 
작업 간에 블렌딩(Branding)회사에 맡겨 많은 시간과 돈을 투자해야 하는 경우가 생기기 마련입니다.
블렌딩(Branding)회사 만큼의 퀄리티는 나오지 않습니다만, 최신 또는 유행에 맞는 트랜드한 로고를 만들 수 있도록 최선을 다하겠습니다. 
본 사이트(크몽)에서 단 기간(시간) 내에 블렌딩(Branding)로고를 만들기 위해선 고객님들의 많은 참여 부탁하겠습니다.

1. 의뢰 방법
- 로고명 및 의미, 주요 컬러, 원하는 디자인 예시 이미지 및 스케치 (사진 첨부)

1. 주문 접수 후
해당 의뢰내용은 확인 및 반영하여 크몽 메시지를 통하여 24시간 이내로 제작하여 올려드립니다.

※ 자세한 설명 시 로고 디자인 간에 좀 더 수월하고 빠른 작업이 가능합니다.
---------------------------------------------------------------------------------------------------------
※ 로고 의뢰는 7일 동안 시안 제한 없이 80,000원입니다.(정해진 기간보다 연장되더라도 원하는 시안이 나올 수 있도록  제작해드립니다.)
※ 디자이너에게 모든 부분을 창의적은 맡기시면 원하시는 느낌의 로고를 얻기 어렵다는 부분을 당부 드립니다. 따라서 필요한 정보는 확실히 전달해주셔야 합니다. 
※ 디자이너의 감각만 디자인의 모든걸 맡기는 구매자님께서는 다른 디자인 업체 or 타 디자이너를 선정해 주세요. 
(해당 크몽에서 진행하는 타 블렌딩한 100~1,000만 하는 느낌 보다는 디자인의 의미 부여나 또는 짧은 시간내에 만들어지는 디자인은 많은 
 의미를 담지 못한 다는점 양해 부탁드립니다. )
※ 마무리 작업 완료 시 AI or PSD, PNG, JPG 원본 파일을 zip 파일로 압축하여 보내드립니다.

감사합니다.
*~.좋은 의뢰 부탁하겠습니다.~*', 
'재능이 완료 후 수정 및 추가되는 작업의 시간이 판매자의 판단하에 큰 문제가 없을면 무료로 추가 의뢰 없이 진행해드립니다. 환불규정: 시안을 받으신 후에는 환급이 되지 않습니다.
추가해야 하는 작업의 경우는 수정 작업에 대한 기본의뢰의 추가를 요청 부탁합니다.
감사합니다.', sysdate, '작업일', 1, 1, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '[로고]디플래쉬/윤폰트+산돌구름 정품사용/휴일작업도 해 드립니다', 35000, 'Dflash.jpg', 600, null, 
'기본시안 2종 제공. 불만족시 추가로 3회수정 해드립니다
안녕하세요 로고 디자이너 디플래쉬 입니다.~~
(로고제작 승인이 된)정품 사용한 유료 글씨체(산돌구름+윤폰트)와 국내외 글씨체(상업적 무료)를모두사용하여 서체의 선택의 폭이 넓습니다.
4년동안 수많은 로고디자인일을 해왔고 판매횟수가 900건(j사+크몽+o사/통합)이 넘어갑니다.~~
많은 그래픽 자격증과 대회 수상해왔습니다.
디자인마인드가 귀사에 충분히 뿌리 박히도록 특이하고 개성이 뛰어나고 이쁘고 멋진 로고를 만들기 위해 최선을 다 하고 있습니다.
고객만족이 우선인 재능인입니다.
감사합니다.~~

0.수정시
1.참고로고를 제공해주시고
2.낙서를 사진찍어서보내주시고
3.형태와 색상을 지시해주신다면
4.원하시고 멋진 로고를가질수있다는걸 믿어 의심치 않습니다.^^
※피드백후 컨펌이완료되면 jpg,png,ai 파일이 전송되며
서로 다른시안마다 한파일씩 드리고있습니다. (퇴근시간 취침시간 고려하셔서 연락부탁드려요ㅠㅠ)

(초안 전송이 완료된 작업인 경우 환불은 불가능합니다.)', 
'!!수정 AS가이드!!
0)수정시 
1.참고로고를 제공해주시고 
2.낙서를 사진찍어서보내주시고 
3.형태와 색상을 지시해주신다면 
4.원하시고 멋진 로고를 가질수있다는걸 믿어 의심치 않습니다.^^

!!as범위!!
1. as범위는 수정가이드를 지켜주시는 선 안에서 as가 가능합니다.
2. 배송후 수정은 추가금이 발생할수있습니다.
3. 횟수는 3번까지 해드리고있습니다.

!!환불규정!!
초안 제공후부터는 환불이 불가능합니다.^^
배송은 결제후 익일까지 해드리고있습니다.', sysdate, '일주일 이내', 1, 1, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '상세페이지/이벤트 디자인/각종 배너작업 고퀄리티로 작업 해 드립니다', 50000, 'DeliciousDesign.jpg', 700, null, 
'각종 디자인!!이제 고민하지 마세요.
상세페이지 / 기획전 / 이벤트페이지 / 웹배너 / 드라마틱 리터칭
착한 가격! 빠른 작업! 고 퀄리티로 귀사의 발전을 기원합니다.

안녕하세요 맛있는 디자인의 맛에 푹 빠져보세요^^
---------------------------------------------------------------
◆꼭 읽으세요!!! 5만원의 단가는 말 그대로 기본 단가입니다. 사전 문의 없이 주문 먼저 주시지 마세요.!!
◆모든 작업은 충분히 상의 후에 작업이 들어갑니다. 
◆ 작업 기본 기간은 1일이지만 작업에 따라 기간이 늘어날수도 있습니다. 마감시간을 넉넉히 잡아주세요.
◆단가는 기본 단가이며, 추가로 발생하는 변수가 많기 때문에 작업 시간,페이지 길이, 퀼리티에 따라 증가할 수 있습니다. 
◆원하시는 컨셉/스타일/ 참고 이미지가 있으면 더 빠르고 원하시는 퀄리티에 도달할 수 있습니다.
◆의류관련 상세페이지는 꼭 테스트 이미지 2~3 먼져 보내주세요.
◆ 원본을 제공하는 경우 미리 말씀을 해주세요.

----------------------------------------------------------------

보시는 모든 귀사의 무궁한 발전을 기원드립니다.행복한 하루 되세요^^', 
'파일을 제공한 후 당일 또는 익일까지의 수정분에 한에 무료수정이 이루어 집니다.

추후에 이루어지는 수정 및 작업은 추가 금액이 발생합니다. 환불규정: 결제는 충분한 협의 후 결정되는 사항이므로 단순 변심에 의한 환불과 시안확인 후 수정사항이
발생 수정 이후에는 환불이 불가합니다.
', sysdate, '열흘 이내', 1, 2, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '모든 영상편집/제작 해 드립니다', 10000, 'MediaTool.png', 800, null, 
'당신의 영상에 날개를 달아드립니다.

홍보영상 제작비용 때문에 더이상 고민하지 마세요.
비용과 품질 그리고 제작기간 모두를 해결해 드립니다.
저렴한 비용으로 높은 퀄리티의 영상을 제작해 드립니다.
부족한시간? 최단기간의 1~2일 제작가능 합니다.

✔ 제작을 하시고자 하시는 내용을 메시지로 남겨주세요
　확인하여 빠르게 피드백 드리겠습니다.

✔ 다른영상제작을 원하시면 하단부에 위치한 링크들을  확인해 주세요.

✔ 10,000원 으로 제작가능 부분 (✔ BGM은 별도)
　간단한(30초이하의) *편집*자막*인트로 부분입니다.

※확인사항
상업적/비상업적 제작건 종류와 영상길이/퀄리티에따라 가격변동있습니다.
자세한 내용은 상담을 꼭 해주세요!! 그 후 합의된 가격으로 주문 부탁드립니다.

※ 유의사항
1. 최초 작업 시작 시(주문하시어 제작이 진행시) 원칙적으로 환불또는 취소가 불가능 합니다.
2. 제작이 진행되어 1차 (가)편집본이 나올시 전체적인 틀수정은 불가능합니다.
3. 영상에 대한 단순수정은 2회 무료이며, 3회부터 수정요금이 발생됩니다.
4. 최종결과물은 원하시는 포맷, 사이즈로 제작하여 드립니다. (기본 Full HD제공)
5. 소스파일은 일절 배포하지 않습니다.

타이틀, 로고,인트로,오프닝,인트로,아웃트로, 소규모 광고 ,기획성, 홍보,바이럴, 프로필,소개,행사 오프닝,행사 상영,스케치,기업 기념 ,기록,이벤트,생일축하/파티,프로포즈,어플리케이션 사용/홍보,모션/인포그래픽 ,선거 영상 등등  다양한 영상제작 문의부탁드립니다.​', 
'<AS규정>
제작이 진행되어 1차 (가)편집본이 나올시 전체적인 틀수정은 불가능합니다. 
영상에 대한 단순수정은 2회 무료이며, 3회부터 수정요금이 발생됩니다.

<환불규정>
최초 작업 시작 시(주문완료 후 제작 진행시) 원칙적으로 환불또는 취소가 불가능 합니다. 
환불또는 취소는 제작진행 이전에만 가능 하오니 이점 꼭 유의해 주시기 바랍니다.', sysdate, '약 1주', 2, 7, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '영상 만들어 드립니다', 25000, 'minyx.png', 500, null, 
'최종 결과물은 HD-720p(1280x720) 해상도로 제작되며,고화질 WMV 파일 포맷으로 전송해드립니다. 
﻿
﻿*추가 옵션별 샘플 영상0(기본영상). http://youtu.be/KKXVqNnOUMI (재생시간:1분12초 / 사진 10장 문구 16개)
﻿1. http://youtu.be/3wTSXQZu98Q (재생시간:1분29초 / 사진14장 문구 16개)

2. http://youtu.be/TD4hy-YigGs (재생시간:2분37초 / 사진28장 문구 16개)

﻿*작업에 필요한 소스는 구매자님이 보내주셔야 합니다. 소스사이즈는 1280x720 이상으로 보내주셔야 화질저하가 없습니다. 

﻿*제작기간 : 현재 1~7일 소요 
﻿(주문량에 따라 제작기간은 변경될 수 있으며, 주문하신 분의 답변이 늦어져 제작기간이 더 소요 될수도 있답니다)

﻿*문의 : 크몽메시지 (크몽규칙상 구매하시면 메일,연락처등을 볼수있습니다.)', 
'배송한 재능의 수정은 2회는 무료.
3회부터는 5000원 추가비용 발생.

배송한 재능의 수정은 2회는 무료.
3회부터는 5000원 추가비용 발생. 환불규정: 환불 및 취소 : 작업이 시작되면 원칙적으로 환불 불가. 

단, 작업자의 사정이나 그에 상응하는 사항이 있을시 협의 및 취소 가능.', sysdate, '약 2주', 2, 8, 2, '성규림');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '검색최적화(SEO) 마케팅용 워드프레스를 제작해 드립니다', 
100000, 'SEO44.jpg', 400, null, 
'SEO (검색엔진최적화) 마케팅전용 워드프레스를 제작해드립니다. 
네이버블로그와 웹문서, 구글웹문서결과까지 생각하신다면 무조건 문의주세요. 
충분히 상담해드린후에 구매하시면됩니다.

1일 제작완료!! 빠른 제작을 원하신다면 카페24에서 호스팅(월500원), 도메인 구매하신후 아이디비번와 FTP 비번과
네이버,SNS계정정보(아이디비번)을 메모장으로 작성하셔서 크몽대화창에 첨부해서 보내주시면 하루만에 제작해드립니다.!
( http://searchup.kr 과 같은 테마로 제작하여 바로 글만작성하시면 됩니다. )
 ----------------------------------------------------------------------------------
# 마케팅용 블로그가 필요하신 분!! 
# 트위터, 페이스북, 구글플러스, 네이버블로그, 웹문서, 구글까지 하나로 해결하실분!!
# 워드프레스를 이제 시작하시는분!! 누구나 운영할수 있도록 제작합니다.
이젠 워드프레스에서 글만등록하시면 포털(네이버,구글,다음)의 검색결과(블로그,웹문서영역)와 각종 SNS까지 등록되어 검색되어집니다.
------------------------------------------------
( 단, 단 도메인과 호스팅은 별도 구매하거나 의뢰주시면 세팅해드립니다. )
------------------------------------------------------------------
SEO 마케팅전용 워드프레스 구축내역

- 기본 무료테마를 적용 ( 적용될 테마 예제사이트 : http://searchup.kr )
- 네이버웹마스터도구(신디케이션연동)세팅완료
- 구글웹마스터도구세팅완료
- 네이버블로그 API연동 세팅완료
- SNS(트위터,페이스북,구글플러스)연동세팅완료
- 모바일웹페이지 설정완료 
- SEO를 위한 글쓰는방법 1:1원격제어 교육
------------------------------------------------------------------------', 
'배송한 재능은 제작후 1개월간 재능에 부분에 대해서는 무료A/S입니다. 그이후는 협의 환불규정: 최초 구매협의후 작업시작이후에는 환불불가입니다.
단 배송이 사전협의없이 2~3일단 늦어지는경우에는 환불하도록 합니다.', sysdate, '약 1주', 3, 13, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '최고급 퀄리티 모바일+ 홈페이지 제작/평생 홈페이지 무료관리 해 드립니다', 580000, 'WebStandards180.jpg', 300, null, 
'특화된 기능의 홈페이지 설치 제작 해드립니다.

홈페이지 관리가 쉽습니다.
SEO 최적화로 포탈 웹문서 노출 갑 무조건 지원/ 네이버 신디케이션 기본장착/(아무리 잘만든 홈페이지라도 검색에 노출안되면 소용없습니다. 방문자 많은 홈페이지가 최고!!!)
sns 친구등록시 평생 실시간 지원

소핑몰 /포탈/ 구인구직/ 뉴스 매거진 /미디어 형식의 고기능 홈페이지 입니다.

포트폴리오 +++++++++++++++++++++++++++++++++++++++++++++++++

http://xe1197.body1197.gethompy.com/
http://xe1197.body1197.gethompy.com/
http://xe1197.body1197.gethompy.com/

모바일용  + PC용  또는 반응형 홈페이지

사용자 요구 프로그램 추가시에는 별도의 프로그램 개발비용을 협의 요함
창조적인 이미지 작업 요구 시 별도의 비용이 추가 됩니다. (협의 요함)
과다한 업무 요구시 (ex 페이지수 30이상 등) 별도의 비용 협의 요망합니다.
대부분의 홈페이지는 특별한 프로그램 기능 업데이트 또는 이미지 작업없이 운영 할 수 있습니다.

문의시 안내사항 

판매자의 연락처가 공개되어 있습니다. 바르고 빠른 상담을 위해서 유선 연락은 좋으나 재능 거래가 성사되면 안전한 거래를 위하여  반드시 크몽을 통하여 거래해 주시기를 당부드립니다.

1.홈페이지 제작 예산비용을 알려주시면 상담에 더욱 도움이 됩니다. 예산에 맞는 가이드라인을 정해서 예산을 뛰어넘는 최상의 홈페이지를 제작해드리겠습니다.

2.참조 홈페이지를 알려 주시면  더 빠른 지원이 됩니다.', 
'재능 배송후 AS 는 홈페이지를 통해서 의뢰하시기 바랍니다..

AS 는 무료이나 시간이 소요되는 프로그램은 협의하여 비용청구합니다.,
환불규정: 재홈페이지 제작착수후 환불되지 않습니다.
고객변심에 의한 환불도 불가능 합니다.
이 점양지하시어서 신중한 구매 부탁드립니다.', sysdate, '약 2주', 3, 14, 2, '성규림');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '[3rd 크몽어워즈 베스트 번역인 상 수상!!] 일본어(한일/일한) 번역해 드립니다', 5000, 'kinsinei.jpg', 200, null, 
'일본대학을 졸업하고 현재 한국에서 일본기업에서 종사하고 있습니다.
2년반정도 통/번역 전담을 하다가 지원팀으로 전입하여 근무중에 있습니다.
빠른 진행 가능하나, 번역 내용물에 따라 다소 시간이 걸릴 수 있습니다. 
워드기준 A4 장당 글자체 돋움체 / 글자크기 12pt / 줄간격 150% / 좌우상하 여백(기본세팅) / 글자수 한→일　200자 이하、일→한　400자 이하입니다. 
(한일, 일한 둘다 적용됩니다) 
평일 저녁시간대, 주말 및 공휴일에는 응답이 늦어지는 경우가 있사오니 양해부탁드립니다. 
한글파일(hwp)은 편집프로그램이 없어 작업이 불가능하오니 
Microsoft사의 Office파일로의 전송을 부탁드립니다. (doc, excel, ppt 등)

영어단어/문장이 문서에 포함되어 있을 경우 이부분은 그대로 영어로 남겨두고 번역합니다.

영어단어/문장도 일본어로 번역이 필요하신 경우 한국어로 사전에 바꾸어 주신후에
일본어 번역을 의뢰하시거나, 굉장히 쉬운 난이도여서 영어단어도 함께 일본어로
번역을 요청하시는 경우에는 사전에 문의를 부탁드립니다. 
협의 후에 진행여부 말씀 드리겠습니다. 

**번역물에 관한 법적책임은 지지않습니다. ', 
'환불규정: 주문접수이후의 환불요청은 이미 작업이 시작되었기 때문에 받지 않습니다. 
단, 작업자의 과실로 인하여 약속 납기가 늦어지는 경우 등에 대해서는 환불요청 대응해드립니다.', sysdate, '일주일 이내', 4, 19, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '논문 교정, 논설문 작성 및 교정 해 드립니다', 5000, 'CircleTranslate.png', 100, null, 
'안녕하세요. 저는 국문학 전공, 신문방송학을 복수전공 했습니다.
인문학에 대해 관심이 많으며 글쓰기를 즐겨 합니다.
의뢰 맡기시기 전 금액과 주의사항에 대해 안내드립니다.  
* 한글 파일, 글자체 한컴돋움, 글씨크기 11, 줄간격 기본 160%을 기본으로 작업합니다.
* 분량 추가 원하시면 옵션을 통한 추가 구매 부탁드립니다.  

- 논문 및 논설문, 보고서에 대한 교정·첨삭을 통해 가독성을 높여드립니다.
- 보고서의 경우, 기본 10,000원부터 책정하며 상담을 통해 조율 가능합니다.
- 논문 작성은 해 드리지 않습니다.
- 학사 논문에 대한 교정만 가능하며 석사 논문은 접수하지 않습니다.
- 필요한 자료에 대해서는 상담을 통해 합의하셔야만 합니다.

* 선주문이 밀려있을 수 있으니 반드시 선 상담을 통해 기한, 분량, 목적을 말씀해 주세요.
* 상담 후에 반드시 주문 해 주셔야만 작업을 시작할 수 있습니다.
* 개인 연락처 요구 및 사전 말씀 없는 개인번호 연락은 자제 부탁드립니다.
* 작업 시작 후에는 환불이 불가합니다.  

맡겨주신 작업은 항상, 만족하실 수 있도록 최선을 다하겠습니다.
문의 주셔서 감사드리며, 좋은 하루되시기 바랍니다. 감사합니다.^^', 
'* 배송한 글쓰기 재능은 1회까지 무료수정 가능합니다.
- 수정 요청시, 원하시는 바를 구체적으로 말씀해주세요.
- 2회 이상부터 상의를 통하여 수정 요금이 발생할 수 있습니다.
* 작업이 당초 약정일자보다 지연되거나 그에 상응하는 사안이 발생했을 경우, 협의에 따라 환불이 가능합니다. 
- 환불규정 : 판매자의 사정으로 날짜가 초과되거나 연락 두절의 경우 외에 최초 작업 시작 시 원칙적으로 환불 불가합니다.', sysdate, '일주일 이내', 4, 20, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '무민 석고방향제를 만들어 드립니다', 5000, 'Moomin.JPG', 200, null, 
'인기 최고! 무민 석고방향제 입니다 :)
플리마켓 나갈 때마다 완판!! 기본은 흰색 무민에 눈 콕콕 데코 해드려요~^^
석고방향제는 발향, 인테리어 뿐만 아니라 제습효과도 있어요~
차량, 옷장, 신발장, 화장실에도 사용가능하답니다!
센스있는 선물로도 굿이예요~! 향을 선택해주시면 리필용 오일로 함께 드립니다 :)

1. 레몬라벤더
2. 클린코튼
3. 대나무
4. 피오니 작약 
5. 화이트머스크
6. 우드세이지
7. 라벤더
8. 가든파티
9. 가든스위피
10. 딥디크탐다오
11. 아쿠아키스
12. 헤스페리데스
13. 피치

발향기간은 2~3개월정도 입니다.
향이 점점 약해지면 오일을 추가로 뿌리시거나 향수를 뿌리셔도 됩니다!
평생 사용가능한 착한 방향제예요~

천연석고를 사용하여 인체에 무해합니다 :)', 
'정도가 심하면 당연히 보내드리지 않지만
핸드메이드 특성상 기포나 스크래치가 살짝~ 있을 수 있습니다. 환불규정: 주문과 동시에 제작에 들어갑니다 :) 
고객님만을 위해 만들어지는 아이들이니 취소 및 환불은 어려운 점 양해부탁드려요~', sysdate, '3일 이내', 5, 25, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
insert into talent(tnum, tname, tprice, timg, tqty, tscore, tcontents, asnrefund, tindate, workdate, upcode, dwcode, midx, seller)
values(talent_tnum_seq.nextval, '페이스북 개인 및 기업페이지 대행(마케팅 및 홍보, 관리 및 운영)도와 드립니다', 300000, 'facebookMKT.png', 400, null, 
'안녕하세요. 
현재 국내 최다인 도합 1천만명 이상의 페이지 좋아요 및 개인계정 팔로워를 보유중인 페이지 및 개인계정을 직접 운영중인 현직 페이스북 전문 컨설턴트입니다.
1:1로 페이지 컨설팅 및 직접 운영 대행 해드립니다.   
소비자의 니즈에 맞춰서 컨설팅 해드리겠습니다. 
대행 같은 경우 기본적으로 개인페이지는 최소 1개월, 기업페이지같은 경우는 최소 2~3개월 이상이 소요되며 그 이유로는 개인페이지 같은 경우 단순히 페이지를 키우고, 도달율을 좋게하여 흔히들 말하시는 활성화 잘 된 페이지 로 자리잡게끔 해드리는 것이기 때문에 상대적으로 기간이 짧습니다. 
하지만 기업페이지 같은 경우에는 앞서 말씀드렸듯이 단순 페이지 크기 및 좋아요 수, 높은 도달율에서 그치는 것이 아닌 그에 상응하는 마케팅 및 홍보 효과를 통한 실제 사이트 유입 및 트래픽, 그리고 구매전환률이 매우 중요하기 때문에 시간이 많이 소요됩니다. 방법은 여러가지가 있지만, 보통 실제 유입 및 매출의 변화를 체감하시기 위해서는 2달~3달 정도의 시간이 소요됩니다. 
부연설명을 드리면, 개인페이지 같은 경우는 앞서 말씀드린 바와 같이 과정도 비교적 단순하고, 시간 및 인력 소모가 적습니다만, 기업페이지 같은 경우는 상대적으로 시간과 비용 투자가 많이 필요하고, 고려해야 할 것이 많기에 제가 일을 맡게되면 한달에 최대 3건까지밖에 진행을 하지 않고 있습니다. 그만큼 효과는 확실히 보장해드립니다. 
추가적으로 대행이 종료된 이후에도 기업 마케팅팀에서 손쉽게 운영하실 수 있도록 제 다른재능에 포함되어있는 페이스북 알고리즘 및 엣지랭크, 도달율 관리 및 페이지 관리에 대한 수년간 집약된 노하우 및 팁을 모두 전수해드리기에 향후 운영하시기에도 수월하실 거라는 생각이 듭니다. 

상대적으로 타 전문 대행사들에 비해 가격이 저렴한 이유는 개인 프리랜서이기때문입니다.
소셜마케팅(페이스북) 전문 컨설턴트로써 계속해서 경험을 쌓아가고 있는 과정이고, 대행사에서 진행하게 되는 복잡하고 불필요한 과정 및 시간낭비가 없기 때문이며 ,작업 퀄리티만큼은 최고를 보장한다고 자신있게 말씀드릴 수 있습니다. 믿고 맡겨주시기 바랍니다.     

※ 구매 옵션   
  기본 → 페이지 1:1 컨설팅 + 개인 페이지 운영 대행 30일 해드립니다
  20만원 추가시 → 페이지 1:1 컨설팅 + 기업 페이지 운영 대행 30일 해드립니다
  70만원 추가시 → 페이지 1:1 컨설팅 + 기업 페이지 운영 대행 60일 해드립니다
120만원 추가시 → 페이지 1:1 컨설팅 + 기업 페이지 운영 대행 90일 해드립니다

※ 구매시 유의사항
  1. 기본적으로 1개월 단위로 끊어서 진행 가능합니다. 하지만 최소 3개월 진행 ﻿이후 약속드린 확실한 홍보 및 마케팅 효과 보장해드리게 되며, 3개월 미만으로 진행하셨을 경우는 적용되지 않습니다.
(페이지별로 다르며, 약속드린 부분 충실히 이행하지 못했을 경우 무상 A/S 가능합니다)
  2. 주문 이후, 구매완료가 완료된 이후 익일부터 작업에 들어가게 됩니다. 이 점 유념해주시기 바랍니다.
  3. 세금계산서 발행은 구매진행시 크몽 사이트를 통해 가능하며, 세금이 포함된 가격입니다.', 
'기본적으로 구매자의 최대만족을 목표로 하며 만족하실때까지, 재능거래 종료 이후에도 계속해서 피드백을 해드리는 것을 모토로 합니다. 환불규정: 규정에 따른 환불만 가능합니다.
단, 본 재능 같은 경우에는 특성상 컨설턴트가 직접 관리 및 운영대행을 진행하게 되므로, 1개월 이상 정상적으로 진행되었을 시에는 환불은 불가능한 점 유의바랍니다.
(재능판매글 내 구매 및 배송, 환불 관련 유의사항 참고해주시면 감사하겠습니다.)', sysdate, '약 1달', 5, 26, 1, '정용욱');
------------------------------------------------------------------------------------------------------------------------
commit;
select * from talent order by tnum desc;