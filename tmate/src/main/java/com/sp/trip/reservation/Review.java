package com.sp.trip.reservation;

public class Review {
	private int revNum;
	private String memberId;
	private int resNum;
	private String revSubject;
	private String revContent;
	private int revGrade;
	private String revReg_date;
	private String resAnswer;
	private String lodgName;
	private String roomName;
	
	public int getRevNum() {
		return revNum;
	}
	public String getLodgName() {
		return lodgName;
	}
	public void setLodgName(String lodgName) {
		this.lodgName = lodgName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
	public String getRevSubject() {
		return revSubject;
	}
	public void setRevSubject(String revSubject) {
		this.revSubject = revSubject;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
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
	public String getResAnswer() {
		return resAnswer;
	}
	public void setResAnswer(String resAnswer) {
		this.resAnswer = resAnswer;
	}
}
