package com.sp.trip.hostPage.paymentList;

public class PaymentList {
	private int payCode; //결제수단
	private String payReg_date; //결제일시
	private int resCode; //결제상태
	private String resName; //결제자명
	private String resPhone; //전화번호
	private String resPoint; //포인트
	private String payNum; //승인번호
	private int payCost; //결제 금액
	
	private String roomName; // 룸이름
	private String mhId; //호스트 아이디 
	
	//디테일추가
	private int resTotalcost; //예약금액
	
	
	public int getPayCode() {
		return payCode;
	}
	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}
	public String getPayReg_date() {
		return payReg_date;
	}
	public void setPayReg_date(String payReg_date) {
		this.payReg_date = payReg_date;
	}
	public int getResCode() {
		return resCode;
	}
	public void setResCode(int resCode) {
		this.resCode = resCode;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResPhone() {
		return resPhone;
	}
	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}
	public String getResPoint() {
		return resPoint;
	}
	public void setResPoint(String resPoint) {
		this.resPoint = resPoint;
	}
	public int getPayCost() {
		return payCost;
	}
	public void setPayCost(int payCost) {
		this.payCost = payCost;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public int getResTotalcost() {
		return resTotalcost;
	}
	public void setResTotalcost(int resTotalcost) {
		this.resTotalcost = resTotalcost;
	}
	
	
}
