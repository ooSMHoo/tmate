package com.sp.trip.pr;

import java.util.List;
import java.util.Map;

public interface PrService {
	public void insertPr(Pr dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Pr> listPr(Map<String, Object> map);
	public Pr readPr(int num);
	public Pr preReadPr(Map<String, Object> map);
	public Pr nextReadPr(Map<String, Object> map);
	public void updatePr(Pr dto, String pathname) throws Exception;
	public void deletePr(int num, String pathname) throws Exception;
}
