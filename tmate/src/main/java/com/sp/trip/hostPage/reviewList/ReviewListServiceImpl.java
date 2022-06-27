package com.sp.trip.hostPage.reviewList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("reviewList.ReviewListService")
public class ReviewListServiceImpl implements ReviewListService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ReviewList> reviewList(Map<String, Object> map) {
		List<ReviewList> list = null;
		
		try {
			list = dao.selectList("reviewList.reviewList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result= dao.selectOne("reviewList.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public ReviewList readRevAnswer(int revNum) {
		ReviewList dto = null;
		
		try {
			dto = dao.selectOne("reviewList.readRevAnswer", revNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateAnswer(ReviewList dto, int revNum) throws Exception {
		try {
			dao.updateData("reviewList.updateAnswer", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAnswer(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("reviewList.deleteAnswer", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

	
	
	
}
