package com.sp.trip.admin.memberManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("admin.memberManage.memberManageService")
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCountHost(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.dataCountHost", map);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public List<Member> listHost(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("memberManage.listHost", map);
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public Member readHost(String mhId) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("memberManage.readHost", mhId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHostSign(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateHostSign", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateHostEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateHostEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


}
