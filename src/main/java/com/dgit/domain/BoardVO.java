package com.dgit.domain;

import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {
	private int bno;
	private String title;
	private String category;
	private String content;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date bregDate;
	private boolean bjoin;
	private int bcnt;
	private int replyCnt;
	private String id;
	private String[] files;
	
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getBregDate() {
		return bregDate;
	}
	public void setBregDate(Date bregDate) {
		this.bregDate = bregDate;
	}
	public boolean isBjoin() {
		return bjoin;
	}
	public void setBjoin(boolean bjoin) {
		this.bjoin = bjoin;
	}
	public int getBcnt() {
		return bcnt;
	}
	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return String.format(
				"BoardVO [bno=%s, title=%s, category=%s, content=%s, startDate=%s, endDate=%s, bregDate=%s, bjoin=%s, bcnt=%s, replyCnt=%s, id=%s, files=%s]",
				bno, title, category, content, startDate, endDate, bregDate, bjoin, bcnt, replyCnt, id,
				Arrays.toString(files));
	}
	

	
	
	
}
