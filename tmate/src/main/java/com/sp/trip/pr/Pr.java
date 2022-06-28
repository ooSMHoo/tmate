package com.sp.trip.pr;

import org.springframework.web.multipart.MultipartFile;

public class Pr {
	private int listNum;
	private int prNum;
	private String memberId;
	private String memberName;
	private String prSubject;
	private String prContent;
	private String prphotoName;
	private int prphotoNum;
	private String prReg_date;
	private MultipartFile selectFile;
	private int prHit;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getPrNum() {
		return prNum;
	}
	public void setPrNum(int prNum) {
		this.prNum = prNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPrSubject() {
		return prSubject;
	}
	public void setPrSubject(String prSubject) {
		this.prSubject = prSubject;
	}
	public String getPrContent() {
		return prContent;
	}
	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}
	public String getPrphotoName() {
		return prphotoName;
	}
	public void setPrphotoName(String prphotoName) {
		this.prphotoName = prphotoName;
	}
	public int getPrphotoNum() {
		return prphotoNum;
	}
	public void setPrphotoNum(int prphotoNum) {
		this.prphotoNum = prphotoNum;
	}
	public String getPrReg_date() {
		return prReg_date;
	}
	public void setPrReg_date(String prReg_date) {
		this.prReg_date = prReg_date;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public int getPrHit() {
		return prHit;
	}
	public void setPrHit(int prHit) {
		this.prHit = prHit;
	}

	
}
