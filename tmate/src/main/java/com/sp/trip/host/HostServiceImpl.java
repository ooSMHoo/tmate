package com.sp.trip.host;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.dao.CommonDAO;
import com.sp.trip.member.SessionInfo;

@Service("host.hostService")
public class HostServiceImpl implements HostService{
	
	private final CommonDAO dao;
	private final FileManager fileManager;
	
	@Autowired
	public HostServiceImpl(CommonDAO dao, FileManager fileManager) {
		this.dao = dao;
		this.fileManager = fileManager;
	}

	@Override
	public String getMemberEmail(SessionInfo info) {
		String email = "";
		try {
			email = dao.selectOne("host.getMemberEmail", info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return email;
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return host;
	}

	@Override
	public void insertLodging(Lodging lodging, String pathname) throws Exception {
		try {
			if (lodging.getStart_month().length()!=0 && lodging.getStart_day().length()!=0 && 
					lodging.getEnd_month().length()!=0 && lodging.getEnd_day().length()!=0) {
				lodging.setLodgStart_date(lodging.getStart_month()+"-"+lodging.getStart_day());
				lodging.setLodgEnd_date(lodging.getEnd_month()+"-"+lodging.getEnd_day());
			}
			if (lodging.getLodgOptionArr().length != 0) {
				lodging.setLodgOption(String.join(",", lodging.getLodgOptionArr()));
			}
			
			dao.insertData("host.insertLodging", lodging);
			
			if (! lodging.getSelectFile().isEmpty()) {
				for(MultipartFile mf : lodging.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					lodging.setlPhotoName(saveFilename);
					
					insertLodgingPhoto(lodging);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void insertLodgingPhoto(Lodging lodging) throws Exception {
		try {
			dao.insertData("host.insertLodgingPhoto", lodging);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Lodging readLodgingPhoto(String mhId) {
		Lodging lodging = null;
		try {
			lodging = dao.selectOne(mhId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lodging;
	}
}
