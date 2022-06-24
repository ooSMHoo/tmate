package com.sp.trip.review;
//r.roomNum, r.roomName, lodgName, resCout_date 
public class Review {
	private int revNum;
	private String memberId;
	private String resNum;
	private String resContent;
	private int revGrade;
	private String revReg_date;
	private String revAnswer;
	
	private String resCout_date;
	private int resCode;
	private String mhId;
	private int roomNum;
	private String roomName;
	private String lodgName;
	
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
	public String getLodgName() {
		return lodgName;
	}
	public void setLodgName(String lodgName) {
		this.lodgName = lodgName;
	}
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public int getRevNum() {
		return revNum;
	}
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getResNum() {
		return resNum;
	}
	public void setResNum(String resNum) {
		this.resNum = resNum;
	}
	public String getResContent() {
		return resContent;
	}
	public void setResContent(String resContent) {
		this.resContent = resContent;
	}
	public int getRevGrade() {
		return revGrade;
	}
	public void setRevGrade(int revGrade) {
		this.revGrade = revGrade;
	}
	public String getRevReg_date() {
		return revReg_date;
	}
	public void setRevReg_date(String revReg_date) {
		this.revReg_date = revReg_date;
	}
	public String getRevAnswer() {
		return revAnswer;
	}
	public void setRevAnswer(String revAnswer) {
		this.revAnswer = revAnswer;
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

}
