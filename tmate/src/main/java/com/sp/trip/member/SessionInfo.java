package com.sp.trip.member;

// 세션에 저장할 정보(아이디, 이름, 권한 등)
public class SessionInfo {
	private String userId;
	private String userName;
	private int membership;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
	
}
