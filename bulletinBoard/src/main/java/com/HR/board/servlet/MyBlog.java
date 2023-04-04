package com.HR.board.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HR.board.dao.BoardDAO;
import com.HR.board.dao.UserDAO;
import com.HR.board.dto.BoardDTO;
import com.HR.board.dto.UserDTO;

@WebServlet("/blog")
public class MyBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyBlog() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		BoardDAO boardDAO = new BoardDAO();
		UserDAO userDAO = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		HttpSession session = request.getSession();		
		
		String userName = (String)session.getAttribute("userName");
		String email = (String)session.getAttribute("email");
		String password = (String)session.getAttribute("password");	

		
		UserDTO user = userDAO.selectByIdAndPassword(userName, email, password);
		System.out.println(user.getId());
		ArrayList<BoardDTO> list = boardDAO.selectByUserId(user.getId());    
		System.out.println(list);
		
		request.setAttribute("board" , list);
		request.setAttribute("user" , user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/blog.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
