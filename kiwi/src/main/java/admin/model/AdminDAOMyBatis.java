package admin.model;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import member.model.NotMemberException;

@Repository("adminDAOMyBatis")
public class AdminDAOMyBatis extends SqlSessionDaoSupport implements AdminDAO {

	private final String NS = "admin.model.AdminMapper";

	private SqlSession ses;

	@Resource(name = "sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public int adminEmailCheck(String aemail) {
		Integer n = this.getSqlSession().selectOne(NS + ".findByAdminEmail", aemail);
		if (n == null) {
			return 1;
		} else {
			return 0;
		}
	}

	
	public AdminVO isAdminLoginOK(String aemail, String apwd) throws NotMemberException {
		AdminVO amember = this.findByAdminEmail(aemail);
		if (amember == null) {
			throw new NotMemberException(aemail + "는 존재하지 않습니다.");
		}
		if (!apwd.equals(amember.getApwd())) {
			throw new NotMemberException("비밀번호가 틀려요");
		}
		return amember;
	}

	public AdminVO findAdminByIdx(Integer aidx) {
		ses=this.getSqlSession();
		AdminVO vo=ses.selectOne(NS+".findMember",aidx);
		return vo;
	}

	public AdminVO findByAdminEmail(String aemail) throws NotMemberException {
		ses = getSqlSession();
		AdminVO amember = ses.selectOne(NS + ".findByAdminEmail", aemail);
		return amember;
	}

	
}
