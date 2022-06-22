package com.sp.trip.reservationList;

import java.util.List;
import java.util.Map;

public interface ReservationListService {
	
	
	public List<ReservationList> listRev(Map<String, Object>map);
	public int dataCount(Map<String, Object> map);
	
	public ReservationInfo readRevInfo(Map<String, Object>map);

}
