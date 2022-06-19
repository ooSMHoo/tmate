package com.sp.trip.room;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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
	public List<Room> readRoomlist(Map<String, Object> map) {
		List<Room> list = null;
		
		try {
			list = dao.selectList("room.readRoomList", map);
			for(Room room : list) {
				room.setRoomCategory(dao.selectOne("room.readRoomCategory", room.getRcNum()));
			}
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

	@Override
	public void deleteRoomPhotoFile(int rPhotoNum) throws Exception {
		try {
			dao.deleteData("room.deleteRoomPhotoFile", rPhotoNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateRoom(Room room, String pathname) throws Exception {
		try {
			if (room.getRoomOptionArr().length != 0) {
				room.setRoomOption(String.join(",", room.getRoomOptionArr()));
			}
			
			dao.updateData("room.updateRoom", room);
			
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
	public void updateRoom(Room room, String pathname, String[] fileNum, String[] fileName) throws Exception {
		try {
			if (room.getRoomOptionArr().length != 0) {
				room.setRoomOption(String.join(",", room.getRoomOptionArr()));
			}
			
			dao.updateData("room.updateRoom", room);
			
			for(int i=0; i<fileNum.length; i++) {
				deleteRoomPhotoFile(Integer.parseInt(fileNum[i]));
				fileManager.doFileDelete(fileName[i], pathname);
			}
			
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
	public int roomCount(Map<String, Object> map) {
		int roomCount = 0;
		try {
			roomCount = dao.selectOne("room.roomCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roomCount;
	}

	@Override
	public void deleteRoom(int roomNum) throws Exception {
		try {
			dao.updateData("room.deleteRoom", roomNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void changeEnabled0(int roomNum) throws Exception {
		try {
			dao.updateData("room.changeEnabled0", roomNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void changeEnabled1(int roomNum) throws Exception {
		try {
			dao.updateData("room.changeEnabled1", roomNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public String isReservation(String mhId) {
		String reservedRoom = "";
		try {
			List<String> rooms = dao.selectList("room.isReservation", mhId);
			reservedRoom = StringUtils.join(rooms, ",");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservedRoom;
	}
}
