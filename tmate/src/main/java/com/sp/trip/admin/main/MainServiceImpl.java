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
	public void updateHostSign(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("adminMain.updateHostSign", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
