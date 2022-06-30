package com.sp.trip.pr;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.FileManager;
import com.sp.trip.common.dao.CommonDAO;

@Service("pr.prService")
public class PrServiceImpl implements PrService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertPr(Pr dto, String pathname) throws Exception {
		try {
			String prphotoName = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (prphotoName != null) {
				dto.setPrphotoName(prphotoName);

				dao.insertData("pr.insertPr", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("pr.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Pr> listPr(Map<String, Object> map) {
		List<Pr> list = null;

		try {
			list = dao.selectList("pr.listPr", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Pr readPr(int num) {
		Pr dto = null;

		try {
			dto = dao.selectOne("pr.readPr", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public void updateHitCount(int num) throws Exception {
		// 조회수 증가
		try {
			dao.updateData("pr.updateHitCount", num);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Pr preReadPr(Map<String, Object> map) {
		Pr dto = null;

		try {
			dto = dao.selectOne("pr.preReadPr", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Pr nextReadPr(Map<String, Object> map) {
		Pr dto = null;

		try {
			dto = dao.selectOne("pr.nextReadPr", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updatePr(Pr dto, String pathname) throws Exception {
		try {
			// 업로드한 파일이 존재한 경우
			String prphotoName = fileManager.doFileUpload(dto.getSelectFile(), pathname);

			if (prphotoName != null) {
				// 이전 파일 지우기
				if (dto.getPrphotoName().length() != 0) {
					fileManager.doFileDelete(dto.getPrphotoName(), pathname);
				}

				dto.setPrphotoName(prphotoName);
			}

			dao.updateData("pr.updatePr", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deletePr(int num, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			// 게시물지우기
			dao.deleteData("pr.deletePr", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
