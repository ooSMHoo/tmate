package com.sp.trip.hostPage;

import java.util.List;
import java.util.Map;

public interface HostPageService {
	//객실개수
	public int countTotalRoom(Map<String, Object> map);
	public int countResRoom(Map<String, Object> map);
	
	public List<HostPage> todayRes(Map<String, Object> map);
	public int todayResOk(Map<String, Object> map);
	public int todayCancel(Map<String, Object> map);
	
	public String todayPay(Map<String, Object> map);
	public String todayrCinPay(Map<String, Object> map);
}
