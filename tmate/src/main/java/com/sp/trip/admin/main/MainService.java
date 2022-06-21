package com.sp.trip.admin.main;

import java.util.List;
import java.util.Map;

import com.sp.trip.admin.memberManage.Member;

public interface MainService {
		// 호스트 전체 인원수(신청, 승인)
		public int dataCountHost(Map<String, Object> map);
		// 호스트 전치 리스트 
		public List<Member> listHost(Map<String, Object> map);
		// 호스트 상세 정보
		public Member readHost(String mhId);
		// 호스트 승인 변경
		public void updateHostSign(Map<String, Object> map) throws Exception;

}
