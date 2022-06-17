package com.sp.trip.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	
	private int listNum;
	private int noticeNum; 
	private String noticeSubject; // 제목
	private String noticeContent; // 내용
	private String noticeReg_date; // 작성 날짜
	private int noticeHit; // 조회수
	private String memberId;
	
	private int nfileNum;
	private String nfileOri_name;
	private String nfileSav_name;
	private long nfileSize;
	private int fileCount;
	
	private List<MultipartFile> selectFile;
	
	
	
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	
	
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeSubject() {
		return noticeSubject;
	}
	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeReg_date() {
		return noticeReg_date;
	}
	public void setNoticeReg_date(String noticeReg_date) {
		this.noticeReg_date = noticeReg_date;
	}
	public int getNoticeHit() {
		return noticeHit;
	}
	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getNfileNum() {
		return nfileNum;
	}
	public void setNfileNum(int nfileNum) {
		this.nfileNum = nfileNum;
	}
	public String getNfileOri_name() {
		return nfileOri_name;
	}
	public void setNfileOri_name(String nfileOri_name) {
		this.nfileOri_name = nfileOri_name;
	}
	public String getNfileSav_name() {
		return nfileSav_name;
	}
	public void setNfileSav_name(String nfileSav_name) {
		this.nfileSav_name = nfileSav_name;
	}
	public long getNfileSize() {
		return nfileSize;
	}
	public void setNfileSize(long nfileSize) {
		this.nfileSize = nfileSize;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	

}
