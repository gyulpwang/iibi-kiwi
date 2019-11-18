package service.model;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;



@Repository(value="faqDAOMyBatis")
public class FaqDAOMyBatis extends SqlSessionDaoSupport
implements FaqDAO {
	private final String NS="service.model.FaqMapper";
	private SqlSession ses;
	
	private static final Logger log
	=LoggerFactory.getLogger(FaqDAOMyBatis.class);

	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public List<FaqVO> allFaqList(int faq_uptype) {
		
		return this.getSqlSession().selectList(NS+".allFaqList",faq_uptype);
	}

	



}
