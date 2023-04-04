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

import com.HR.board.dao.BoardDAO;
import com.HR.board.dao.UserDAO;
import com.HR.board.dto.BoardDTO;
import com.HR.board.dto.UserDTO;

@WebServlet("/board")
public class MyBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyBoard() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BoardDAO boardDAO = new BoardDAO();
		UserDAO userDAO = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
			
		
		ArrayList<BoardDTO> resultList = boardDAO.select();
		
		System.out.println("resultList : " + resultList.toString());
		System.out.println(resultList.size());
		request.setAttribute("list", resultList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/boardList.jsp");
		dispatcher.forward(request, response);
		


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		

		int responseCount = 0;

		BoardDAO boardDAO = new BoardDAO();
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");		
		String userId = request.getParameter("userId");

		if (action.equals("insert")) {

			responseCount = boardDAO.insert(title, content, Integer.parseInt(userId));
			response.sendRedirect("/bulletinBoard/board");
			
			// update.jsp -> 여기로 와서 -> update 성공
		} else if (action.equals("update")) {
			responseCount = boardDAO.update(title, content, Integer.parseInt(userId), Integer.parseInt(id));
			response.sendRedirect("/bulletinBoard/board");
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print("적용된 개수는 :" + responseCount);

	}

}
