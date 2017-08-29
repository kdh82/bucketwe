package com.dgit.domain;

import java.util.Date;

public class ReplyVO {
	private int rno;
	private int bno;
	private String id;
	private String replyText;
	private Date rregDate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public Date getRregDate() {
		return rregDate;
	}
	public void setRregDate(Date rregDate) {
		this.rregDate = rregDate;
	}
	@Override
	public String toString() {
		return String.format("ReplyVO [rno=%s, bno=%s, id=%s, replyText=%s, rregDate=%s]", rno, bno, id, replyText,
				rregDate);
	}
	
	
	
}
