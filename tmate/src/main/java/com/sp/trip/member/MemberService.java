package com.sp.trip.member;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws Exception;
	
	public Member readMember(String userId);
}
