package talent.model;

import java.io.Serializable;
import java.sql.Date;

public class TalentVO implements Serializable {

	private int		tnum;
	private String	tname;
	private int		tprice;
	private String	timg;
	private int		tqty;
	private String	tspec;
	private int		tscore;
	private String	tcontents;
	private String	asnrefund;
	private Date	tindate;
	private String	workdate;
	private int		upcode;
	private int		dwcode;
	private int		midx;
	private String	seller;
	
	public TalentVO() {}

	public TalentVO(int tnum, String tname, int tprice, String timg, int tqty, String tspec, int tscore,
			String tcontents, String asnrefund, Date tindate, String workdate, int upcode, int dwcode, int midx,
			String seller) {
		super();
		this.tnum = tnum;
		this.tname = tname;
		this.tprice = tprice;
		this.timg = timg;
		this.tqty = tqty;
		this.tspec = tspec;
		this.tscore = tscore;
		this.tcontents = tcontents;
		this.asnrefund = asnrefund;
		this.tindate = tindate;
		this.workdate = workdate;
		this.upcode = upcode;
		this.dwcode = dwcode;
		this.midx = midx;
		this.seller = seller;
	}



	public int getTnum() {return tnum;}
	public void setTnum(int tnum) {this.tnum = tnum;}

	public String getTname() {return tname;}
	public void setTname(String tname) {this.tname = tname;}

	public int getTprice() {return tprice;}
	public void setTprice(int tprice) {this.tprice = tprice;}

	public String getTimg() {return timg;}
	public void setTimg(String timg) {this.timg = timg;}

	public int getTqty() {return tqty;}
	public void setTqty(int tqty) {this.tqty = tqty;}
	
	public String getTspec() {return tspec;}
	public void setTspec(String tspec) {this.tspec = tspec;}

	public int getTscore() {return tscore;}
	public void setTscore(int tscore) {this.tscore = tscore;}

	public String getTcontents() {return tcontents;}
	public void setTcontents(String tcontents) {this.tcontents = tcontents;}

	public String getAsnrefund() {return asnrefund;}
	public void setAsnrefund(String asnrefund) {this.asnrefund = asnrefund;}

	public Date getTindate() {return tindate;}
	public void setTindate(Date tindate) {this.tindate = tindate;}

	public String getWorkdate() {return workdate;}
	public void setWorkdate(String workdate) {this.workdate = workdate;}
	
	public int getUpcode() {return upcode;}
	public void setUpcode(int upcode) {this.upcode = upcode;}

	public int getDwcode() {return dwcode;}
	public void setDwcode(int dwcode) {this.dwcode = dwcode;}

	public int getMidx() {return midx;}
	public void setMidx(int midx) {this.midx = midx;}

	public String getSeller() {	return seller;}
	public void setSeller(String seller) {this.seller = seller;}

	@Override
	public String toString() {
		return "TalentVO [tnum=" + tnum + ", tname=" + tname + ", tprice=" + tprice + ", timg=" + timg + ", tqty="
				+ tqty + ", tspec=" + tspec + ", tscore=" + tscore + ", tcontents=" + tcontents + ", asnrefund="
				+ asnrefund + ", tindate=" + tindate + ", workdate=" + workdate + ", upcode=" + upcode + ", dwcode="
				+ dwcode + ", midx=" + midx + ", seller=" + seller + "]";
	}

}
