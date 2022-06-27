package com.sp.trip.host;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;
import com.sp.trip.member.Member;

@Service("host.hostService")
public class HostServiceImpl implements HostService{
	
	private final CommonDAO dao;
	
	@Autowired
	public HostServiceImpl(CommonDAO dao) {
		this.dao = dao;
	}

	@Override
	public Member readMember(String userId) {
		Member member = null;
		
		try {
			member = dao.selectOne("host.readMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public void insertHost(Host host) throws Exception {
		try {
			if (host.getMhPhone1().length()!=0 && host.getMhPhone2().length()!=0 && host.getMhPhone3().length()!=0) {
				host.setMhPhone(host.getMhPhone1() + "-" + host.getMhPhone2() + "-" + host.getMhPhone3());
			}
			dao.insertData("host.insertHost", host);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Host readHost(String userId) {
		Host host = null;
		try {
			host = dao.selectOne("host.readHost", userId);
			if(host == null) {
				return host;
			}
			
			String phone = host.getMhPhone();

			host.setMhPhone1(phone.substring(0, phone.indexOf("-")));
			host.setMhPhone2(phone.substring(phone.indexOf("-")+1, phone.lastIndexOf("-")));
			host.setMhPhone3(phone.substring(phone.lastIndexOf("-")+1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return host;
	}

	@Override
	public String getBank(int bankNum) {
		String bank = null;
		try {
			bank = dao.selectOne("host.getBank", bankNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bank;
	}
	
	@Override
	public void updateHost(Host host) throws Exception {
		try {
			if (host.getMhPhone1().length()!=0 && host.getMhPhone2().length()!=0 && host.getMhPhone3().length()!=0) {
				host.setMhPhone(host.getMhPhone1() + "-" + host.getMhPhone2() + "-" + host.getMhPhone3());
			}
			dao.updateData("host.updateHost", host);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateHost(Host host, Map<String, Object> map) throws Exception {
		try {
			if (host.getMhPhone1().length()!=0 && host.getMhPhone2().length()!=0 && host.getMhPhone3().length()!=0) {
				host.setMhPhone(host.getMhPhone1() + "-" + host.getMhPhone2() + "-" + host.getMhPhone3());
			}
			dao.updateData("host.updateHost", host);
			dao.updateData("host.updateLatLon", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
