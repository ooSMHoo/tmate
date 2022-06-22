package com.sp.trip.reservationList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("reservationList.reservationListService")
public class ReservationListServiceImpl implements ReservationListService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ReservationList> listRev(Map<String, Object> map) {
		List<ReservationList> list = null;
		
		try {
			list = dao.selectList("reservationList.listRev", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ReservationInfo readRevInfo(Map<String, Object> map) {
		ReservationInfo dto = null;
		try {
			dto = dao.selectOne("reservationList.revInfoList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("reservationList.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}



	

	
}
