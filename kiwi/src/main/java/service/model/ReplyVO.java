package service.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ReplyVO implements Serializable {

	private Integer num;
	private String name;
	private String userid;
	private String content;
	private java.sql.Timestamp wdate;
	private Integer idx_fk;
	
	public ReplyVO(){
		
	}

	public ReplyVO(Integer num, String name, String userid, String content, Timestamp wdate, Integer idx_fk) {
		super();
		this.num = num;
		this.name = name;
		this.userid = userid;
		this.content = content;
		this.wdate = wdate;
		this.idx_fk = idx_fk;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Timestamp getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Timestamp wdate) {
		this.wdate = wdate;
	}

	public Integer getIdx_fk() {
		return idx_fk;
	}

	public void setIdx_fk(Integer idx_fk) {
		this.idx_fk = idx_fk;
	}

	@Override
	public String toString() {
		return "ReplyVO [num=" + num + ", name=" + name + ", userid=" + userid + ", content=" + content + ", wdate="
				+ wdate + ", idx_fk=" + idx_fk + "]";
	}
	
	
	
}/////////////////////////////////////
