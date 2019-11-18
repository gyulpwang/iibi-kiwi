package help.model;

import java.sql.Date;

public class SuggestVO {
	
	private Integer no;
	private Integer helpidx;
	private String email;
	private String name;
	private String contents;
	private String workdate;
	private String price;
	private java.sql.Date wdate;
	private String smode;
	private int midx;
	
	public SuggestVO(){
		
	}

	public SuggestVO(Integer no, Integer helpidx, String email, String name, String contents, String workdate,
			String price, Date wdate, String smode, int midx) {
		super();
		this.no = no;
		this.helpidx = helpidx;
		this.email = email;
		this.name = name;
		this.contents = contents;
		this.workdate = workdate;
		this.price = price;
		this.wdate = wdate;
		this.smode = smode;
		this.midx = midx;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getHelpidx() {
		return helpidx;
	}

	public void setHelpidx(Integer helpidx) {
		this.helpidx = helpidx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWorkdate() {
		return workdate;
	}

	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}

	public String getSmode() {
		return smode;
	}

	public void setSmode(String smode) {
		this.smode = smode;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	@Override
	public String toString() {
		return "SuggestVO [no=" + no + ", helpidx=" + helpidx + ", email=" + email + ", name=" + name + ", contents="
				+ contents + ", workdate=" + workdate + ", price=" + price + ", wdate=" + wdate + ", smode=" + smode
				+ ", midx=" + midx + "]";
	}

	
	
	

}
