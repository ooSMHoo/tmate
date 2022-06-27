package com.sp.trip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("mainLodgingListService")
public class LodgingListServiceImpl implements LodgingListService{
	
	private final CommonDAO dao;
	
	@Autowired
	public LodgingListServiceImpl(CommonDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<LodgingDTO> mainLodgingList() {
		List<LodgingDTO> list = null;
		try {
			list = dao.selectList("mainLodging.famousLodgingList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
