package com.iu.notice;

public class noticeDTO {
	private int num;
	private String title;
	private String writer;
	private String contents;
	private String reg_data;
	private int hit;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReg_data() {
		return reg_data;
	}
	public void setReg_data(String reg_data) {
		this.reg_data = reg_data;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

}
