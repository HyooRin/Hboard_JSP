package com.HR.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HR.board.dto.BoardDTO;
import com.HR.board.dto.UserDTO;
import com.HR.board.utils.DBHelper;

public class BoardDAO implements IBoardDAO {

	private DBHelper dbHelper;
	private Connection conn;

	public BoardDAO() {
		dbHelper = new DBHelper();
		conn = dbHelper.getConnection();
	}

	@Override
	public ArrayList<BoardDTO> select() {

		ArrayList<BoardDTO> list = new ArrayList<>();

		String queryStr = " select b.*, nickName "
				+ " from board as b "
				+ " inner join user as u "
				+ " on b.userId = u.id ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String date = rs.getString("date");
				int userId = rs.getInt("userId");
				String nickName = rs.getString("nickName");
				
				UserDTO user = new UserDTO();
				user.setNickName(nickName);
				
				BoardDTO dto = new BoardDTO(id, title, content, date, userId);
				dto.setUser(user);
				list.add(dto);
				
				
								
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	public BoardDTO selectById(int id) {

		String queryStr = " SELECT title, content, date, userId " + " FROM board " + " WHERE id = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new BoardDTO();
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getString("date"));
				dto.setUserId(rs.getInt("userId"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		System.out.println(dto.getContent());
		System.out.println(dto.getTitle());
		return dto;
	}

	@Override
	public ArrayList<BoardDTO> selectByUserId(int userId) {

		ArrayList<BoardDTO> list = new ArrayList<>();

		String queryStr = " SELECT * " + " FROM board " + " WHERE userId = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			System.out.println(rs);

			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String date = rs.getString("date");
				userId = rs.getInt("userId");

				BoardDTO dto = new BoardDTO(id, title, content, date, userId);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	public ArrayList<BoardDTO> selectNickname(int userId) {

		ArrayList<BoardDTO> list = new ArrayList<>();

		String queryStr = " select b.*, nickName "
				+ " from board as b "
				+ " inner join user as u "
				+ " on b.userId = u.id " 
				+ " where b.userId = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			System.out.println(rs);

			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String date = rs.getString("date");
				userId = rs.getInt("userId");
				String nickName = rs.getString("nickName");
								
				UserDTO user = new UserDTO();
				user.setNickName(nickName);
				BoardDTO dto = new BoardDTO(id, title, content, date, userId);
				dto.setUser(user);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	public int insert(String title, String content, int userId) {

		int resultCountRow = 0;

		String queryStr = " INSERT INTO board(title, content, userId) " + "VALUES( ? , ? , ? ) ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, userId);
			resultCountRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return resultCountRow;
	}

	@Override
	public int update(String title, String content, int userId, int id) {

		int resultCountRow = 0;

		String queryStr = " UPDATE board  SET title = ? , content = ? , userId = ?  WHERE id = ? ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, userId);
			pstmt.setInt(4, id);
			resultCountRow = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return resultCountRow;

	}

	@Override
	public int delete() {

		return 0;

	}

}
