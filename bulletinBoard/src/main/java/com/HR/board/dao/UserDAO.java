package com.HR.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HR.board.dto.UserDTO;
import com.HR.board.utils.DBHelper;

public class UserDAO implements IUserDAO{
	
	
	private DBHelper dbHelper;
	private Connection conn;
	
	public UserDAO() {
		dbHelper = new DBHelper();
		conn = dbHelper.getConnection();
	}
	

	@Override
	public ArrayList<UserDTO> select() {
		
		ArrayList<UserDTO> list = new ArrayList<>();
		
		String queryStr = " SELECT * FROM user ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(queryStr);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String userName = rs.getString("userName");
				String email = rs.getString("email");	
				UserDTO dto = new UserDTO(id, userName, email);
				list.add(dto);						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}		
		return list;
		
	}

	@Override
	public int insert(String userName, String email) {
		
		int resultCount = 0;
		
		String queryStr = "  ";
		
		
		return 0;
	}

	@Override
	public int update() {
		
		return 0;
	}

	@Override
	public int delete() {
		
		return 0;
		
	}
	
	
	
	

}
