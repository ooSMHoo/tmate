package com.sp.trip.hostPage.roomCal;

public class RoomCal {
	private String resCin_date; //입실날짜
	private String resCout_date; //퇴실날짜
	private int resCode; //예약상태
	private String resName; //예약자명
	private String roomName; // 객실이름
	private int enabled; //활성 비활성
	private String mhId; // 호스트아이디 
	private int roomNum;
	private int startDay;
	private int lastDay;
	private int endDay;
	private int period;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getStartDay() {
		return startDay;
	}
	public void setStartDay(int startDay) {
		this.startDay = startDay;
	}
	public int getLastDay() {
		return lastDay;
	}
	public void setLastDay(int lastDay) {
		this.lastDay = lastDay;
	}
	public int getEndDay() {
		return endDay;
	}
	public void setEndDay(int endDay) {
		this.endDay = endDay;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	
	
}
