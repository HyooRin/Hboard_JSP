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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO dao = new UserDAO();
		String action = request.getParameter("action");
		
		// select 기능 
//		ArrayList<UserDTO> userList = dao.select();
//		request.setAttribute("list", userList);
//		RequestDispatcher dispatcher = request.getRequestDispatcher(".jsp");
//		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int responseCount = 0;
		
		UserDAO userDAO = new UserDAO();		
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
 		
		// insert
		responseCount = userDAO.insert(userId, email, password, nickName);
		
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(responseCount);
		
		
	}

}
