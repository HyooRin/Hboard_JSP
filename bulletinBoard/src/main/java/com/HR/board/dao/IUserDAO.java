package com.HR.board.dao;

import java.util.ArrayList;

import com.HR.board.dto.UserDTO;

public interface IUserDAO {
	
	ArrayList<UserDTO> select();
	UserDTO selectByIdAndPassword(String userName, String email, String password);
	
	
	
	
	int insert(String userName, String email, String password, String nickName);
	
	int update(UserDTO user);
	int delete(int id);

}
