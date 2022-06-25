package com.sp.trip.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("review.reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Review> reviewMain(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = dao.selectList("review.reviewMain", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list = null;
		try {
			list = dao.selectList("review.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("review.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReview(Review review, String memberId) throws Exception {
		try {
			dao.insertData("review.insertReview", review);
			dao.insertData("review.insertPoint", memberId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertReport(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("review.insertReport", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
