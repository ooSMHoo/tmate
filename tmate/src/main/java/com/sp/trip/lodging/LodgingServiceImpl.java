package com.sp.trip.lodging;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.dao.CommonDAO;

@Service("lodging.lodgingService")
public class LodgingServiceImpl implements LodgingService {
	
	private final CommonDAO dao;
	private final FileManager fileManager;
	
	@Autowired
	public LodgingServiceImpl(CommonDAO dao, FileManager fileManager) {
		this.dao = dao;
		this.fileManager = fileManager;
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
			
			dao.insertData("lodging.insertLodging", lodging);
			
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
			dao.insertData("lodging.insertLodgingPhoto", lodging);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Lodging readLodging(String userId) {
		Lodging lodging = null;
		try {
			lodging = dao.selectOne("lodging.readLodging", userId);
			if (lodging == null) {
				return lodging;
			}
			String lodgStart_date = lodging.getLodgStart_date();
			String lodgEnd_date = lodging.getLodgEnd_date();
			lodging.setStart_month(lodgStart_date.substring(0, lodgStart_date.indexOf("-")));
			lodging.setStart_day(lodgStart_date.substring(lodgStart_date.indexOf("-")+1));
			lodging.setEnd_month(lodgEnd_date.substring(0, lodgEnd_date.indexOf("-")));
			lodging.setEnd_day(lodgEnd_date.substring(lodgEnd_date.indexOf("-")+1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lodging;
	}
	
	@Override
	public List<Lodging> readLodgingPhotolist(String mhId) {
		List<Lodging> list = null;
		try {
			list = dao.selectList("lodging.readLodgingPhotoList", mhId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Lodging readLodgingPhotoFile(int lPhotoNum) {
		Lodging lodging = null;
		try {
			lodging = dao.selectOne("lodging.readLodgingPhotoFile", lPhotoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lodging;
	}

	@Override
	public String readLodgingCategory(int lcNum) {
		String lodgingCategory = null;
		try {
			lodgingCategory = dao.selectOne("lodging.readLodgingCategory", lcNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lodgingCategory;
	}

	@Override
	public void deleteLodgingPhotoFile(int lPhotoNum) throws Exception {
		try {
			dao.deleteData("lodging.deleteLodgingPhotoFile", lPhotoNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateLodging(Lodging lodging, String pathname) throws Exception {
		try {
			if (lodging.getStart_month().length()!=0 && lodging.getStart_day().length()!=0 && 
					lodging.getEnd_month().length()!=0 && lodging.getEnd_day().length()!=0) {
				lodging.setLodgStart_date(lodging.getStart_month()+"-"+lodging.getStart_day());
				lodging.setLodgEnd_date(lodging.getEnd_month()+"-"+lodging.getEnd_day());
			}
			if (lodging.getLodgOptionArr().length != 0) {
				lodging.setLodgOption(String.join(",", lodging.getLodgOptionArr()));
			}
			
			dao.updateData("lodging.updateLodging", lodging);
			
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
	public void updateLodging(Lodging lodging, String pathname, String[] fileNum, String[] fileName) throws Exception {
		try {
			if (lodging.getStart_month().length()!=0 && lodging.getStart_day().length()!=0 && 
					lodging.getEnd_month().length()!=0 && lodging.getEnd_day().length()!=0) {
				lodging.setLodgStart_date(lodging.getStart_month()+"-"+lodging.getStart_day());
				lodging.setLodgEnd_date(lodging.getEnd_month()+"-"+lodging.getEnd_day());
			}
			if (lodging.getLodgOptionArr().length != 0) {
				lodging.setLodgOption(String.join(",", lodging.getLodgOptionArr()));
			}
			
			dao.updateData("lodging.updateLodging", lodging);
			
			for(int i=0; i<fileNum.length; i++) {
				deleteLodgingPhotoFile(Integer.parseInt(fileNum[i]));
				fileManager.doFileDelete(fileName[i], pathname);
			}
			
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
}
