package com.sp.trip.board;

public class Reply {
	
	private int boardRe_num;
	private int boardNum;
	private String memberId;
	private String memberName;
	private String boardRe_content;
	private String boardRe_reg_date;
	private int boardRe_parent; 
	private int boardEnabled;
	
	private int answerCount;
	
	public int getBoardRe_num() {
		return boardRe_num;
	}
	public void setBoardRe_num(int boardRe_num) {
		this.boardRe_num = boardRe_num;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getBoardRe_content() {
		return boardRe_content;
	}
	public void setBoardRe_content(String boardRe_content) {
		this.boardRe_content = boardRe_content;
	}
	public String getBoardRe_reg_date() {
		return boardRe_reg_date;
	}
	public void setBoardRe_reg_date(String boardRe_reg_date) {
		this.boardRe_reg_date = boardRe_reg_date;
	}
	public int getBoardRe_parent() {
		return boardRe_parent;
	}
	public void setBoardRe_parent(int boardRe_parent) {
		this.boardRe_parent = boardRe_parent;
	}
	public int getBoardEnabled() {
		return boardEnabled;
	}
	public void setBoardEnabled(int boardEnabled) {
		this.boardEnabled = boardEnabled;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
}
