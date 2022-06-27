package com.sp.trip.hostPage.yearStats;

import java.util.List;
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

	@Override
	public List<YearStats> lastyPaytotal(Map<String, Object> map) {
		List<YearStats> list = null;
		
		try {
			list = dao.selectList("yearStats.lastyPaytotal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<YearStats> thisyPaytotal(Map<String, Object> map) {
		List<YearStats> list = null;
		
		try {
			list = dao.selectList("yearStats.thisyPaytotal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<YearStats> lastyResCount(Map<String, Object> map) {
		List<YearStats> list = null;
		
		try {
			list = dao.selectList("yearStats.lastyResCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<YearStats> thisyResCount(Map<String, Object> map) {
		List<YearStats> list = null;
		
		try {
			list = dao.selectList("yearStats.thisyResCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<YearStats> totalASmonth(Map<String, Object> map) {
		List<YearStats> list = null;
		
		try {
			list = dao.selectList("yearStats.totalASmonth", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



}
