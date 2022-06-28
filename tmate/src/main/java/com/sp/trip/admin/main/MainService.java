package com.sp.trip.admin.main;

import java.util.List;
import java.util.Map;

import com.sp.trip.admin.memberManage.Member;

public interface MainService {
		// 호스트 전체 인원수(신청, 승인)
		public int dataCountHost(Map<String, Object> map);
		// 호스트 전체 리스트 
		public List<Member> listHost(Map<String, Object> map);
		// 호스트 상세 정보
		public Member readHost(String mhId);
		
		// 승인된 호스트 전체 수
		public int dataCountAllHost(Map<String, Object> map);				
		// 고객 전체
		public int dataCountAllMember(Map<String, Object> map);
		// 숙소 전체
		public int dataCountAllHouse(Map<String, Object> map);
		// 처리해야 할 신고 전체
		public int dataCountAllReport(Map<String, Object> map);
		
		// 그래프
		// 웝별 예약 건수
		public List<Integer> dailyReservation();
		// 별 예약 금액
		public List<Integer> dailyResTotal();
}
