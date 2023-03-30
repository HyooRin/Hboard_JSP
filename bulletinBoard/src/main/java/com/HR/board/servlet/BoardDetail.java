package com.HR.board.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HR.board.dao.BoardDAO;
import com.HR.board.dto.BoardDTO;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/boardDetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String boardId = request.getParameter("borderId");
		System.out.println("boardId : " + boardId);
		
		// DAO - SELECT WHERE = ID; 
		// boardDetail.jsp < --- 값 
		
		BoardDAO dao = new BoardDAO();		
		
		BoardDTO dto = dao.selectById(Integer.parseInt(boardId));	
		
		System.out.println(dto);
		
		request.setAttribute("board", dto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/detailForm.jsp");
		dispatcher.forward(request, response);
		

		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
