package com.sp.trip.admin.report;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("admin.report.memberReportService")
public class MemberReportServiceImpl implements MemberReportService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCountHost(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminReport.dataCountHost", map);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public List<Member> listHost(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("adminReport.listHost",map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public void updateHostEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("adminReport.updateHostEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateHrCode(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("adminReport.updateHrCode", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
