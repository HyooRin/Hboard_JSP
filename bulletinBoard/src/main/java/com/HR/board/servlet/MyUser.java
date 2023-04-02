package com.HR.board.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HR.board.dao.UserDAO;
import com.HR.board.dto.UserDTO;

@WebServlet("/user")
public class MyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO dao = new UserDAO();
		String action = request.getParameter("action");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// select 기능 (마이페이지)
//		if (action.equals("select")) {
//			ArrayList<UserDTO> userList = dao.select();
//			request.setAttribute("list", userList);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("userDetail.jsp");
//			dispatcher.forward(request, response);
//		} else if (action.equals("login")) {
			UserDTO dto = dao.selectByIdAndPassword(userName, email, password);
			System.out.println(dto.toString());
			request.setAttribute("user", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/board");
			dispatcher.forward(request, response);
			// response.sendRedirect("/board");
		//}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		int responseCount = 0;

		UserDAO userDAO = new UserDAO();

		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");

		if (action.equals("insert")) {
			// insert (join)
			responseCount = userDAO.insert(userName, email, password, nickName);
		}
//		else if(action.equals("login")){		
//		UserDTO dto = userDAO.selectByIdAndPassword(userName, email, password);
//		System.out.println(dto.toString());
//		request.setAttribute("user", dto);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/board");
//		dispatcher.forward(request, response);
//		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(responseCount);

	}

}
