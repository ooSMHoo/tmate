package com.sp.trip.host;

import java.util.Map;

import com.sp.trip.member.Member;

public interface HostService {
	
	public Member readMember(String userId);
	public String getBank(int bankNum);
	
	public void insertHost(Host host) throws Exception; 
	public Host readHost(String userId);
	public void updateHost(Host host, Map<String, Object> map) throws Exception;
}
