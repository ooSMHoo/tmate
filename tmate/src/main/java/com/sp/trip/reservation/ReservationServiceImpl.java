package com.sp.trip.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.dao.CommonDAO;

@Service("reservation.reservationServiceImpl")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reservation> listLodging(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation readAlbum(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reservation> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
