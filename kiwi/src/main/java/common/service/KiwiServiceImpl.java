package common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import admin.model.AdminDAO;
import admin.model.AdminVO;
import help.model.HelpDAO;
import help.model.SuggestVO;
import member.model.MemberDAO;
import member.model.MemberVO;
import member.model.NotMemberException;
import talent.model.CategoryVO;
import talent.model.OrderDAO;
import talent.model.OrderVO;
import talent.model.PagingVO;
import talent.model.ReviewVO;
import talent.model.TalentDAO;
import talent.model.TalentVO;

@Service
public class KiwiServiceImpl implements KiwiService {

	/**
	 * 재능 관련
	 * ********************************************************************
	 */
	@Resource(name = "talentDAOMyBatis")
	private TalentDAO talentDao;

	@Resource(name = "helpDAOMyBatis")
	private HelpDAO helpDao;
	
	public List<CategoryVO> getUpCategory() {
		return talentDao.getUpCategory();
	}

	public List<CategoryVO> getUpCategory(int upCode) {
		return null;
	}

	public List<CategoryVO> getDwCategory(int upcode) {
		return talentDao.getDwCategory(upcode);
	}

	public List<TalentVO> allTalentList() {
		return talentDao.allTalentList();
	}

	public List<CategoryVO> infoByUpCate(int upcode) {
		return talentDao.infoByUpCate(upcode);
	}

	public List<TalentVO> selectByUpCate(int upcode) {
		return talentDao.selectByUpCate(upcode);
	}

	public List<TalentVO> talentListUpPaging(PagingVO paging, int upcode) {
		return talentDao.talentListUpPaging(paging, upcode);
	}

	public List<TalentVO> selectByDwCate(int upcode, int dwcode) {
		return talentDao.selectByDwCate(upcode, dwcode);
	}

	public List<TalentVO> talentListDwPaging(PagingVO paging, int upcode, int dwcode) {
		return talentDao.talentListDwPaging(paging, upcode, dwcode);
	}

	public TalentVO selectByTnum(int tnum) {
		return talentDao.selectByTnum(tnum);
	}

	public List<TalentVO> searchTalentPaging(PagingVO paging, String keyword) {
		return talentDao.searchTalentPaging(paging, keyword);
	}

	public int getTotalCountSch(PagingVO paging, String keyword) {
		return talentDao.getTotalCountSch(paging, keyword);
	}

	@Resource(name = "memberDAOMyBatis")
	private MemberDAO memberDao;

	/** [회원권한] 재능 등록하기 */
	public int insertTalent(TalentVO talent) {
		return talentDao.insertTalent(talent);
	}

	/** [회원권한] 재능 수정하기 */
	public int updateTalent(TalentVO talent) {
		return talentDao.updateTalent(talent);
	}

	/** [회원, 관리자 권한] 재능 삭제하기 */
	public int deleteTalent(int tnum) {
		return talentDao.deleteTalent(tnum);
	};

	/** 상위분류명 및 하위분류명 가져오기 */
	public CategoryVO getUpDwName(int tnum) {
		return talentDao.getUpDwName(tnum);
	}

	/** 재능 검색하기 */
	public List<TalentVO> searchTalent(String keyword) {
		return talentDao.searchTalent(keyword);
	}

	/** 재능 조회 - 페이징 처리 */
	public List<TalentVO> talentListPaging(PagingVO paging) {
		return talentDao.talentListPaging(paging);
	}

	/** 등록된 재능 갯수 구하기 */
	public int getTotalCount(PagingVO paging) {
		return talentDao.getTotalCount(paging);
	}

	/** 해당 상위분류에 등록된 재능 갯수 구하기 */
	public int getTotalCountUp(PagingVO paging, int upcode) {
		return talentDao.getTotalCountUp(paging, upcode);
	}

	/** 해당 하위분류에 등록된 재능 갯수 구하기 */
	public int getTotalCountDw(PagingVO paging, int dwcode) {
		return talentDao.getTotalCountDw(paging, dwcode);
	}

	/**
	 * 주문 관련 메소드 *************************************************************
	 */
	@Resource(name = "orderDAOMyBatis")
	private OrderDAO orderDao;

	/** 주문 개요 정보와 상품 정보를 insert 하는 메소드 */
	public int insertOrder(OrderVO order) {
		return orderDao.insertOrder(order);
	}

	/** 주문 정보 가져오기 */
	public OrderVO getOrderDesc() {
		return orderDao.getOrderDesc();
	}

	/** 주문 재능정보 가져오기 */
	public TalentVO getOrderTalentDesc(int tnum) {
		return orderDao.getOrderTalentDesc(tnum);
	}

	/** 주문수량만큼 재능수량에서 빼주기 */
	public int setPayResult(int oqty, int tnum) {
		return orderDao.setPayResult(oqty, tnum);
	}

	/** 판매자의 총 판매금액 및 순이익 금액 추가 */
	public int setPRtoSeller(int tnum, int ototalprice) {
		return orderDao.setPRtoSeller(tnum, ototalprice);
	}

	/** 구매자의 총구매금액에 추가 */
	public int setPRtoBuyer(int midx, int ototalprice) {
		return orderDao.setPRtoBuyer(midx, ototalprice);
	}

	/** [재능 & 회원] 마이페이지 - 재능 통계 *************/
	public int getMySellCnt(Integer midx) {
		return orderDao.getMySellCnt(midx);
	}

	public List<TalentVO> getMySell(Integer midx) {
		return orderDao.getMySell(midx);
	}

	public int getMyBuyCnt(Integer midx) {
		return orderDao.getMyBuyCnt(midx);
	}

	public List<OrderVO> getMyBuy(Integer midx) {
		return orderDao.getMyBuy(midx);
	}

	public int getTotBuy(Integer midx) {
		return orderDao.getTotBuy(midx);
	}

	public int getTotSell(Integer midx) {
		return orderDao.getTotSell(midx);
	}
	
	//////////////////////////////////////
	public int getHelpCnt(Integer midx) {
		return helpDao.getHelpCnt(midx);
	}

	public List<SuggestVO> getMySellList(Integer midx) {
		return helpDao.getMySellList(midx);
	}

	/**
	 * 후기 관련
	 * ********************************************************************
	 */
	public List<ReviewVO> getRvList(int tnum) {
		return talentDao.getRvList(tnum);
	}

	public ReviewVO selectByRnum(int rnum) {
		return talentDao.selectByRnum(rnum);
	}

	/** 전체 후기 가져오기 */
	public List<ReviewVO> allReviewList() {
		return talentDao.allReviewList();
	}

	public int insertReview(ReviewVO review) {
		return talentDao.insertReview(review);
	}

	public int updateReview(ReviewVO review) {
		return talentDao.updateReview(review);
	}

	public int deleteReview(int rnum) {
		return talentDao.deleteReview(rnum);
	}

	/** 총 리뷰 갯수 가져오기 */
	public int getRvCount(int tnum) {
		return talentDao.getRvCount(tnum);
	}

	/** 리뷰 평점 내기 */
	public int getRscoreAvg(int tnum) {
		return talentDao.getRscoreAvg(tnum);
	}

	/**
	 * 회원 관련
	 * ********************************************************************
	 */
	public int insertMember(MemberVO member) {
		int n = memberDao.insertMember(member);
		return n;
	}

	public MemberVO findMemberByEmail(String email1) throws NotMemberException {
		return null;
	}

	public int emailCheck(String email) {
		return memberDao.emailCheck(email);
	}

	public MemberVO isLoginOK(String email1, String pwd1) throws NotMemberException {
		return memberDao.isLoginOK(email1, pwd1);
	}

	public MemberVO selectByMidx(int midx) {
		return memberDao.selectByMidx(midx);
	}

	public int updateMember(MemberVO member) {

		return memberDao.updateMember(member);
	}

	public MemberVO findMemberByIdx(Integer idx) {
		return memberDao.findMemberByIdx(idx);
	}

	public int getTotalMember() {
		return memberDao.getTotalMember();
	}

	public List<MemberVO> getAllMembers(int start, int end) {
		return memberDao.getAllMembers();
	}

	public int findMemberTotal(String colType, String key) {
		return memberDao.findMemberTotal(colType, key);
	}

	public int deleteMember(int idx) {
		return memberDao.deleteMember(idx);
	}

	public List<MemberVO> findMember(String colType, String key, int start, int end) {
		return memberDao.findMember(colType, key, start, end);
	}

	public int deleteMember(Integer idx) {
		return memberDao.deleteMember(idx);
	}

	public List<MemberVO> findMember(String colType, String key) {
		return memberDao.findMember(colType, key);
	}

	public String findUserEmail(String mname, String email, String tel) {

		return memberDao.findUserEmail(mname, email, tel);

	}

	/** 전문가 랭킹 */
	public List<MemberVO> getMrank() {
		return memberDao.getMrank();
	}

	/**
	 * 관리자 관련
	 * ********************************************************************
	 */
	@Resource(name = "adminDAOMyBatis")
	private AdminDAO adminDao;

	public int adminEmailCheck(String aemail) {
		return adminDao.adminEmailCheck(aemail);
	}

	public AdminVO isAdminLoginOK(String aemail, String apwd) throws NotMemberException {
		return adminDao.isAdminLoginOK(aemail, apwd);
	}

	public AdminVO findAdminByIdx(Integer aidx) {
		return adminDao.findAdminByIdx(aidx);
	}

	public AdminVO findByAdminEmail(String aemail) throws NotMemberException {

		return adminDao.findByAdminEmail(aemail);
	}

	public MemberVO findMemberByIdx(int midx) {
		return memberDao.findMemberByIdx(midx);
	}

	public String findUserEmail1(String mname, String tel) {
		return memberDao.findUserEmail1(mname, tel);
	}

	public int getCntSug(){
		return helpDao.getCntSug();
	}
}
