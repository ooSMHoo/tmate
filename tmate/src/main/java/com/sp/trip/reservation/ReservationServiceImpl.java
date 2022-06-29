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
			// 환불 테이블 입력
			dao.insertData("reservation.insertRefund",dto);
			// resCode 변경
			dao.updateData("reservation,cancelReservation",dto);
			// 포인트 적립
			dao.insertData("reservation.payPoint",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int insertReservation(Reservation dto) throws Exception{
		int resNum = 0;
		
		try {
			// 예약 테이블 입력
			dao.insertData("reservation.insertReservation",dto);
			// 예약 상세 테이블 입력
			dao.insertData("reservation.insertReservationDetail",dto);
			// 결제 테이블 입력
			dao.insertData("reservation.insertPay",dto);
			
			resNum = dao.selectOne("reservation.readresNum");
			System.out.println(resNum);
			int point = dao.selectOne("reservation.checkPayPoint",resNum);
			if( point != 0 ) { // resNum로 포인트 사용여부를 호출해서 포인트가 0이 아니면 포인트 사용 실행 
			dao.insertData("reservation.payPoint",dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return resNum;
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
			dao.insertData("reservation.insertLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLikeList(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("reservation.deleteLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
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
