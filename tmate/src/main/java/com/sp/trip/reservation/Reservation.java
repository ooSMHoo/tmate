package com.sp.trip.reservation;

public class Reservation {
	
	private String mhId;
	private String memeberId;
	private int lcNum;
	private String lodgName;
	private double lodgLat;
	private double lodgLon;
	private String lodgContent1;
	private String lodgContent2;
	private String lodgStart_date;
	private String lodgEnd_date;
	private String lodgPageaddr;
	private String lodgCin_time;
	private String lodgCout_time;
	private String lodgOption;
	private String[] lodgOptionArr;
	
	private int reviewCount;
	private double reviewGrade;
	private double percent;
	
	private String mhAddr1;
	
	private int roomNum;
	private String roomName;
	private int roomMax_people;
	private int roomPrice;
	private String roomOption;
	private String[] roomOptionArr;
	private int roomBed;
	
	private int minPrice;
	private int maxPrice;
	
	private String lPhotoName;
	
	private int resNum;
	private String resCin_date;
	private String resCout_date;
	private String resName;
	private String resPhone;
	
	private String isLiked;
	
	private int payNum;
	
	private int night;
	private int totalPrice;
	
	
	

	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getNight() {
		return night;
	}
	public void setNight(int night) {
		this.night = night;
	}
	public String getMemeberId() {
		return memeberId;
	}
	public void setMemeberId(String memeberId) {
		this.memeberId = memeberId;
	}
	public String getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(String isLiked) {
		this.isLiked = isLiked;
	}
	public String getMhAddr1() {
		return mhAddr1;
	}
	public void setMhAddr1(String mhAddr1) {
		this.mhAddr1 = mhAddr1;
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
	public int getRoomMax_people() {
		return roomMax_people;
	}
	public void setRoomMax_people(int roomMax_people) {
		this.roomMax_people = roomMax_people;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getRoomOption() {
		return roomOption;
	}
	public void setRoomOption(String roomOption) {
		this.roomOption = roomOption;
	}
	public int getRoomBed() {
		return roomBed;
	}
	public void setRoomBed(int roomBed) {
		this.roomBed = roomBed;
	}
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public int getLcNum() {
		return lcNum;
	}
	public void setLcNum(int lcNum) {
		this.lcNum = lcNum;
	}
	public String getLdgName() {
		return lodgName;
	}
	public void setLdgName(String ldgName) {
		this.lodgName = ldgName;
	}
	public double getLodgLat() {
		return lodgLat;
	}
	public void setLodgLat(double lodgLat) {
		this.lodgLat = lodgLat;
	}
	public double getLodgLon() {
		return lodgLon;
	}
	public void setLodgLon(double lodgLon) {
		this.lodgLon = lodgLon;
	}
	public String getLodgContent1() {
		return lodgContent1;
	}
	public void setLodgContent1(String lodgContent1) {
		this.lodgContent1 = lodgContent1;
	}
	public String getLodgContent2() {
		return lodgContent2;
	}
	public void setLodgContent2(String lodgContent2) {
		this.lodgContent2 = lodgContent2;
	}
	public String getLodgStart_date() {
		return lodgStart_date;
	}
	public void setLodgStart_date(String lodgStart_date) {
		this.lodgStart_date = lodgStart_date;
	}
	public String getLodgEnd_date() {
		return lodgEnd_date;
	}
	public void setLodgEnd_date(String lodgEnd_date) {
		this.lodgEnd_date = lodgEnd_date;
	}
	public String getLodgPageaddr() {
		return lodgPageaddr;
	}
	public void setLodgPageaddr(String lodgPageaddr) {
		this.lodgPageaddr = lodgPageaddr;
	}
	public String getLodgCin_time() {
		return lodgCin_time;
	}
	public void setLodgCin_time(String lodgCin_time) {
		this.lodgCin_time = lodgCin_time;
	}
	public String getLodgCout_time() {
		return lodgCout_time;
	}
	public void setLodgCout_time(String lodgCout_time) {
		this.lodgCout_time = lodgCout_time;
	}
	public String getLodgOption() {
		return lodgOption;
	}
	public void setLodgOption(String lodgOption) {
		this.lodgOption = lodgOption;
	}
	public String getLodgName() {
		return lodgName;
	}
	public void setLodgName(String lodgName) {
		this.lodgName = lodgName;
	}
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
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
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public double getReviewGrade() {
		return reviewGrade;
	}
	public void setReviewGrade(double reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public double getPercent() {
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	public String[] getLodgOptionArr() {
		return lodgOptionArr;
	}
	public void setLodgOptionArr(String[] lodgOptionArr) {
		this.lodgOptionArr = lodgOptionArr;
	}
	public String[] getRoomOptionArr() {
		return roomOptionArr;
	}
	public void setRoomOptionArr(String[] roomOptionArr) {
		this.roomOptionArr = roomOptionArr;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getlPhotoName() {
		return lPhotoName;
	}
	public void setlPhotoName(String lPhotoName) {
		this.lPhotoName = lPhotoName;
	}
	
	
	
}
