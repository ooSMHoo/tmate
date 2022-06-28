package com.sp.trip.admin.report;

public class Member {
	private int listNum;
	
	// memberHost(호스트상세)
	private String mhId; // 호스트 아이디 기본키
	private String memberName;
	private int mhEnabled; // 호스트 활성화 여부 : 0활성화 1비활성화
	private String mhName; // 사업자명
	private String mhNum; // 사업자 번호
	private String mhPhone; // 전화번호
	private String mhZip; // 우편번호
	private String mhAddr1; // 주소1
	private String mhAddr2; // 주소2
	private String memberEmail;
	
	// hostReport(호스트신고)
	private String memberId; // 호스트를 신고한 아이디 / member1의 기본키
	private String hrSubject; // 신고제목
	private String hrContent; // 신고 내용
	private int hrCode; // 신고처리 여부. default 0. 완료 시 1.
		
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMhEnabled() {
		return mhEnabled;
	}
	public void setMhEnabled(int mhEnabled) {
		this.mhEnabled = mhEnabled;
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
	public String getMhZip() {
		return mhZip;
	}
	public void setMhZip(String mhZip) {
		this.mhZip = mhZip;
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
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getHrSubject() {
		return hrSubject;
	}
	public void setHrSubject(String hrSubject) {
		this.hrSubject = hrSubject;
	}
	public String getHrContent() {
		return hrContent;
	}
	public void setHrContent(String hrContent) {
		this.hrContent = hrContent;
	}
	public int getHrCode() {
		return hrCode;
	}
	public void setHrCode(int hrCode) {
		this.hrCode = hrCode;
	}
	
	
}
