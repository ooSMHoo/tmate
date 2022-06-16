package com.sp.trip.point;

import java.util.List;

public interface PointService {

	public List<Point> readPoint(String memberId);
	
	public void insertPoint(Point dto) throws Exception;

}
