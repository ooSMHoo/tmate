package com.sp.trip.host;

import com.sp.trip.member.Member;

public interface HostService {
	
	public Member readMember(String userId);
	
	public void insertHost(Host host) throws Exception; 
	public Host readHost(String userId);
}
