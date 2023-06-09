package com.HR.board.dao;

import java.util.ArrayList;

import com.HR.board.dto.BoardDTO;

public interface IBoardDAO {
	
	ArrayList<BoardDTO> select();
	BoardDTO selectById(int id);
	ArrayList<BoardDTO> selectByUserId(int userId);
	ArrayList<BoardDTO> selectNickname(int userId); 
	
	int insert(String title,String content, int userId);	
	int update(String title,String content, int userId, int id);
	int delete();
	

}
