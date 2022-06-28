package com.sp.trip.mate;

import java.util.List;
import java.util.Map;

public interface MateService {
	public void insertMate(Mate dto) throws Exception; 
	public List<Mate> listMate(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Mate readMate(int num);
	public void updateHitCount(int num) throws Exception;
	public Mate preReadMate(Map<String, Object> map);
	public Mate nextReadMate(Map<String, Object> map);
	public void updateMate(Mate dto) throws Exception;
	public void deleteMate(int num, String userId, int membership) throws Exception;

	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);

}
