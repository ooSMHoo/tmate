package com.sp.trip.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.dao.CommonDAO;

@Service("room.roomService")
public class RoomServiceImpl implements RoomService {
	
	private final CommonDAO dao;
	private final FileManager fileManager;
	
	@Autowired
	public RoomServiceImpl(CommonDAO dao, FileManager fileManager) {
		this.dao = dao;
		this.fileManager = fileManager;
	}
	
	@Override
	public void insertRoom(Room room, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("room.roomSeq");
			room.setRoomNum(seq);
			
			if (room.getRoomOptionArr().length != 0) {
				room.setRoomOption(String.join(",", room.getRoomOptionArr()));
			}
			
			dao.insertData("room.insertRoom", room);
			
			if (!room.getSelectFile().isEmpty()) {
				for(MultipartFile mf : room.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					room.setrPhotoName(saveFilename);
					
					insertRoomPhoto(room);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void insertRoomPhoto(Room room) throws Exception {
		try {
			dao.insertData("room.insertRoomPhoto", room);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Room> readRoomlist(String userId) {
		List<Room> list = null;
		
		try {
			list = dao.selectList("room.readRoomList", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Room readRoom(int roomNum) {
		Room room = null;
		
		try {
			room = dao.selectOne("room.readRoom", roomNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return room;
	}
	
	@Override
	public List<Room> readRoomPhotolist(int roomNum) {
		List<Room> list = null;
		
		try {
			list = dao.selectList("room.readRoomPhotoList", roomNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Room readRoomPhotoFile(int rPhotoNum) {
		Room room = null;
		
		try {
			room = dao.selectOne("room.readRoomPhotoFile", rPhotoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return room;
	}

	@Override
	public String readRoomCategory(int rcNum) {
		String roomCategory = null;
		try {
			roomCategory = dao.selectOne("room.readRoomCategory", rcNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roomCategory;
	}
}
