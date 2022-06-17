package com.sp.trip.lodging;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Lodging {
	private String mhId;
	private int lcNum; //숙소유형번호
	private String lodgName;
	private String lodgLat; //위도
	private String lodgLon; //경도
	private String lodgContent1; //숙소이용규칙
	private String lodgContent2; //기타확인사항
	private String lodgStart_date;
	private String start_month;
	private String start_day;
	private String lodgEnd_date;
	private String end_month;
	private String end_day;
	private String lodgPageAddr;
	private String lodgCin_time;
	private String lodgCout_time;
	private String[] lodgOptionArr;
	private String lodgOption;
	private int enabled;
	
	private List<MultipartFile> selectFile;
	private int lPhotoNum;
	private String lPhotoName;
	
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
	public String getLodgName() {
		return lodgName;
	}
	public void setLodgName(String lodgName) {
		this.lodgName = lodgName;
	}
	public String getLodgLat() {
		return lodgLat;
	}
	public void setLodgLat(String lodgLat) {
		this.lodgLat = lodgLat;
	}
	public String getLodgLon() {
		return lodgLon;
	}
	public void setLodgLon(String lodgLon) {
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
	public String getStart_month() {
		return start_month;
	}
	public void setStart_month(String start_month) {
		this.start_month = start_month;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getLodgEnd_date() {
		return lodgEnd_date;
	}
	public void setLodgEnd_date(String lodgEnd_date) {
		this.lodgEnd_date = lodgEnd_date;
	}
	public String getEnd_month() {
		return end_month;
	}
	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public String getLodgPageAddr() {
		return lodgPageAddr;
	}
	public void setLodgPageAddr(String lodgPageAddr) {
		this.lodgPageAddr = lodgPageAddr;
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
	public String[] getLodgOptionArr() {
		return lodgOptionArr;
	}
	public void setLodgOptionArr(String[] lodgOptionArr) {
		this.lodgOptionArr = lodgOptionArr;
	}
	public String getLodgOption() {
		return lodgOption;
	}
	public void setLodgOption(String lodgOption) {
		this.lodgOption = lodgOption;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public int getlPhotoNum() {
		return lPhotoNum;
	}
	public void setlPhotoNum(int lPhotoNum) {
		this.lPhotoNum = lPhotoNum;
	}
	public String getlPhotoName() {
		return lPhotoName;
	}
	public void setlPhotoName(String lPhotoName) {
		this.lPhotoName = lPhotoName;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
}
