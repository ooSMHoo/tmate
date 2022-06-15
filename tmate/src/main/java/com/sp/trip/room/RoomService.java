package com.sp.trip.room;

import java.util.List;

public interface RoomService {	
	public void insertRoom(Room room, String pathname) throws Exception;
	public List<Room> readRoomlist(String userId);
	public Room readRoom(int roomNum);
	
	public void insertRoomPhoto(Room room) throws Exception;
	public List<Room> readRoomPhotolist(int roomNum);
	public Room readRoomPhotoFile(int rPhotoNum);
	public String readRoomCategory(int rcNum);
	public void deleteRoomPhotoFile(int rPhotoNum) throws Exception;
	public void updateRoom(Room room, String pathname) throws Exception;
	public void updateRoom(Room room, String pathname, String[] fileNum, String[] fileName) throws Exception;
}
