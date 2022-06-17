package com.sp.trip.hostPage.bookingList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("bookingList.bookingListService")
public class BookingListServiceImpl implements BookingListService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<BookingList> bookingList(Map<String, Object> map) {
		List<BookingList> list = null;
		
		try {
			list = dao.selectList("bookingList.bookingList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("bookingList.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void updateBookingList(BookingList dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBookingList(int resNum, String pathname, String memberId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BookingList detaileBooking(int resNum) {
		BookingList dto = null;
		
		try {
			dto = dao.selectOne("bookingList.detaileBooking", resNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
