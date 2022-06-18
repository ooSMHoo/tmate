package com.sp.trip.reservationList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("reservationList.reservationListService")
public class ReservationListServiceImpl implements ReservationListService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ReservationList> readRev(String memberId) {
		List<ReservationList> list = null;
		
		try {
			list = dao.selectList("reservationList.revList", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
