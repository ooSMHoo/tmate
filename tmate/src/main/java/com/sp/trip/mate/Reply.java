package com.sp.trip.mate;

public class Reply {

	private int mateRe_num;
	private int mateNum;
	private String memberId;
	private String memberName;
	private String mateRe_content;
	private String mateRe_reg_date;
	private int mateRe_parent;
	
	public int getMateRe_num() {
		return mateRe_num;
	}

	public void setMateRe_num(int mateRe_num) {
		this.mateRe_num = mateRe_num;
	}

	public int getMateNum() {
		return mateNum;
	}

	public void setMateNum(int mateNum) {
		this.mateNum = mateNum;
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

	public String getMateRe_content() {
		return mateRe_content;
	}

	public void setMateRe_content(String mateRe_content) {
		this.mateRe_content = mateRe_content;
	}

	public String getMateRe_reg_date() {
		return mateRe_reg_date;
	}

	public void setMateRe_reg_date(String mateRe_reg_date) {
		this.mateRe_reg_date = mateRe_reg_date;
	}

	public int getMateRe_parent() {
		return mateRe_parent;
	}

	public void setMateRe_parent(int mateRe_parent) {
		this.mateRe_parent = mateRe_parent;
	}

	public int getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}

	private int answerCount;
}
