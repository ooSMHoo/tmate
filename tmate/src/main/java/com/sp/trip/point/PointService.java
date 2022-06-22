package com.sp.trip.point;

import java.util.List;
import java.util.Map;

public interface PointService {

	public List<Point> listPoint(Map<String, Object>map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public void insertPoint(Point dto) throws Exception;

}
