package help.model;

import java.io.Serializable;
import java.sql.Date;
public class HelpVO {
	
	private Integer helpidx;
	private String title;
	private String contents;
	private String writer;
	private String hprice;
	private java.sql.Date edate;
	private int midx;
	private int upcode;
	private int dwcode; 
	private String hmode;
	
	
	public HelpVO(){
		
	}


	public HelpVO(Integer helpidx, String title, String contents, String writer, String hprice, Date edate, int midx,
			int upcode, int dwcode, String hmode) {
		super();
		this.helpidx = helpidx;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.hprice = hprice;
		this.edate = edate;
		this.midx = midx;
		this.upcode = upcode;
		this.dwcode = dwcode;
		this.hmode = hmode;
	}


	public Integer getHelpidx() {
		return helpidx;
	}


	public void setHelpidx(Integer helpidx) {
		this.helpidx = helpidx;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getHprice() {
		return hprice;
	}


	public void setHprice(String hprice) {
		this.hprice = hprice;
	}


	public java.sql.Date getEdate() {
		return edate;
	}


	public void setEdate(java.sql.Date edate) {
		this.edate = edate;
	}


	public int getMidx() {
		return midx;
	}


	public void setMidx(int midx) {
		this.midx = midx;
	}


	public int getUpcode() {
		return upcode;
	}


	public void setUpcode(int upcode) {
		this.upcode = upcode;
	}


	public int getDwcode() {
		return dwcode;
	}


	public void setDwcode(int dwcode) {
		this.dwcode = dwcode;
	}


	public String getHmode() {
		return hmode;
	}


	public void setHmode(String hmode) {
		this.hmode = hmode;
	}


	@Override
	public String toString() {
		return "HelpVO [helpidx=" + helpidx + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", hprice=" + hprice + ", edate=" + edate + ", midx=" + midx + ", upcode=" + upcode + ", dwcode="
				+ dwcode + ", hmode=" + hmode + "]";
	}

	
	
}
