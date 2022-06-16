package com.sp.trip.mypage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private CommonDAO dao;

	@Override
	public Mypage readMypage(String memberId) {
		Mypage dto = null;

		try {
			dto = dao.selectOne("mypage.readMypage", memberId);

			if (dto != null) {
				if (dto.getMemberEmail() != null) {
					String[] s = dto.getMemberEmail().split("@");
					dto.setMemberEmail1(s[0]);
					dto.setMemberEmail2(s[1]);
				}

				if (dto.getMemberPhone() != null) {
					String[] s = dto.getMemberPhone().split("-");
					dto.setPhone1(s[0]);
					dto.setPhone2(s[1]);
					dto.setPhone3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateMypage(Map<String, Object> map) throws Exception {
		
		try {
			dao.updateData("mypage.updateMypage3", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateMypage2(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("mypage.updateMypage4", map);
				
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	



	

	
}


	

