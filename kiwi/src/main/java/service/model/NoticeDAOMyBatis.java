package service.model;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import javax.annotation.*;

@Repository(value="noticeDAOMyBatis")
public class NoticeDAOMyBatis extends SqlSessionDaoSupport
implements NoticeDAO {
	
	private final String NS="service.model.NoticeMapper";
	
	private static final Logger log
	=LoggerFactory.getLogger(NoticeDAOMyBatis.class);
	
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public int insertNotice(NoticeVO notice) {
		return this.getSqlSession().insert(
				NS+".insertNotice",notice);
	}
	
	public List<NoticeVO> selectNoticeAll(PagingVO paging) {
		return  this.getSqlSession()
				.selectList(NS+".listNoticePaging",paging);
	}

	public List<NoticeVO> selectNoticeAll(Map<String, Integer> map) {
		return getSqlSession()
				.selectList(NS+".listNotice",map);
	}

	public int getTotalCount() {
		return this.getSqlSession()
				.selectOne(NS+".totalCount");
	}
	public int getTotalCount(PagingVO paging) {
		return getSqlSession()
				.selectOne(NS+".totalCount",paging);
	}


	public NoticeVO selectNoticeByNidx(int nidx) {
		return this.getSqlSession()
				.selectOne(NS+".selectNoticeByNidx",nidx);
	}

	public boolean updateReadnum(int nidx) {
		int n=this.getSqlSession()
				.update(NS+".updateReadnum",nidx);
		return (n>0)? true:false;
	}

	public int deleteNotice(int nidx) {
		return getSqlSession()
				.delete(NS+".deleteNotice",nidx);
	}

	public int updateNotice(NoticeVO notice) {
		return getSqlSession()
				.update(NS+".updateNotice",notice);
	}

	

	public List<NoticeVO> findNotice(PagingVO paging) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<NoticeVO> searchNotice(String keyword) {
		return getSqlSession().selectList(NS+".seachNotice",keyword);
	}

	public List<NoticeVO> selectNoticeBydate() {
		return getSqlSession().selectList(NS+".noticeBydate");
	}

	
}
