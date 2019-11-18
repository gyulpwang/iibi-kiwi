package service.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class QnaVO implements Serializable {
	
	
	private int qidx;
	private String title;
	private String qcate_cd;
	private String qcate_nm;
	private String contents;
	private String writer;
	private java.sql.Timestamp wdate;
	private String yn;
	private String clip;
	private int midx;
	private int aidx;
	
	
	public QnaVO(int qidx, String title, String qcate_cd, String qcate_nm, String contents, String writer,
			Timestamp wdate, String yn, String clip, int midx, int aidx) {
		super();
		this.qidx = qidx;
		this.title = title;
		this.qcate_cd = qcate_cd;
		this.qcate_nm = qcate_nm;
		this.contents = contents;
		this.writer = writer;
		this.wdate = wdate;
		this.yn = yn;
		this.clip = clip;
		this.midx = midx;
		this.aidx = aidx;
	}


	public int getQidx() {
		return qidx;
	}


	public void setQidx(int qidx) {
		this.qidx = qidx;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getQcate_cd() {
		return qcate_cd;
	}


	public void setQcate_cd(String qcate_cd) {
		this.qcate_cd = qcate_cd;
	}


	public String getQcate_nm() {
		return qcate_nm;
	}


	public void setQcate_nm(String qcate_nm) {
		this.qcate_nm = qcate_nm;
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


	public java.sql.Timestamp getWdate() {
		return wdate;
	}


	public void setWdate(java.sql.Timestamp wdate) {
		this.wdate = wdate;
	}


	public String getYn() {
		return yn;
	}


	public void setYn(String yn) {
		this.yn = yn;
	}


	public String getClip() {
		return clip;
	}


	public void setClip(String clip) {
		this.clip = clip;
	}


	public int getMidx() {
		return midx;
	}


	public void setMidx(int midx) {
		this.midx = midx;
	}


	public int getAidx() {
		return aidx;
	}


	public void setAidx(int aidx) {
		this.aidx = aidx;
	}


	@Override
	public String toString() {
		return "QnaVO [qidx=" + qidx + ", title=" + title + ", qcate_cd=" + qcate_cd + ", qcate_nm=" + qcate_nm
				+ ", contents=" + contents + ", writer=" + writer + ", wdate=" + wdate + ", yn=" + yn + ", clip=" + clip
				+ ", midx=" + midx + ", aidx=" + aidx + "]";
	}
	
	
	
	
	


}


