package com.HR.board.dao;

import java.util.ArrayList;

import com.HR.board.dto.BoardDTO;

public interface IBoardDAO {
	
	ArrayList<BoardDTO> select();
	BoardDTO selectById(int id);
	
	int insert(String title,String content, String nickName);
	
	int update(String title,String content, String nickName, int id);
	int delete();
	

}
