package help.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import talent.model.CategoryVO;

@Repository(value="helpDAOMyBatis")
public class HelpDAOMyBatis extends SqlSessionDaoSupport
	implements HelpDAO{
	
	private final String NS="help.model.HelpMapper";
	
	private static final Logger log
		=LoggerFactory.getLogger(HelpDAOMyBatis.class);
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public int insertHelp(HelpVO help){
		log.debug("midx================{}",help);
		return this.getSqlSession().insert(NS+".insertHelp",help);
	}
	
	/*public List<HelpVO> selectHelpAll(Map<String,Integer>map){
		return this.getSqlSession().selectList(NS+".listHelp",map);
	}*/
	
	public List<HelpVO> selectHelpAll(PagingVO paging){
		return this.getSqlSession().selectList(NS+".listHelpPaging",paging);
	}
	
	public List<HelpVO> findHelp(PagingVO paging){
		return null;
	}
	
	public int getTotalCount(){
		return this.getSqlSession().selectOne(NS+".totalCount");
	}
	
	public int getTotalCount(PagingVO paging){
		return this.getSqlSession().selectOne(NS+".totalCount_find",paging);
	}

	public HelpVO selectHelpByhidx(Integer helpidx) {
		return this.getSqlSession().selectOne(NS+".selectHelpByhidx",helpidx);
	}

	public int deleteHelp(Integer helpidx) {
		return this.getSqlSession().delete(NS+".deleteHelp",helpidx);
	}

	public int updateHelp(HelpVO help) {
		return this.getSqlSession().update(NS+".updateHelp",help);
	}

	public CategoryVO infoByCate(int dwcode) {
		return this.getSqlSession().selectOne(NS+".infoByCate",dwcode);
	}
	
	public CategoryVO infoByUpCate(int upcode) {
		return getSqlSession().selectOne(NS+".infoByUpCate",upcode);
	}

	public List<CategoryVO> infoByCategory() {
		return this.getSqlSession().selectList(NS+".infoByCategory");
	}
	
	public List<CategoryVO> infoByUpCategory() {
		return this.getSqlSession().selectList(NS+".infoByUpCategory");
	}

	public CategoryVO DetailCate(Integer helpidx) {
		return this.getSqlSession().selectOne(NS+".DetailCate",helpidx);
	}

	public int insertSuggest(SuggestVO suggest) {
		return this.getSqlSession().insert(NS+".insertSuggest",suggest);
	}

	public int selectSuggestCount(Integer helpidx) {
		return this.getSqlSession().selectOne(NS+".countSuggest",helpidx);
	}

	public List<SuggestVO> selectSuggestName(int helpidx) {
		return this.getSqlSession().selectList(NS+".selectSuggestName",helpidx);
	}

	public int choiceSuggest(Integer helpidx,Integer no) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("helpidx", helpidx);
		map.put("no", no);
		
		return getSqlSession().insert(NS+".choiceSuggest",map);
	}

	public int updateSuggest(Integer helpidx) {
		int n= this.getSqlSession().update(NS+".updateSuggest",helpidx);
		return n;
	}

	public int updateSuggestSmode(Integer helpidx, Integer no) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("helpidx", helpidx);
		map.put("no", no);
		
		return this.getSqlSession().update(NS+".updateSuggestSmode",map);
	}

	
	public List<HelpVO> searchHelp(String keyword) {
		return getSqlSession().selectList(NS+".searchHelp",keyword);
	}

	public int selectCate(int upcode) {
		return getSqlSession().selectOne(NS+".selectCate",upcode);
	}

	public int updateBuySug(int midx, int iprice) {
		Map<String,Integer> map =  new HashMap<String,Integer>();
		map.put("midx", midx);
		map.put("iprice", iprice);
		return this.getSqlSession().update(NS+".updateBuySug",map);
	}

	public int updateSellSug(int no, int iprice) {
		Map<String,Integer> map =  new HashMap<String,Integer>();
		map.put("no", no);
		map.put("iprice", iprice);
		return this.getSqlSession().update(NS+".updateSellSug",map);
	}

	public int getHelpCnt(Integer midx) {
		return getSqlSession().selectOne(NS+".getHelpCnt",midx);
	}

	public List<SuggestVO> getMySellList(Integer midx) {
		return getSqlSession().selectList(NS+".getMySellList",midx);
	}

	public int getCntSug() {
		return getSqlSession().selectOne(NS+".getCntSug");
	}


	
	
	
	
}










