package com.HR.board.dto;

public class UserDTO {
	
	int id;
	String userName;
	String email;
	String password;
	String nickName;
	
	public UserDTO() {
		
	}
	
	
	public UserDTO(int id, String userName, String email, String password, String nickName) {
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.nickName = nickName;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", userName=" + userName + ", email=" + email + ", password=" + password
				+ ", nickName=" + nickName + "]";
	}
	
	
	
	
	
	
	
	
	}
