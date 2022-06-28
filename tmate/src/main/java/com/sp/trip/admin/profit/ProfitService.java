package com.sp.trip.admin.profit;

import java.util.List;

public interface ProfitService {
	// 첫 번째 그래프
	public List<Integer> dataCountCustomer();	
	public List<Integer> dataCountHost();
	
	// 두 번째 그래프
	public List<Integer> dataCountReservation();	
	public List<Integer> dataResTotal();

}
