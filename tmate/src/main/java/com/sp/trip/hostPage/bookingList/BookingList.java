package com.sp.trip.hostPage.bookingList;

public class BookingList {
	//예약
	private int resNum; //예약번호
	private String memberId;
	private String resCin_date; //입실일자
	private String resCout_date; //퇴실일자
	private String resReg_date; //예약일자 
	private int resCode; //예약상태 - 예약완료, 호스트취소, 고객취소, 환불
	private String resName; //예약자이름
	private String resPhone; //예약자 연락처
	private int resTotalcost; //총금액
	private int resPoint; //포인트 사용금액
	private int mhId; //호스트 아이디 
	
	//room
	private int roomNum; //객실번호
	private String roomName; //객실이름
	private String memberEmail; //이메일
	private String hostMemo;


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

	public int getResTotalcost() {
		return resTotalcost;
	}

	public void setResTotalcost(int resTotalcost) {
		this.resTotalcost = resTotalcost;
	}

	public int getResPoint() {
		return resPoint;
	}

	public void setResPoint(int resPoint) {
		this.resPoint = resPoint;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getMhId() {
		return mhId;
	}

	public void setMhId(int mhId) {
		this.mhId = mhId;
	}

	public String getResReg_date() {
		return resReg_date;
	}

	public void setResReg_date(String resReg_date) {
		this.resReg_date = resReg_date;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getHostMemo() {
		return hostMemo;
	}

	public void setHostMemo(String hostMemo) {
		this.hostMemo = hostMemo;
	}

	
	//만약 호스트가 관리중에 예약자에 대해 개인적인 메모를 하고 싶다면..?
}
