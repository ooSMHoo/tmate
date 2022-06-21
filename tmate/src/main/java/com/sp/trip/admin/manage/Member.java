package com.sp.trip.admin.manage;

public class Member {
	// member1 회원 테이블
	private int listNum;	// 테이블x 글 번호
	private String memberId;
	private String memberName;
	private String memberReg_date; // 회원 가입 일자
	private String memberMod_date; // 회원 정보 수정 일자
	private int memberAuth; // 회원 유형
	private int enabled; // 로그인 가능 여부(계정 사용 여부)
	private String memberEmail; // 멤버 이메일
	
	//member2 회원 테이블
	private String memberBirth; // 생년월일
	private String memberPhone; // 핸드폰번호
	
	
	
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
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
	public String getMemberReg_date() {
		return memberReg_date;
	}
	public void setMemberReg_date(String memberReg_date) {
		this.memberReg_date = memberReg_date;
	}
	public String getMemberMod_date() {
		return memberMod_date;
	}
	public void setMemberMod_date(String memberMod_date) {
		this.memberMod_date = memberMod_date;
	}
	public int getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(int memberAuth) {
		this.memberAuth = memberAuth;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	
}
