package member.model;
import java.io.Serializable; 

public class MemberVO {

	private Integer midx;
	private String email;
	private String pwd;
	private String mname;
	private String tel;
	private String grade;
	private int sell;
	private int buy;
	private int netprofit;
	
	public MemberVO(){
		
	}

	public MemberVO(Integer midx, String email, String pwd, String mname, String tel, String grade, int sell, int buy,
			int netprofit) {
		super();
		this.midx = midx;
		this.email = email;
		this.pwd = pwd;
		this.mname = mname;
		this.tel = tel;
		this.grade = grade;
		this.sell = sell;
		this.buy = buy;
		this.netprofit = netprofit;
	}

	public Integer getMidx() {
		return midx;
	}

	public void setMidx(Integer midx) {
		this.midx = midx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getSell() {
		return sell;
	}

	public void setSell(int sell) {
		this.sell = sell;
	}

	public int getBuy() {
		return buy;
	}

	public void setBuy(int buy) {
		this.buy = buy;
	}

	public int getNetprofit() {
		return netprofit;
	}

	public void setNetprofit(int netprofit) {
		this.netprofit = netprofit;
	}

	@Override
	public String toString() {
		return "MemberVO [midx=" + midx + ", email=" + email + ", pwd=" + pwd + ", mname=" + mname + ", tel=" + tel
				+ ", grade=" + grade + ", sell=" + sell + ", buy=" + buy + ", netprofit=" + netprofit + "]";
	}

	
	
}/////////////////////////////////////////////////