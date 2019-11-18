package talent.model;

import java.util.List;

import talent.model.PagingVO;
import talent.model.CategoryVO;
import talent.model.TalentVO;

public interface TalentDAO {
	
	/** 재능 관련 ******************************************************************** */
	/** 상위분류 가져오기*/
	public List<CategoryVO> getUpCategory();
	
	/** 하위분류  가져오기*/
	public List<CategoryVO> getDwCategory(int upcode);
	
	/** 모든 재능 목록 가져오기 */
	public List<TalentVO> allTalentList(); 

	/** 상위분류 정보(코드, 이름) 및 해당 상위분류의 하위분류 정보 가져오기 */
	public List<CategoryVO> infoByUpCate(int upcode);

	/** 상위분류에 해당하는 전체 재능목록 가져오기*/
	public List<TalentVO> selectByUpCate(int upcode);

	/** 해당 상위분류의 전체 재능목록 가져오기 - 페이징 */
	public List<TalentVO> talentListUpPaging(PagingVO paging, int upcode);
	
	/** 해당 상위분류코드 및 하위분류코드에 해당하는 전체 재능목록 가져오기 */
	public List<TalentVO> selectByDwCate(int upcode, int dwcode);
	
	/** 해당 상위분류코드 및 하위분류코드에 해당하는 전체 재능목록 가져오기 - 페이징 */
	public List<TalentVO> talentListDwPaging(PagingVO paging, int upcode, int dwcode);
	
	/** 재능번호로 특정 재능 가져오기*/
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

	/** 재능 조회 - 페이징 처리 */
	public List<TalentVO> talentListPaging(PagingVO paging);
		
	/** 등록된 재능 갯수 구하기 */
	public int getTotalCount(PagingVO paging);
	
	/** 해당 상위분류에 등록된 재능 갯수 구하기 */
	public int getTotalCountUp(PagingVO paging, int upcode);
	
	/** 해당 하위분류에 등록된 재능 갯수 구하기 */
	public int getTotalCountDw(PagingVO paging, int dwcode);
	
	/** 재능 검색하기 - 페이징 처리 */	
	public List<TalentVO> searchTalentPaging(PagingVO paging, String keyword);
	
	/** 해당 검색어가 포함된 재능 갯수 구하기 */
	public int getTotalCountSch(PagingVO paging, String keyword);
	
	/** 후기 관련 ******************************************************************** */
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


	
}
