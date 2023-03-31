package com.HR.board.dao;

import java.util.ArrayList;

import com.HR.board.dto.UserDTO;

public interface IUserDAO {
	
	ArrayList<UserDTO> select();
	int insert(String userId, String email, String password, String nickName);
	int update();
	int delete();

}
