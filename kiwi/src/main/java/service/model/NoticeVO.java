package service.model;

import java.io.Serializable;
import java.sql.Date;

public class NoticeVO implements Serializable {
	private int nidx;
	private String title;
	private String contents;
	private String writer;
	private java.sql.Date wdate;
	private int readnum;
	private String impt;
	private String clip;
	private int aidx;
	
	public NoticeVO(){
		
	}

	public NoticeVO(int nidx, String title, String contents, String writer, Date wdate, int readnum, String impt,
			String clip, int aidx) {
		super();
		this.nidx = nidx;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.wdate = wdate;
		this.readnum = readnum;
		this.impt = impt;
		this.clip = clip;
		this.aidx = aidx;
	}

	public int getNidx() {
		return nidx;
	}

	public void setNidx(int nidx) {
		this.nidx = nidx;
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

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public String getImpt() {
		return impt;
	}

	public void setImpt(String impt) {
		this.impt = impt;
	}

	public String getClip() {
		return clip;
	}

	public void setClip(String clip) {
		this.clip = clip;
	}

	public int getAidx() {
		return aidx;
	}

	public void setAidx(int aidx) {
		this.aidx = aidx;
	}

	@Override
	public String toString() {
		return "NoticeVO [nidx=" + nidx + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", wdate=" + wdate + ", readnum=" + readnum + ", impt=" + impt + ", clip=" + clip + ", aidx=" + aidx
				+ "]";
	}
	
	
	

}
