package egovframework.example.test.vo;

import java.util.Date;

public class ReplyVO {

	private int bbsID;
	private int rno;
	private String content;
	private String userID;
	private Date regdate;
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [bbsID=" + bbsID + ", rno=" + rno + ", content=" + content + ", userID=" + userID + ", regdate="
				+ regdate + "]";
	}
	
	
}