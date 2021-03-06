package com.sp.trip.hostPage.monthStats;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("monthStats.monthStatsService")
public class MonthStatsServiceImpl implements MonthStatsService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int mcountRestotal(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("monthStats.mcountRestotal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int mcountCintotal(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("monthStats.mcountCintotal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String mtotalPay(Map<String, Object> map) {
		String result = null;
		try {
			result = dao.selectOne("monthStats.mtotalPay", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int mcountCancel(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("monthStats.mcountCancel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String mtotalpayCancel(Map<String, Object> map) {
		String result = null;
		try {
			result = dao.selectOne("monthStats.mtotalpayCancel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MonthStats> mselDetaile(Map<String, Object> map) {
		List<MonthStats> list = null;
		
		try {
			list = dao.selectList("monthStats.mselDetaile", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MonthStats> mResCount(Map<String, Object> map) {
		List<MonthStats> list = null;
		
		try {
			list = dao.selectList("monthStats.mResCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MonthStats> totalASday(Map<String, Object> map) {
		List<MonthStats> list = null;
		
		try {
			list = dao.selectList("monthStats.totalASday", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
