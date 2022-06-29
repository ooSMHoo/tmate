package com.sp.trip.reservation;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public int dataCount(Map<String, Object> map);
	
	public List<Reservation> listLodging(Map<String, Object> map);
			
	public int readPoint(String memberId);
	
	public void insertRefund(Reservation dto) throws Exception;
	
	public void insertReservation(Reservation dto) throws Exception;
	
	public Reservation readReservation(int resNum);
	
	public Reservation readPay(Map<String, Object> map);
	
	public int maxValue(Map<String, Object> map);
	
	public void insertLikeList(Map<String, Object> map) throws Exception;
	
	public void deleteLikeList(Map<String, Object> map) throws Exception;
	
	public List<String> readLikeList(String memberId);
}