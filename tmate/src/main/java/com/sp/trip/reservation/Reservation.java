package com.sp.trip.reservation;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Reservation {
	private String mhId;
	private int lcNum;
	private String ldgName;
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
	
	private List<MultipartFile> selectFile;
	
	private int fileNum;
	private String imageFilename;
	
	
	
	
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
		return ldgName;
	}
	public void setLdgName(String ldgName) {
		this.ldgName = ldgName;
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
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	
	
	
}
