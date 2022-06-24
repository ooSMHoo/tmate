package com.sp.trip.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.trip.common.dao.CommonDAO;

@Service("board.boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private CommonDAO dao;


	@Override
	public void insertBoard(Board dto) throws Exception {
		try {
			dao.insertData("board.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;

		try {
			list = dao.selectList("board.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("board.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public Board readBoard(int num) {
		Board dto = null;

		// 게시물 가져오기
		try {
			dto = dao.selectOne("board.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		// 조회수 증가
		try {
			dao.updateData("board.updateHitCount", num);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;

		try {
			dto = dao.selectOne("board.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;

		try {
			dto = dao.selectOne("board.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateBoard(Board dto) throws Exception {
		try {
			dao.updateData("board.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteBoard(int num, String userId, int membership) throws Exception {
		try {
			Board dto = readBoard(num);
			if (dto == null || (membership < 51 && ! dto.getMemberId().equals(userId))) {
				return;
			}

			dao.deleteData("board.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("board.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = dao.selectList("board.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("board.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list = null;
		
		try {
			list = dao.selectList("board.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result = 0;
		
		try {
			result = dao.selectOne("board.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("board.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = dao.selectOne("board.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("board.insertBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int boardLikeCount(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("board.boardLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Board dto = dao.selectOne("board.userBoardLiked", map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}	
}
