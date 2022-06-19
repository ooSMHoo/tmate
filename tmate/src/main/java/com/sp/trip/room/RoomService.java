package com.sp.trip.room;

import java.util.List;
import java.util.Map;

public interface RoomService {	
	public void insertRoom(Room room, String pathname) throws Exception;
	public List<Room> readRoomlist(Map<String, Object> map);
	public int roomCount(Map<String, Object> map);
	public Room readRoom(int roomNum);
	public String readRoomCategory(int rcNum);
	public void updateRoom(Room room, String pathname) throws Exception;
	public void updateRoom(Room room, String pathname, String[] fileNum, String[] fileName) throws Exception;
	public void deleteRoom(int roomNum) throws Exception;
	public void changeEnabled0(int roomNum) throws Exception;
	public void changeEnabled1(int roomNum) throws Exception;
	public String isReservation(String mhId);
	
	public void insertRoomPhoto(Room room) throws Exception;
	public List<Room> readRoomPhotolist(int roomNum);
	public Room readRoomPhotoFile(int rPhotoNum);
	public void deleteRoomPhotoFile(int rPhotoNum) throws Exception;
	
}
