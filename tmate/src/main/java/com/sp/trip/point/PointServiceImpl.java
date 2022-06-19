package com.sp.trip.point;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("point.pointService")
public class PointServiceImpl implements PointService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Point>  readPoint(String memberId) {
		List<Point> list = null;
		
		try {
			list = dao.selectList("point.readPoint", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void insertPoint(Point dto) throws Exception {
		try {
			dao.insertData("point.insertPoint", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("point.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Point> listPoint(Map<String, Object> map) throws Exception {
		List<Point> list = null;
		
		try {
			list = dao.selectList("point.listPoint", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
