package service.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class FaqVO implements Serializable {
	
	
	private int fidx; //번호
	private String faq_up; //대제목
	private String faq_dw; //소제목
	private String contents; //내용
	private int faq_uptype; //번호
	
	
	public FaqVO() {
	
	}



	public FaqVO(int fidx, String faq_up, String faq_dw, String contents) {
		super();
		this.fidx = fidx;
		this.faq_up = faq_up;
		this.faq_dw = faq_dw;
		this.contents = contents;
	}



	public int getFaq_uptype() {
		return faq_uptype;
	}



	public void setFaq_uptype(int faq_uptype) {
		this.faq_uptype = faq_uptype;
	}



	public int getFidx() {
		return fidx;
	}



	public void setFidx(int fidx) {
		this.fidx = fidx;
	}



	public String getFaq_up() {
		return faq_up;
	}



	public void setFaq_up(String faq_up) {
		this.faq_up = faq_up;
	}



	public String getFaq_dw() {
		return faq_dw;
	}



	public void setFaq_dw(String faq_dw) {
		this.faq_dw = faq_dw;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}

	




}


