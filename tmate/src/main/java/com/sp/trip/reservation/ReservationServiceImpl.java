package com.sp.trip.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("reservation.reservationServiceImpl")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("reservation.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Reservation> listLodging(Map<String, Object> map) {
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("reservation.listLodging",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertRefund(Reservation dto) throws Exception{
		try {
			dao.insertData("reservation.insertRefund",dto);
			dao.updateData("reservation,cancelReservation",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertReservation(Reservation dto) throws Exception{
		try {
			dao.insertData("reservation.insertReservation",dto);
			dao.insertData("reservation.insertPay",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Reservation readReservation(int resNum) {
		Reservation dto = null;
		
		try {
			dto = dao.selectOne("reservation.readReservation",resNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int readPoint(String memberId) {
		int result = 0;
		try {
			result = dao.selectOne("reservation.readPoint",memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int maxValue(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("reservation.maxValue", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertLikeList(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("reservation.insertLikeList", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLikeList(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("reservation.deleteLikeList", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public boolean userLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Reservation dto = dao.selectOne("reservation.userLiked", map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<String> readLikeList(String memberId) {
		List<String> list = null;
		try {
			list = dao.selectList("reservation.readLike", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Reservation readPay(Map<String, Object> map) {
		Reservation dto = null;
		
		try {
			dto = dao.selectOne("reservation.readPay",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	
	

}
