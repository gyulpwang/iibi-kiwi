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

@Repository("orderDAOMyBatis")
public class OrderDAOMyBatis extends SqlSessionDaoSupport implements OrderDAO {

	private final String NS="talent.model.OrderMapper";
	private SqlSession ses;
	
	private static final Logger log
	=LoggerFactory.getLogger(TalentDAOMyBatis.class);
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/** 주문 관련 메소드 ************************************************************* */
	public int insertOrder(OrderVO order){
		return getSqlSession().insert(NS+".insertOrder", order);	
	}
	
	public OrderVO getOrderDesc(){
		return getSqlSession().selectOne(NS+".getOrderDesc");
	}
	
	public TalentVO getOrderTalentDesc(int tnum){
		return getSqlSession().selectOne(NS+".getOrderTalentDesc", tnum);
	}
	
	public int setPayResult(int oqty, int tnum){
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("oqty", oqty);
		map.put("tnum", tnum);
		
		return getSqlSession().update(NS+".setPayResult", map);
	}
	
	public int setPRtoSeller(int tnum, int ototalprice){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("tnum", tnum);
		map.put("ototalprice", ototalprice);
		return getSqlSession().update(NS+".setPRtoSeller", map);
	}

	public int setPRtoBuyer(int midx, int ototalprice){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("midx", midx);
		map.put("ototalprice", ototalprice);
		return getSqlSession().update(NS+".setPRtoBuyer", map);
	}
	
	/** [재능 & 회원] 마이페이지 - 재능 통계 *************/
	public int getMySellCnt(Integer midx){
		return getSqlSession().selectOne(NS+".getMySellCnt", midx);
	}

	public List<TalentVO> getMySell(Integer midx){
		return getSqlSession().selectList(NS+".getMySell", midx);
	}

	public int getMyBuyCnt(Integer midx){
		return getSqlSession().selectOne(NS+".getMyBuyCnt", midx);
	}
	
	public List<OrderVO> getMyBuy(Integer midx){
		return getSqlSession().selectList(NS+".getMyBuy", midx);
	}

	public int getTotBuy(Integer midx){
		return getSqlSession().selectOne(NS+".getTotBuy", midx);
	}

	public int getTotSell(Integer midx){
		 SqlSession ses= getSqlSession();
		 if(ses!=null)
			 return ses.selectOne(NS+".getTotSell", midx);
		 else
			 return 0;
	}
}
