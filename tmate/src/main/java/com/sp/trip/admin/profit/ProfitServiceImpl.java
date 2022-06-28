package com.sp.trip.admin.profit;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("admin.main.profitService")
public class ProfitServiceImpl implements ProfitService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Integer> dataCountCustomer() {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminprofit.dataCountCustomer");
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public List<Integer> dataCountHost() {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminprofit.dataCountHost");
		} catch (Exception e) {
		}
		
		return list;
	}
	
	
	@Override
	public List<Integer> dataCountReservation() {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminprofit.dataCountReservation");
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Integer> dataResTotal() {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminprofit.dataResTotal");
		} catch (Exception e) {
		}
		return list;
	}

	

}
