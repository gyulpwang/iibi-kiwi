package member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("memberDAOMyBatis")
public class MemberDAOMyBatis extends SqlSessionDaoSupport implements MemberDAO{

	private final String NS = "member.model.MemberMapper";
	private SqlSession ses;
	
	@Resource(name = "sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}


	public int insertMember(MemberVO member) {
		ses=this.getSqlSession();
		int n = ses.insert(NS +".insertMember",member);
		return n;
	}//-----------------------------------------

	public int emailCheck(String email) {
		Integer n = this.getSqlSession().selectOne(NS+".emailCheck",email);
		if(n==null){
			return 1;
		}else{
			return 0;
		}
	}


	public MemberVO isLoginOK(String email1, String pwd1) throws NotMemberException {
		MemberVO member = this.findMemberByEmail(email1);
		if(member==null){
			throw new NotMemberException(email1+"는 존재하지 않습니다.");
		}
		if(!pwd1.equals(member.getPwd())){
			throw new NotMemberException("비밀번호가 틀려요");
		}
		return member;
	}


	public MemberVO findMemberByEmail(String email1) throws NotMemberException {
		ses=getSqlSession();
		MemberVO member = ses.selectOne(NS+".findMemberByEmail",email1);
		return member;
	}

	public MemberVO selectByMidx(int midx){
		ses=this.getSqlSession();
		MemberVO member = ses.selectOne(NS+".selectByMidx", midx);
		
		return member;
	}

	public int updateMember(MemberVO member) {
		ses=this.getSqlSession();
		int n=ses.update(NS+".updateMember",member);
		return n;
	}

	public List<MemberVO> getAllMembers() {
		ses=this.getSqlSession();
		List<MemberVO> arr=ses.selectList(NS+".listMember");
		return arr;
	}//---------------------------
	public List<MemberVO> getAllMembers(int start, int end) {
		ses=this.getSqlSession();		
		Map<String,Integer> map
		=new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end",end);
		List<MemberVO> arr
		=ses.selectList(NS+".listMemberPaging",map);
		return arr;
	}//---------------------------
	public int getTotalMember() {
		ses=this.getSqlSession();
		int total=ses.selectOne(NS+".totalCount");
		return total;
	}//---------------------------

	public MemberVO findMemberByUserid(String email) 
			throws NotMemberException {
		ses=getSqlSession();
		MemberVO member
		=ses.selectOne(NS+".findMemberByUserid", email);
		return member;
	}//---------------------------
	


	public int deleteMember(Integer idx) {
		ses=this.getSqlSession();
		int n=ses.delete(NS+".deleteMember",idx);
		return n;
	}
	public List<MemberVO> findMember(String colType, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}


	public int findMemberTotal(String colType,
			String keyword) {
		ses=this.getSqlSession();
		Map<String, String> map
		=new HashMap<String, String>();
		map.put("findType",colType);
		//colType값=>컬럼명(name, userid,addr1,email) 
		map.put("findKeyword",keyword);
		int total=ses.selectOne(NS+".findMemberTotal",map);
		return total;
	}

	public List<MemberVO> findMember(String colType, 
			String keyword, int start, int end) {
		Map<String, String> map
		=new HashMap<String, String>();
		map.put("findType",colType);
		map.put("findKeyword",keyword);
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		ses=this.getSqlSession();
		List<MemberVO> arr
		=ses.selectList(NS+".findMemberPaging",map);
		return arr;
	}
	/**회원 아이디 찾기*/

public String findUserEmail(String mname, String email,String tel) {

		ses=this.getSqlSession();

		Map<String, String> map=new HashMap<String, String>();

		map.put("mname", mname);
		map.put("email", email);
		map.put("tel", tel);

		String member=ses.selectOne(NS+".findUserEmail",map);
		return member;
	}


	public MemberVO findMemberByIdx(Integer idx) {
		ses=this.getSqlSession();
		MemberVO vo=ses.selectOne(NS+".findMember",idx);
		return vo;
	}
	
	public String findUserEmail1(String mname, String tel) {

		ses=this.getSqlSession();

		Map<String, String> map=new HashMap<String, String>();

		map.put("mname", mname);
		
		map.put("tel", tel);
		
		String member=ses.selectOne(NS+".findUserEmail1",map);
		return member;
	}
	
	 /** 전문가 랭킹 */
	   public List<MemberVO> getMrank(){
	      return getSqlSession().selectList(NS+".getMrank"); 
	   }
}






