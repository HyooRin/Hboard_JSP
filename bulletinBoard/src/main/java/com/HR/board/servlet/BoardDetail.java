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

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String boardId = request.getParameter("boardId");
		String nickName = request.getParameter("nickName");
		System.out.println("boardId : " + boardId);

		// 글 상세조회
		BoardDAO dao = new BoardDAO();
		if (action.equals("select")) {
			BoardDTO dto = dao.selectById(Integer.parseInt(boardId));
			
			request.setAttribute("boardId", boardId);
			request.setAttribute("board", dto);
			request.setAttribute("nickName", nickName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/detailForm.jsp");
			dispatcher.forward(request, response);

		// 수정화면으로 이동
		// 글 확인페이지 -> 현재 서블릿 페이지로 -> update.jsp 이동
		} else if (action.equals("update")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/update.jsp");
			BoardDTO dto = dao.selectById(Integer.parseInt(boardId));
			request.setAttribute("board", dto);
			request.setAttribute("boardId", boardId);
			request.setAttribute("nickName", nickName);
			dispatcher.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int responserCount = 0;

		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = new BoardDAO();		



		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(responserCount);

	}

}
