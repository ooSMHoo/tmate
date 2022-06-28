package com.sp.trip.admin.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.admin.memberManage.Member;
import com.sp.trip.common.dao.CommonDAO;

@Service("admin.main.memberService")
public class MainServiceImpl implements MainService{
	@Autowired
	private CommonDAO dao;


	@Override
	public int dataCountHost(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminMain.dataCountHost", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listHost(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("adminMain.listHost", map);
		} catch (Exception e) {
			
		}
		return list;

	}

	@Override
	public Member readHost(String mhId) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("adminMain.readHost", mhId);
		} catch (Exception e) {
		}
		return dto;

	}

	@Override
	public int dataCountAllHost(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminMain.dataCountAllHost", map);
		} catch (Exception e) {
			
		}
		return result;

	}

	@Override
	public int dataCountAllMember(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminMain.dataCountAllMember", map);
		} catch (Exception e) {
			
		}
		return result;

	}

	@Override
	public int dataCountAllHouse(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminMain.dataCountAllHouse", map);
		} catch (Exception e) {
			
		}
		return result;

	}

	@Override
	public int dataCountAllReport(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminMain.dataCountReport", map);
		} catch (Exception e) {
			
		}
		return result;

	}

	@Override
	public List<Integer> dailyReservation() {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminMain.dailyReservation");
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Integer> dailyResTotal() {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminMain.dailyResTotal");
		} catch (Exception e) {
		}
		return list;
	}

}
