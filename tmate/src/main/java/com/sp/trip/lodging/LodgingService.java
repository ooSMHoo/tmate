package com.sp.trip.lodging;

import java.util.List;

public interface LodgingService {
	public void insertLodging(Lodging lodging, String pathname) throws Exception;
	public Lodging readLodging(String userId);
	public void insertLodgingPhoto(Lodging lodging) throws Exception;
	public List<Lodging> readLodgingPhotolist(String mhId);
	public Lodging readLodgingPhotoFile(int lPhotoNum);
}
