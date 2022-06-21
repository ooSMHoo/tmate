package com.sp.trip.admin.manage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("admin.manage.memberManageService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCountMember(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("adminManage.dataCountMember", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("adminManage.listMember", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Member readMember(String memberId) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("adminManage.readMember", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("adminManage.updateMemberEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
