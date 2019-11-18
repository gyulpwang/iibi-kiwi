package admin.model;

import java.io.Serializable;

public class AdminVO implements Serializable{

	private Integer aidx;
	private String aemail;
	private String apwd;
	private String mname;
	
	public AdminVO(Integer aidx, String aemail, String apwd, String mname) {
		super();
		this.aidx = aidx;
		this.aemail = aemail;
		this.apwd = apwd;
		this.mname = mname;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public AdminVO(){
		
	}


	public Integer getAidx() {
		return aidx;
	}


	public void setAidx(Integer aidx) {
		this.aidx = aidx;
	}


	public String getAemail() {
		return aemail;
	}


	public void setAemail(String aemail) {
		this.aemail = aemail;
	}


	public String getApwd() {
		return apwd;
	}


	public void setApwd(String apwd) {
		this.apwd = apwd;
	}


	@Override
	public String toString() {
		return "AdminVO [aidx=" + aidx + ", aemail=" + aemail + ", apwd=" + apwd + ", mname=" + mname + "]";
	}



}