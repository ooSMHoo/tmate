package com.sp.trip.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("reservation.reservationRoomService")
public class ReservationRoomServiceImpl implements ReservationRoomService{
	
	private final CommonDAO dao;
	
	@Autowired
	public ReservationRoomServiceImpl(CommonDAO dao) {
		this.dao = dao;
	}

	@Override
	public Lodging readLodging(String mhId) {
		Lodging dto = null;
		
		try {
			dto = dao.selectOne("reservationRoomList.readLodging", mhId);
			dto.setLodgContent1(dto.getLodgContent1().replaceAll("\n", "<br>"));
			dto.setLodgContent2(dto.getLodgContent2().replaceAll("\n", "<br>"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Lodging> readLodgingPhotoList(String mhId) {
		List<Lodging> list = null;
		
		try {
			list = dao.selectList("reservationRoomList.readLodgingPhotoList", mhId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Room> readCanReservationRoomList(Map<String, Object> map) {
		List<Room> list = null;
		
		try {
			list = dao.selectList("reservationRoomList.readCanReservationRoomList", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Room> readCanReservationRoomPhotoList(int roomNum) {
		List<Room> list = null;
		
		try {
			list = dao.selectList("reservationRoomList.readCanReservationRoomPhotoList", roomNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int reviewCount(Map<String, Object> map) {
		int reviewCount = 0;
		try {
			reviewCount = dao.selectOne("reservationRoomList.reviewCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewCount;
	}

	@Override
	public List<Review> reviewList(Map<String, Object> map) {
		List<Review> list = null;
		try {
			list = dao.selectList("reservationRoomList.readReviewList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public double totalReviewGrade(String mhId) {
		double total = 0;
		try {
			total = dao.selectOne("reservationRoomList.totalReviewGrade", mhId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

}
