package com.sp.trip.mypage;

public class LikeList {
// 사진, 숙소이름, 평점, 가격, 지역
	private int rphotoName;
	private String lodgName;
	private int revGrade;
	private int roomWd_price; // 평일 요금
	private int roomSeasonprice; // 성수기 요금
	private String mhAddr1; 

	
	private String mhId;
	private int roomNum;
	private String roomName;
	
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRphotoName() {
		return rphotoName;
	}
	public void setRphotoName(int rphotoName) {
		this.rphotoName = rphotoName;
	}
	public String getLodgName() {
		return lodgName;
	}
	public void setLodgName(String lodgName) {
		this.lodgName = lodgName;
	}
	public int getRevGrade() {
		return revGrade;
	}
	public void setRevGrade(int revGrade) {
		this.revGrade = revGrade;
	}
	public int getRoomWd_price() {
		return roomWd_price;
	}
	public void setRoomWd_price(int roomWd_price) {
		this.roomWd_price = roomWd_price;
	}
	public int getRoomSeasonprice() {
		return roomSeasonprice;
	}
	public void setRoomSeasonprice(int roomSeasonprice) {
		this.roomSeasonprice = roomSeasonprice;
	}
	public String getMhAddr1() {
		return mhAddr1;
	}
	public void setMhAddr1(String mhAddr1) {
		this.mhAddr1 = mhAddr1;
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
	
	
	
	
}
