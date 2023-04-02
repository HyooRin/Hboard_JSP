package com.HR.board.dto;

public class BoardDTO {
	
	int id;
	String title;
	String content;
	String date;
	int userId;
	
	public BoardDTO() {
	}
	
	public BoardDTO(int id, String title, String content, String date, int userId) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.userId = userId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	
	
	

}
