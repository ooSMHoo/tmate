package com.sp.trip.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public List<Review> reviewMain(Map<String, Object> map);
	
	public List<Review> listReview(Map<String, Object> map);
	
	public int dataCount(Map<String, Object> map);

}
