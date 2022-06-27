package com.sp.trip.hostPage.reviewList;

import java.util.List;
import java.util.Map;

public interface ReviewListService {
	public List<ReviewList> reviewList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public ReviewList readRevAnswer(int revNum);
	public void updateAnswer(ReviewList dto, int revNum) throws Exception;
	public void deleteAnswer(Map<String, Object> map) throws Exception;
}
