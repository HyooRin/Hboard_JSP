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

import com.HR.board.dao.BoardDAO;
import com.HR.board.dao.UserDAO;
import com.HR.board.dto.BoardDTO;

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

//			// 파일 업로드 처리
//			Part filePart = request.getPart("file");
//			System.out.println("컨텐츠확인 :" + filePart.getContentType());
//
//			InputStream fileContent = filePart.getInputStream();
//			OutputStream outputStream = null;
//
//			try {
//				// 파일명 중복 방지
//				UUID uuid = UUID.randomUUID();
//				String fileName = uuid + "_" + filePart.getSubmittedFileName();
//				// 폴더 생성
//				String saveDirectory = "C:/bulletinBoard";
//				File dir = new File(saveDirectory);
//				if (!dir.exists()) {
//					dir.mkdirs();
//				}
//
//				File file = new File("C:/bulletinBoard/", fileName);
//				// 출력 스트림
//				outputStream = new FileOutputStream(file);
//
//				byte[] buffer = new byte[1024];
//				int length;
//				while ((length = fileContent.read(buffer)) != -1) {
//					outputStream.write(buffer, 0, length);
//				}
//				System.out.println("file 생성완료");
//
//			} catch (Exception e) {
//
//			} finally {
//				fileContent.close();
//				if (outputStream != null) {
//					outputStream.flush();
//					outputStream.close();
//				}
//				response.sendRedirect("/demo12/home.jsp");
//
//			}

			// 글 insert
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
