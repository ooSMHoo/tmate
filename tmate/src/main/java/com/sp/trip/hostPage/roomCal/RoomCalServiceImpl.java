package com.sp.trip.hostPage.roomCal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("roomCal.RoomCalService")
public class RoomCalServiceImpl implements RoomCalService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<RoomCal> roomCalList(Map<String, Object> map) {
		List<RoomCal> list = null;
		
		try {
			list = dao.selectList("roomCal.roomCalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
