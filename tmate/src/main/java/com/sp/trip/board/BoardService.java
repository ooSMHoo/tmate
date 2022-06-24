package com.sp.trip.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto) throws Exception;
	public List<Board> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Board readBoard(int num);
	public void updateHitCount(int num) throws Exception;
	public Board preReadBoard(Map<String, Object> map);
	public Board nextReadBoard(Map<String, Object> map);
	public void updateBoard(Board dto) throws Exception;
	public void deleteBoard(int num, String userId, int membership) throws Exception;
	
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(int num);
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public boolean userBoardLiked(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}


