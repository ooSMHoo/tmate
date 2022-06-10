package com.sp.trip.host;

public class Host {
	private String mhId;
	private String mhName;
	private String mhNum;
	private String mhPhone;
	private String mhPhone1;
	private String mhPhone2;
	private String mhPhone3;
	private String mhAddr1; //기본주소
	private String mhAddr2; //상세주소
	private int mhZip; // 우편번호
	private String mhAc_name; // 예금주
	private int bankNum;
	private String mhAc_num;
	private int enabled; //비활성화여부
	private int mhsign; //승인여부
	
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public String getMhName() {
		return mhName;
	}
	public void setMhName(String mhName) {
		this.mhName = mhName;
	}
	public String getMhNum() {
		return mhNum;
	}
	public void setMhNum(String mhNum) {
		this.mhNum = mhNum;
	}
	public String getMhPhone() {
		return mhPhone;
	}
	public void setMhPhone(String mhPhone) {
		this.mhPhone = mhPhone;
	}
	public String getMhPhone1() {
		return mhPhone1;
	}
	public void setMhPhone1(String mhPhone1) {
		this.mhPhone1 = mhPhone1;
	}
	public String getMhPhone2() {
		return mhPhone2;
	}
	public void setMhPhone2(String mhPhone2) {
		this.mhPhone2 = mhPhone2;
	}
	public String getMhPhone3() {
		return mhPhone3;
	}
	public void setMhPhone3(String mhPhone3) {
		this.mhPhone3 = mhPhone3;
	}
	public String getMhAddr1() {
		return mhAddr1;
	}
	public void setMhAddr1(String mhAddr1) {
		this.mhAddr1 = mhAddr1;
	}
	public String getMhAddr2() {
		return mhAddr2;
	}
	public void setMhAddr2(String mhAddr2) {
		this.mhAddr2 = mhAddr2;
	}
	public int getMhZip() {
		return mhZip;
	}
	public void setMhZip(int mhZip) {
		this.mhZip = mhZip;
	}
	public String getMhAc_name() {
		return mhAc_name;
	}
	public void setMhAc_name(String mhAc_name) {
		this.mhAc_name = mhAc_name;
	}
	public int getBankNum() {
		return bankNum;
	}
	public void setBankNum(int bankNum) {
		this.bankNum = bankNum;
	}
	public String getMhAc_num() {
		return mhAc_num;
	}
	public void setMhAc_num(String mhAc_num) {
		this.mhAc_num = mhAc_num;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getMhsign() {
		return mhsign;
	}
	public void setMhsign(int mhsign) {
		this.mhsign = mhsign;
	}
}
