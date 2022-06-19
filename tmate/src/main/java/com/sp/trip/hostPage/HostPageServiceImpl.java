package com.sp.trip.hostPage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("hostPage.hostPageService")
public class HostPageServiceImpl implements HostPageService{
	@Autowired
	private CommonDAO dao;
	

	@Override
	public int countTotalRoom(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("hostPage.countTotalRoom", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int countResRoom(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("hostPage.countResRoom", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<HostPage> todayRes(Map<String, Object> map) {
		List<HostPage> list = null;
		
		try {
			list = dao.selectList("hostPage.todayRes", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int todayResOk(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("hostPage.todayResOk", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int todayCancel(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("hostPage.todayCancel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
