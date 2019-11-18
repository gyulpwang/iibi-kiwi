package talent.model;

import java.sql.Date;

public class OrderVO {

	// orderDesc와 관련된 프로퍼티 선언
	private int onum;						// 주문번호
	private int midx;						// 주문자 회원번호
	private int tnum;						// 주문하려는 재능번호
	private String oname;					// 주문자 이름
	private String otalent;					// 주문 재능명
	private int oqty;						// 주문재능수량
	private int ototalprice;				// 주문총금액
	private String opaystate;				// 지불상태
	private Date orderdate;					// 주문일
	private String ordermemo;				// 요청사항
	private String yn;						// 완료여부
	private int paymethod;					/* 지불방법
											(311:무통장입금 => opaystate:미지불, 
											 312:카드결제 => opaystate:결제완료) */
	
	public OrderVO(){}
	
	public OrderVO(int onum, int midx, int tnum, String oname, String otalent, int oqty, int ototalprice,
			String opaystate, Date orderdate, String ordermemo, String yn, int paymethod) {
		super();
		this.onum = onum;
		this.midx = midx;
		this.tnum = tnum;
		this.oname = oname;
		this.otalent = otalent;
		this.oqty = oqty;
		this.ototalprice = ototalprice;
		this.opaystate = opaystate;
		this.orderdate = orderdate;
		this.ordermemo = ordermemo;
		this.yn = yn;
		this.paymethod = paymethod;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getTnum() {
		return tnum;
	}

	public void setTnum(int tnum) {
		this.tnum = tnum;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOtalent() {
		return otalent;
	}

	public void setOtalent(String otalent) {
		this.otalent = otalent;
	}

	public int getOqty() {
		return oqty;
	}

	public void setOqty(int oqty) {
		this.oqty = oqty;
	}

	public int getOtotalprice() {
		return ototalprice;
	}

	public void setOtotalprice(int ototalprice) {
		this.ototalprice = ototalprice;
	}

	public String getOpaystate() {
		return opaystate;
	}

	public void setOpaystate(String opaystate) {
		this.opaystate = opaystate;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getOrdermemo() {
		return ordermemo;
	}

	public void setOrdermemo(String ordermemo) {
		this.ordermemo = ordermemo;
	}

	public String getYn() {
		return yn;
	}

	public void setYn(String yn) {
		this.yn = yn;
	}

	public int getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(int paymethod) {
		this.paymethod = paymethod;
	}

	@Override
	public String toString() {
		return "OrderVO [onum=" + onum + ", midx=" + midx + ", tnum=" + tnum + ", oname=" + oname + ", otalent="
				+ otalent + ", oqty=" + oqty + ", ototalprice=" + ototalprice + ", opaystate=" + opaystate
				+ ", orderdate=" + orderdate + ", ordermemo=" + ordermemo + ", yn=" + yn + ", paymethod=" + paymethod
				+ "]";
	}
	
}
