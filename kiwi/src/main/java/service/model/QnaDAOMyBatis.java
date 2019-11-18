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

@Repository(value="boardDAOMyBatis")
public class QnaDAOMyBatis extends SqlSessionDaoSupport
implements QnaDAO {
	private final String NS="service.model.ServiceMapper";
	private SqlSession ses;
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public int QnaInsert(QnaVO vo) {
		//1. SqlSession을 얻는다.
		ses=this.getSqlSession();
		//2. ses의 메소드 호출
		//int insert(네임스페이명.아이디, VO)
		int n=ses.insert(NS+".qnaInsert",vo);
		return n;
	}
	

	

}
