package com.sp.trip.reservation;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public int dataCount(Map<String, Object> map);
	public List<Reservation> listLodging(Map<String, Object> map);
	
	public Reservation readAlbum(int num);
	
	public List<Reservation> listFile(int num);
	public Reservation readFile(int fileNum);
}
