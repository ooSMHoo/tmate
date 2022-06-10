package com.sp.trip.host;

import com.sp.trip.member.SessionInfo;

public interface HostService {
	
	public String getMemberEmail(SessionInfo info);
	public void insertHost(Host host) throws Exception; 
	public Host readHost(String userId);
	public void insertLodging(Lodging lodging, String pathname) throws Exception;
	public void insertLodgingPhoto(Lodging lodging) throws Exception;
	public Lodging readLodgingPhoto(String mhId);
}
