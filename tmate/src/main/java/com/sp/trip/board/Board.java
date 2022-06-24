package com.sp.trip.board;

public class Board {
	private int listNum;
	
	private int boardNum;
    private String memberName;
    private String memberId;
    private String boardSubject;
    private String boardContent;
    private String boardReg_date;
    private int boardHit;
    private int boardEnabled;

	private int replyCount;

	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardReg_date() {
		return boardReg_date;
	}
	public void setBoardReg_date(String boardReg_date) {
		this.boardReg_date = boardReg_date;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}
	public int getBoardEnabled() {
		return boardEnabled;
	}
	public void setBoardEnabled(int boardEnabled) {
		this.boardEnabled = boardEnabled;
	}

	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}


	
}
