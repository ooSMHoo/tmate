package com.sp.trip.admin.report;

import java.util.List;
import java.util.Map;

public interface MemberReportService {
		// 호스트 전체 인원수(신청, 승인)
		public int dataCountHost(Map<String, Object> map);
		// 호스트 전체 리스트 
		public List<Member> listHost(Map<String, Object> map);
		// 호스트 활성화/비활성화 변경
		public void updateHostEnabled(Map<String, Object> map) throws Exception;
		// 신고 처리 대기/완료 변경
		public void updateHrCode(Map<String, Object> map) throws Exception;
}
