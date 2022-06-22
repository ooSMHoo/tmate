package com.sp.trip.reservation;

import java.util.List;
import java.util.Map;

public interface ReservationRoomService {
	public Lodging readLodging(String mhId);
	public List<Lodging> readLodgingPhotoList(String mhId);
	public List<Room> readCanReservationRoomList(Map<String, Object> map);
	public List<Room> readCanReservationRoomPhotoList(int roomNum);
}
