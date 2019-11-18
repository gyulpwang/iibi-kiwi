package talent.model;

import java.io.Serializable;
import java.sql.Date;

public class ReviewVO implements Serializable {
	private int		rnum;			// 글번호
	private int		midx;			// 회원번호
	private int		tnum;			// 재능번호
	private String	rtitle;			// 제목
	private String	rcontents;		// 내용
	private int		rscore;			// 평가점수
	private String	rwriter;		// 작성자
	private Date	wdate;			// 작성일
	
	public ReviewVO(){}
	
	public ReviewVO(int rnum, int midx, int tnum, String rtitle, 
			String rcontents, int rscore, String rwriter, Date wdate) {
		super();
		this.rnum = rnum;
		this.midx = midx;
		this.tnum = tnum;
		this.rtitle = rtitle;
		this.rcontents = rcontents;
		this.rscore = rscore;
		this.rwriter = rwriter;
		this.wdate = wdate;
	}
	
	public int getRnum() {return rnum;}
	public void setRnum(int rnum) {this.rnum = rnum;}
	
	public int getMidx() {return midx;}
	public void setMidx(int midx) {this.midx = midx;}
	
	public int getTnum() {return tnum;}
	public void setTnum(int tnum) {this.tnum = tnum;}
	
	public String getRtitle() {return rtitle;}
	public void setRtitle(String rtitle) {this.rtitle = rtitle;}
	
	public String getRcontents() {return rcontents;}
	public void setRcontents(String rcontents) {this.rcontents = rcontents;}
	
	public int getRscore() {return rscore;}
	public void setRscore(int rscore) {this.rscore = rscore;}
	
	public String getRwriter() {return rwriter;}
	public void setRwriter(String rwriter) {this.rwriter = rwriter;}
	
	public Date getWdate() {return wdate;}
	public void setWdate(Date wdate) {this.wdate = wdate;}

	@Override
	public String toString() {
		return "ReviewVO [rnum=" + rnum + ", midx=" + midx + ", tnum=" + tnum + ", rtitle=" + rtitle
				+ ", rcontents=" + rcontents + ", rscore=" + rscore + ", rwriter=" + rwriter + ", wdate=" + wdate + "]";
	}
}
