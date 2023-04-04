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
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String email = (String)session.getAttribute("email");
		String password = (String)session.getAttribute("password");

		
		// select 기능 (마이유저)		
			UserDTO dto = dao.selectByIdAndPassword(userName, email, password);
			request.setAttribute("user", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/userDetail.jsp");
			dispatcher.forward(request, response);
		 

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
			response.sendRedirect("/bulletinBoard/board");
			
		} else if (action.equals("login")) {
			UserDTO dto = userDAO.selectByIdAndPassword(userName, email, password);
			System.out.println(dto.toString());

			request.setAttribute("user", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/board");
			dispatcher.forward(request, response);

		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(responseCount);

	}

}
