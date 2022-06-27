package com.sp.trip.hostPage.yearStats;

import java.util.List;
import java.util.Map;

public interface YearStatsService {
	//예약총건
	public int ycountRestotal(Map<String, Object> map);
	//예약 총액
	public String ytotalPay(Map<String, Object> map);
	//취소총건
	public int ycountCancel(Map<String, Object> map);
	//취소총액
	public String ytotalpayCancel(Map<String, Object> map);
	
	public List<YearStats> lastyPaytotal(Map<String, Object> map);
	public List<YearStats> thisyPaytotal(Map<String, Object> map);
	public List<YearStats> lastyResCount(Map<String, Object> map);
	public List<YearStats> thisyResCount(Map<String, Object> map);
	public List<YearStats> totalASmonth(Map<String, Object> map);

}
