package com.sp.trip.admin.memberManage;

public class Member {
	
	private int listNum; // notice list처럼 게시판번호(table x)
	
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
	private int mhSign; // 승인 여부
			
	// 호스트 승인
	private String memberId; // 호스트를 신고한 아이디 / member1의 기본키
	private int memberAuth;
	
	
	public int getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(int memberAuth) {
		this.memberAuth = memberAuth;
	}
	
	
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
	public int getMhSign() {
		return mhSign;
	}
	public void setMhSign(int mhSign) {
		this.mhSign = mhSign;
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
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
}
