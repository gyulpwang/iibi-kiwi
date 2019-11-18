package common.service;

import java.util.List;

import admin.model.AdminVO;
import help.model.SuggestVO;
import member.model.MemberVO;
import member.model.NotMemberException;
import talent.model.CategoryVO;
import talent.model.OrderVO;
import talent.model.PagingVO;
import talent.model.ReviewVO;
import talent.model.TalentVO;

public interface KiwiService {

	/****************** 재능 관련 메소드 ******************/
	/** 상위 분류 가져오기*/
	public List<CategoryVO> getUpCategory();
	
	/** 상위 분류 코드로 특정 상위 분류 정보 가져오기*/
	public List<CategoryVO> getUpCategory(int upCode);
	
	/** 하위 분류 가져오기*/
	public List<CategoryVO> getDwCategory(int upcode);
	
	/** 전체 재능 목록 가져오기 */
	public List<TalentVO> allTalentList();

	/** 상위분류 정보(코드, 이름) 및 해당 상위분류의 하위분류 정보 가져오기 */
	public List<CategoryVO> infoByUpCate(int upcode);

	/** 해당 상위분류의 전체 재능목록 가져오기 */
	public List<TalentVO> selectByUpCate(int upcode);
	
	/** 해당 상위분류의 전체 재능목록 가져오기 - 페이징 */
	public List<TalentVO> talentListUpPaging(PagingVO paging, int upcode);
	
	/** 해당 하위분류의 정보(코드, 이름) 가져오기 */
	/*public List<CategoryVO> infoByDwCate(int dwcode);*/
	
	/** 해당 하위분류의 전체 재능목록 가져오기 */
	public List<TalentVO> selectByDwCate(int upcode, int dwcode);

	/** 해당 상위분류코드 및 하위분류코드에 해당하는 전체 재능목록 가져오기 - 페이징 */
	public List<TalentVO> talentListDwPaging(PagingVO paging, int upcode, int dwcode);
	
	/** 재능 번호로 특정 재능 가져오기 */
	public TalentVO selectByTnum(int tnum);
	
	/** [회원권한] 재능 등록하기 */
	public int insertTalent(TalentVO talent);
	
	/** [회원권한] 재능 수정하기 */
	public int updateTalent(TalentVO talent);
	
	/** [회원, 관리자 권한] 재능 삭제하기 */
	public int deleteTalent(int tnum);
	
	/** 상위분류명 및 하위분류명 가져오기 */
	public CategoryVO getUpDwName(int tnum);

	/** 재능 검색하기 */
	public List<TalentVO> searchTalent(String keyword);

	/** 재능 검색하기 - 페이징 처리 */	
	public List<TalentVO> searchTalentPaging(PagingVO paging, String keyword);

	/** 재능 조회 - 페이징 처리 */
	public List<TalentVO> talentListPaging(PagingVO paging);

	/** 등록된 재능 갯수 구하기 */
	public int getTotalCount(PagingVO paging);
	
	/** 해당 상위분류에 등록된 재능 갯수 구하기 */
	public int getTotalCountUp(PagingVO paging, int upcode);
	
	/** 해당 하위분류에 등록된 재능 갯수 구하기 */
	public int getTotalCountDw(PagingVO paging, int dwcode);
	
	/** 해당 검색어가 포함된 재능 갯수 구하기 */
	public int getTotalCountSch(PagingVO paging, String keyword);
	
	/****************** 후기 관련 메소드 ******************/
	/** 해당 재능에 대한 후기 (재능번호로) 가져오기 */
	public List<ReviewVO> getRvList(int tnum);
	
	/** 후기글번호로 후기 내용 가져오기 */
	public ReviewVO selectByRnum(int rnum);

	/** 전체 후기 가져오기 */
	public List<ReviewVO> allReviewList();
	
	/** 후기 작성하기 */
	public int insertReview(ReviewVO review);
	
	/** 후기 수정하기 */
	public int updateReview(ReviewVO review);
	
	/** 후기 삭제하기 */
	public int deleteReview(int rnum);

	/** 총 리뷰 갯수 가져오기 */
	public int getRvCount(int tnum);
	
	/** 리뷰 평점 내기 */
	public int getRscoreAvg(int tnum);
	
	/***************** 주문 관련 메소드 *****************/
	/** 주문 개요 정보와 상품 정보를 insert 하는 메소드 */
	public int insertOrder(OrderVO ovo);
	
	/** 주문 정보 가져오기 */
	public OrderVO getOrderDesc();
	
	/** 주문 재능정보 가져오기 */
	public TalentVO getOrderTalentDesc(int tnum);
	
	/** 주문수량만큼 재능수량에서 빼주기 */
	public int setPayResult(int oqty, int tnum);
	
	/** 판매자의 총 판매금액 및 순이익 금액 추가 */
	public int setPRtoSeller(int tnum, int ototalprice);

	/** 구매자의 총구매금액에 추가 */
	public int setPRtoBuyer(int midx, int ototalprice);
	
	/***************** 회원 관련 메소드 *****************/
	/** 검색이나 로그인시 */
	public MemberVO findMemberByEmail(String email1)
	throws NotMemberException;
	
	/** 회원가입 */
	public int insertMember(MemberVO member);
	public int emailCheck(String email);
	
	/** 로그인 처리 */
	public MemberVO isLoginOK(String email1, String pwd1) throws NotMemberException;

	/** 회원번호로 회원정보 가져오기 */
	public MemberVO selectByMidx(int midx);

	/** 회원탈퇴 또는 회원정보 삭제 */
	public int deleteMember(Integer idx);
	
	/** 회원정보 검색 */
	public List<MemberVO> findMember(String colType,
			String key);
	
	/** 회원정보 검색-검색한 결과 회원수 */
	public int findMemberTotal(String colType,
										String key);
	/** 회원정보 검색-페이징 처리 */
	public List<MemberVO> findMember(String colType,
			String key, int start, int end);

	/** 회원 아이디 찾기*/
	public String findUserEmail(String mname, String email, String tel);
	
	 /** 전문가 랭킹 */
	   public List<MemberVO> getMrank();
	/***************** 관리자 관련 메소드 *****************/
	/**검색이나 로그인시*/
	public AdminVO findByAdminEmail(String aemail)
	throws NotMemberException;
	
	
	/**회원가입*/
	
	public int adminEmailCheck(String aemail);
	
	/**로그인 처리*/
	public AdminVO isAdminLoginOK(String aemail, String apwd)
			throws NotMemberException;


	public AdminVO findAdminByIdx(Integer aidx);

	public MemberVO findMemberByIdx(int midx);

	public int updateMember(MemberVO member);

	public int getTotalMember();

	public List<MemberVO> getAllMembers(int start, int end);

	public String findUserEmail1(String mname, String tel);

	/** 마이페이지 - 재능 통계 ******************************** */
	public int getMySellCnt(Integer midx);

	public List<TalentVO> getMySell(Integer midx);

	public int getMyBuyCnt(Integer midx);
	
	public List<OrderVO> getMyBuy(Integer midx);

	public int getTotBuy(Integer midx);

	public int getTotSell(Integer midx);
	
	public int getHelpCnt (Integer midx);
	
	public List<SuggestVO> getMySellList(Integer midx);

	public int getCntSug();
	
}
