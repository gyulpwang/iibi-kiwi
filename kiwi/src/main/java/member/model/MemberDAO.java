package member.model;

import java.util.List;

public interface MemberDAO {

	/** 검색이나 로그인시 */
	public MemberVO findMemberByEmail(String email1) throws NotMemberException;

	/** 회원가입 */
	public int insertMember(MemberVO email1);

	public int emailCheck(String email);

	/** 로그인 처리 */
	public MemberVO isLoginOK(String email1, String pwd1) throws NotMemberException;

	/** 회원번호로 회원정보 가져오기 */
	public MemberVO findMemberByIdx(Integer idx);

	/** 회원정보로 회원번호 가져오기 */
	public MemberVO selectByMidx(int midx);

	/** 회원탈퇴 또는 회원정보 삭제 */
	public int deleteMember(Integer idx);

	/** 회원정보 수정 */
	public int updateMember(MemberVO member);

	/** 회원목록 가져오기 */
	public List<MemberVO> getAllMembers();

	/** 총 회원수 가져오기 */
	public int getTotalMember();

	/** 회원목록 가져오기-페이징 처리 */
	public List<MemberVO> getAllMembers(int start, int end);

	/** 회원정보 검색 */
	public List<MemberVO> findMember(String colType, String keyword);

	/** 회원정보 검색-검색한 결과 회원 수 */
	public int findMemberTotal(String colType, String keyword);

	/** 회원정보 검색-페이징 처리 */
	public List<MemberVO> findMember(String colType, String keyword, int start, int end);

	/** 회원 아이디 찾기 */
	public String findUserEmail(String mname, String email, String tel);

	public String findUserEmail1(String mname, String tel);

	/** 전문가 랭킹 */
	public List<MemberVO> getMrank();
}
