package admin.model;

import member.model.NotMemberException;

public interface AdminDAO {

	public int adminEmailCheck(String aemail);

	public AdminVO isAdminLoginOK(String aemail, String apwd) throws NotMemberException;

	
	
	public AdminVO findAdminByIdx(Integer aidx);

	public AdminVO findByAdminEmail(String aemail) throws NotMemberException;

	
	
}
