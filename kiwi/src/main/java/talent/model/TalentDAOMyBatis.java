package talent.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import talent.model.PagingVO;

@Repository("talentDAOMyBatis")
public class TalentDAOMyBatis extends SqlSessionDaoSupport implements TalentDAO {

	private final String NS="talent.model.TalentMapper";
	private SqlSession ses;
	
	private static final Logger log
	=LoggerFactory.getLogger(TalentDAOMyBatis.class);
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<CategoryVO> getUpCategory() {
		return this.getSqlSession().selectList(NS+".selectUpCategory");
	}

	public List<CategoryVO> getUpCategory(int upCode){
		return this.getSqlSession().selectList(NS+".selectUpNCategory", upCode);
	}
	
	public List<CategoryVO> getDwCategory(int upcode) {
		return this.getSqlSession().selectList(NS+".selectDwCategory", upcode);
	}

	public List<TalentVO> allTalentList() {
		return this.getSqlSession().selectList(NS+".allTalentLIst");
	}

	public List<CategoryVO> infoByUpCate(int upcode) {
		return getSqlSession().selectList(NS+".infoByUpCate", upcode);
	}
	
	public List<TalentVO> selectByUpCate(int upcode) {
		return getSqlSession().selectList(NS+".selectByUpCate", upcode);
	}

	public List<TalentVO> talentListUpPaging(PagingVO paging, int upcode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("upcode", upcode);
		
		return getSqlSession().selectList(NS+".talentListUpPaging", map);
	}
	
	public List<TalentVO> selectByDwCate(int upcode, int dwcode) {
		return getSqlSession().selectList(NS+".selectByDwCate", dwcode);
	}
	
	public List<TalentVO> talentListDwPaging(PagingVO paging, int upcode, int dwcode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("upcode", upcode);
		map.put("dwcode", dwcode);
		
		return getSqlSession().selectList(NS+".talentListDwPaging", map);
	}
	
	public TalentVO selectByTnum(int tnum) {
		return getSqlSession().selectOne(NS+".selectByTnum", tnum);
	}

	public int insertTalent(TalentVO talent) {
		return getSqlSession().insert(NS+".insertTalent", talent);
	}
	
	public int updateTalent(TalentVO talent) {
		return getSqlSession().update(NS+".updateTalent", talent);
	}

	public int deleteTalent(int tnum) {
		return getSqlSession().delete(NS+".deleteTalent", tnum);
	}

	public CategoryVO getUpDwName(int tnum){
		return getSqlSession().selectOne(NS+".getUpDwName", tnum);
	}

	public List<TalentVO> searchTalent(String keyword) {
		return getSqlSession().selectList(NS+".searchTalent", keyword);
	}
	
	public List<TalentVO> talentListPaging(PagingVO paging){
		return getSqlSession().selectList(NS+".talentListPaging", paging);
	}
	
	public int getTotalCount(PagingVO paging){
		return getSqlSession().selectOne(NS+".getTotalCount", paging); 
	}

	public int getTotalCountUp(PagingVO paging, int upcode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("upcode", upcode);
		return getSqlSession().selectOne(NS+".getTotalCountUp", map);
	}
	
	public int getTotalCountDw(PagingVO paging, int dwcode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("dwcode", dwcode);
		return getSqlSession().selectOne(NS+".getTotalCountDw", map);
	}
	
	public List<TalentVO> searchTalentPaging(PagingVO paging, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("keyword", keyword);
		
		return getSqlSession().selectList(NS+".searchTalentPaging", map);
	}

	public int getTotalCountSch(PagingVO paging, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("keyword", keyword);
		
		return getSqlSession().selectOne(NS+".getTotalCountSch", map);
	}
	
	/** 후기 관련 ************************************************** */
	public List<ReviewVO> getRvList(int tnum){
		return getSqlSession().selectList(NS+".getRvList", tnum);
	}
	
	public ReviewVO selectByRnum(int rnum){
		return getSqlSession().selectOne(NS+".selectByRnum", rnum);
	}
	
	public List<ReviewVO> allReviewList(){
		return getSqlSession().selectList(NS+".allReviewList");
	}
	
	public int insertReview(ReviewVO review) {
		return getSqlSession().insert(NS+".insertReview", review);
	}

	public int updateReview(ReviewVO review) {
		return getSqlSession().update(NS+".updateReview", review);
	}

	public int deleteReview(int rnum) {
		return getSqlSession().delete(NS+".deleteReview", rnum);
	}
	
	public int getRvCount(int tnum){
		return getSqlSession().selectOne(NS+".getRvCount", tnum);
	}
	
	public int getRscoreAvg(int tnum){
		return getSqlSession().selectOne(NS+".getRscoreAvg", tnum);
	}
	
}
