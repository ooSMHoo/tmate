package com.sp.trip.reservationList;

import java.util.List;

public interface ReservationListService {
	
	public List<ReservationList> readRev(String memberId);
}
