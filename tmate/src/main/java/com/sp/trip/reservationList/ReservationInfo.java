package com.sp.trip.reservationList;

public class ReservationInfo {
	//resCin_date, resCout_date, rd.resNum, memberId, resTotalCost, resPoint
	private String resCin_date;
	private String resCout_date;
	private int resNum;
	private String memberId;
	private int resTotalCost;
	private int resCode;
	private String memberName;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getResCode() {
		return resCode;
	}
	public void setResCode(int resCode) {
		this.resCode = resCode;
	}
	public String getResCin_date() {
		return resCin_date;
	}
	public void setResCin_date(String resCin_date) {
		this.resCin_date = resCin_date;
	}
	public String getResCout_date() {
		return resCout_date;
	}
	public void setResCout_date(String resCout_date) {
		this.resCout_date = resCout_date;
	}
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getResTotalCost() {
		return resTotalCost;
	}
	public void setResTotalCost(int resTotalCost) {
		this.resTotalCost = resTotalCost;
	}
 
}
