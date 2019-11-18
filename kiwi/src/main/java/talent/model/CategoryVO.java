package talent.model;

import java.io.Serializable;

public class CategoryVO implements Serializable {

	// UP 및 DOWN 카테고리 관련 변수 선언
	private int upcode;
	private int dwcode;
	private String upname;
	private String dwname;
	
	// 기본 생성자
	public CategoryVO() {
		super();
	}

	// 인자 생성자
	public CategoryVO(int upcode, int dwcode, String upname, String dwname) {
		super();
		this.upcode = upcode;
		this.dwcode = dwcode;
		this.upname = upname;
		this.dwname = dwname;
	}

	// Getters, Setters
	public int getUpcode() {return upcode;}
	public void setUpcode(int upcode) {this.upcode = upcode;}

	public int getdwcode() {return dwcode;}
	public void setdwcode(int dwcode) {this.dwcode = dwcode;}

	public String getUpname() {return upname;}
	public void setUpname(String upname) {this.upname = upname;}

	public String getDwname() {return dwname;}
	public void setDwname(String dwname) {this.dwname = dwname;}

	@Override
	public String toString() {
		return "CategoryVO [upcode=" + upcode + ", dwcode=" + dwcode + ", upname=" + upname + ", dwname="
				+ dwname + "]";
	}

}
