package com.sp.trip.mypage;

import java.util.Map;

public interface MypageService {
	//회원정보
	public Mypage readMypage(String memberId);
	
	public void updateMypage(Map<String, Object> map) throws Exception;
	public void updateMypage2(Map<String, Object> map) throws Exception;
	

}
