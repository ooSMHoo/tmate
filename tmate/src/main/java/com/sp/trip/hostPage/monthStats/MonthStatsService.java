package com.sp.trip.hostPage.monthStats;

import java.util.List;
import java.util.Map;

public interface MonthStatsService {
	//예약 총건
	public int mcountRestotal(Map<String, Object> map);
	//입실 총건
	public int mcountCintotal(Map<String, Object> map);
	//예약 총금액
	public String mtotalPay(Map<String, Object> map);
	//취소 총건
	public int mcountCancel(Map<String, Object> map);
	//취소 총금액
	public String mtotalpayCancel(Map<String, Object> map);
	
	//통계
	//판매총금액
	public List<MonthStats> mselDetaile(Map<String, Object> map);
	//예약건수
	public List<MonthStats> mResCount(Map<String, Object> map);
	public List<MonthStats> totalASday(Map<String, Object> map);

}
