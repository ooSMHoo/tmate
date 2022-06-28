package com.sp.trip.mate;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("mate.mateService")
public class MateServiceImpl implements MateService { 
	@Autowired
	private CommonDAO dao;


	@Override
	public void insertMate(Mate dto) throws Exception {
		try {
			dao.insertData("mate.insertMate", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 
	}

	@Override
	public List<Mate> listMate(Map<String, Object> map) {
		List<Mate> list = null;

		try {
			list = dao.selectList("mate.listMate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("mate.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public Mate readMate(int num) {
		Mate dto = null;

		// 게시물 가져오기
		try {
			dto = dao.selectOne("mate.readMate", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		// 조회수 증가
		try {
			dao.updateData("mate.updateHitCount", num);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Mate preReadMate(Map<String, Object> map) {
		Mate dto = null;

		try {
			dto = dao.selectOne("mate.preReadMate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Mate nextReadMate(Map<String, Object> map) {
		Mate dto = null;

		try {
			dto = dao.selectOne("mate.nextReadMate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateMate(Mate dto) throws Exception {
		try {
			dao.updateData("mate.updateMate", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteMate(int num, String userId, int membership) throws Exception {
		try {
			Mate dto = readMate(num);
			if (dto == null || (membership < 51 && ! dto.getMemberId().equals(userId))) {
				return;
			}

			dao.deleteData("mate.deleteMate", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("mate.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = dao.selectList("mate.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mate.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("mate.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list = null;
		
		try {
			list = dao.selectList("mate.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result = 0;
		
		try {
			result = dao.selectOne("mate.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


}
