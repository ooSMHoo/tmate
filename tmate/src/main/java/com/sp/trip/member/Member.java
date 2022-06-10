package com.sp.trip.member;

public class Member {
	private String memberId;
	private String memberName;
	private String memberPwd;
	private String memberReg_date;
	private String memberMod_date;
	private int memberAuth;
	private int enabled;
	private String memberEmail;
	
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
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
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
