package com.sp.trip.hostPage.yearStats;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("yearStats.yearStatsService")
public class YearStatsServiceImpl implements YearStatsService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int ycountRestotal(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("yearStats.ycountRestotal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String ytotalPay(Map<String, Object> map) {
		String result = null;
		try {
			result = dao.selectOne("yearStats.ytotalPay", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int ycountCancel(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("yearStats.ycountCancel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String ytotalpayCancel(Map<String, Object> map) {
		String result = null;
		try {
			result = dao.selectOne("yearStats.ytotalpayCancel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}
