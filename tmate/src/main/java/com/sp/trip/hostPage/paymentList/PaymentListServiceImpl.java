package com.sp.trip.hostPage.paymentList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("paymentList.paymentListService")
public class PaymentListServiceImpl implements PaymentListService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<PaymentList> paymentList(Map<String, Object> map) {
		List<PaymentList> list = null;
		
		try {
			list = dao.selectList("paymentList.paymentList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("paymentList.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public PaymentList detailePayment(int resNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
