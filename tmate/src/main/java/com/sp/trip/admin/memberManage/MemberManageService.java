package com.sp.trip.admin.memberManage;

import java.util.List;
import java.util.Map;

public interface MemberManageService {
	// 호스트 전체 인원수(신청, 승인)
	public int dataCountHost(Map<String, Object> map);
	// 호스트 전치 리스트 
	public List<Member> listHost(Map<String, Object> map);
	// 호스트 상세 정보
	public Member readHost(String mhId);
	// 호스트 활성화/비활성화 변경
	public void updateHostEnabled(Map<String, Object> map) throws Exception;
	// 호스트 승인 완료 + 처리완료
	public void updateHostSign(Map<String, Object> map) throws Exception;
	// 호스트 승인 취소
	public void deleteHost(Map<String, Object> map) throws Exception;

}
