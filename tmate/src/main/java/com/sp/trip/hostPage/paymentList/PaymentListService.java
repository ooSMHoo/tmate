package com.sp.trip.hostPage.paymentList;

import java.util.List;
import java.util.Map;

public interface PaymentListService {
	public List<PaymentList> paymentList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public PaymentList detailePayment(int resNum);
}
