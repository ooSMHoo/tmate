package com.sp.trip.hostPage.bookingList;

import java.util.List;
import java.util.Map;

public interface BookingListService {
	public List<BookingList> bookingList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void updateBookingList(BookingList dto, String pathname) throws Exception;
	public void deleteBookingList(int resNum, String pathname, String memberId) throws Exception;
	public BookingList detaileBooking(int resNum);
}
