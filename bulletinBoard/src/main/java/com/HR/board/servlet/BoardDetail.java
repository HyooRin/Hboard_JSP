package com.HR.board.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HR.board.dao.BoardDAO;
import com.HR.board.dto.BoardDTO;

@WebServlet("/boardDetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardDetail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String boardId = request.getParameter("boardId");
		System.out.println("boardId : " + boardId);

		// DAO - SELECT WHERE = ID;
		// boardDetail.jsp < --- 값

		BoardDAO dao = new BoardDAO();
		if (action.equals("select")) {
			BoardDTO dto = dao.selectById(Integer.parseInt(boardId));
			request.setAttribute("boardId", boardId);
			request.setAttribute("board", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/detailForm.jsp");
			dispatcher.forward(request, response);

		} else if (action.equals("update")) {
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/update.jsp");
		dispatcher.forward(request, response);
		BoardDTO dto = dao.selectById(Integer.parseInt(boardId));	
		request.setAttribute("boardId", boardId);
		request.setAttribute("board", dto);
		

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int responserCount = 0;

		request.setCharacterEncoding("UTF-8");
		String boardId = request.getParameter("boardId");
		BoardDAO dao = new BoardDAO();

		// 글 확인페이지 -> 현재 서블릿 페이지로 -> update.jsp 이동
		//String boardId = request.getParameter("boardId");
		//request.setAttribute("boardId", boardId);


		// update.jsp -> 여기로 와서 -> update 성공
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String nickName = request.getParameter("nickName");
		responserCount = dao.update(title, content, nickName, Integer.parseInt(boardId));

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(responserCount);

	}

}
