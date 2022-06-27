package com.sp.trip.hostPage.reviewList;

public class ReviewList {
	private int revNum; //리뷰 번호
	private String memberId; //작성자 아이디
	private String revSubject; //리뷰제목
	private String revContent; //리뷰내용
	private int revGrade; //별점
	private String revReg_date; //리뷰등록일
	private String resAnswer; //호스트 답글
	private String roomName; //룸이름
	private String resCin_date; //입실일
	private String resCout_date; //퇴실일
	
	private String mhId;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getRevSubject() {
		return revSubject;
	}

	public void setRevSubject(String revSubject) {
		this.revSubject = revSubject;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public int getRevGrade() {
		return revGrade;
	}

	public void setRevGrade(int revGrade) {
		this.revGrade = revGrade;
	}

	public String getRevReg_date() {
		return revReg_date;
	}

	public void setRevReg_date(String revReg_date) {
		this.revReg_date = revReg_date;
	}

	public String getResAnswer() {
		return resAnswer;
	}

	public void setResAnswer(String resAnswer) {
		this.resAnswer = resAnswer;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getResCin_date() {
		return resCin_date;
	}

	public void setResCin_date(String resCin_date) {
		this.resCin_date = resCin_date;
	}

	public String getResCout_date() {
		return resCout_date;
	}

	public void setResCout_date(String resCout_date) {
		this.resCout_date = resCout_date;
	}

	public String getMhId() {
		return mhId;
	}

	public void setMhId(String mhId) {
		this.mhId = mhId;
	}

	public int getRevNum() {
		return revNum;
	}

	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	
	
	
}
