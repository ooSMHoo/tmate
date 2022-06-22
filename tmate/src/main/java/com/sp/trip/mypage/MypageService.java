package com.sp.trip.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	//회원정보
	public Mypage readMypage(String memberId);
	
	public void updateMypage(Map<String, Object> map) throws Exception;
	public void updateMypage2(Map<String, Object> map) throws Exception;
	
	//찜 목록
	public List<LikeList> listLike(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void deleteList(Map<String, Object> map) throws Exception;
}
