package com.dgit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MessageVO {

	private int mno;
	private String targetid;  //수신자
	private String sender;    //발신자
	private String message;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date senddate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getTargetid() {
		return targetid;
	}
	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
	@Override
	public String toString() {
		return String.format("MessageVO [mno=%s, targetid=%s, sender=%s, message=%s, senddate=%s]", mno, targetid,
				sender, message, senddate);
	}

	
	
}
