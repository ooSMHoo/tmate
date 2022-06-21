package com.sp.trip.admin.manage;

import java.util.List;
import java.util.Map;

public interface MemberService {
	// 멤버 전체 인원수
	public int dataCountMember(Map<String, Object> map);
	// 멤버 전체 리스트
	public List<Member> listMember(Map<String, Object> map);
	// 멤버 상세 정보
	public Member readMember(String memberId);
	// 멤버 활동 변경
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
}
