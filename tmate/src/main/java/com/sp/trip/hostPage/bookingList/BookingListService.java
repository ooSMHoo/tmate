package com.sp.trip.hostPage.bookingList;

import java.util.List;
import java.util.Map;

public interface BookingListService {
	public List<BookingList> bookingList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void updatehostMemo(BookingList dto, int resNum) throws Exception;
	public void updateRescode(Map<String, Object> map) throws Exception;
	public BookingList detaileBooking(int resNum);
}
