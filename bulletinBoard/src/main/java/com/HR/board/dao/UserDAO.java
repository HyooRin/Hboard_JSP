package com.HR.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HR.board.dto.UserDTO;
import com.HR.board.utils.DBHelper;

public class UserDAO implements IUserDAO {

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
			while (rs.next()) {
				int id = rs.getInt("id");
				String userName = rs.getString("userName");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String nickName = rs.getString("nickName");

				UserDTO dto = new UserDTO(id, userName, email, password, nickName);
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
	public UserDTO selectByIdAndPassword(String userName, String email, String password) {

		UserDTO user = null;

		String queryStr = " SELECT * FROM user WHERE userName = ? AND email = ? AND password = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			pstmt.setString(3, password);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				user = new UserDTO();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setNickName(rs.getString("nickName"));
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
		return user;

	}

	@Override
	public int insert(String userName, String email, String password, String nickName) {

		int resultCount = 0;

		String queryStr = " INSERT INTO user(userName, email, password, nickName) " + " VALUES( ? , ? , ? , ? ) ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			pstmt.setString(4, nickName);
			resultCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultCount;
	}

	@Override
	public int update(UserDTO user) {

		int resultCount = 0;

		String query = " UPDATE user SET userName = ?, email = ?, " + " password = ? , nickName = ? "
				+ " WHERE id = ?   ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getNickName());
			pstmt.setInt(5, user.getId());

			resultCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return resultCount;

	}

	@Override
	public int delete(int id) {

		int resultRowCount = 0;
		String queryStr = " DELETE FROM user WHERE id = 4 ";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryStr);
			pstmt.setInt(1, id);
			resultRowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return resultRowCount;

	}

}
