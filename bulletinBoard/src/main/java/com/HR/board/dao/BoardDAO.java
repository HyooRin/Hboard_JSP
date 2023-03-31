package com.HR.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HR.board.dto.BoardDTO;
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

		String queryStr = " SELECT * FROM board ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String nickName = rs.getString("nickName");
				String date = rs.getString("date");
				BoardDTO dto = new BoardDTO(id, title, content, nickName, date);
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

		String queryStr = " SELECT title, content, nickName, date " + " FROM board " + " WHERE id = ? ";

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
				dto.setNickName(rs.getString("nickName"));
				dto.setDate(rs.getString("date"));

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
	public int insert(String title, String content, String nickName) {

		int resultCountRow = 0;

		String queryStr = " INSERT INTO board(title, content, nickName) " + "VALUES( ? , ? , ? ) ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, nickName);
			resultCountRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return resultCountRow;
	}

	@Override
	public int update(String title, String content, String nickName, int id) {

		int resultCountRow = 0;

		String queryStr = " UPDATE board " + " SET title = ? , content = ? , nickName = ? " + " WHERE id = ? ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, nickName);
			pstmt.setInt(4, id);
			resultCountRow = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
