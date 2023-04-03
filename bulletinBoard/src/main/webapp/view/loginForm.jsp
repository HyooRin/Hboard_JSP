<%@page import="com.HR.board.dto.UserDTO"%>
<%@page import="com.HR.board.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
String userName = request.getParameter("userName");
String email = request.getParameter("email");
String password = request.getParameter("password");

UserDAO userDAO = new UserDAO();
UserDTO user = userDAO.selectByIdAndPassword(userName, email, password);

System.out.println(user);

if (userName != null && email != null && password != null) {

	if (userName.equals(user.getUserName()) && email.equals(user.getEmail()) && password.equals(user.getPassword())) {

		session.setAttribute("userName", userName);
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		response.sendRedirect("/bulletinBoard/board");

	} else {

		out.println("<script> alert('로그인에 실패했습니다!'); location.href='loginForm.jsp'</script>");

	}

}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>Can you join us?</h1>
	<!-- <form action="/bulletinBoard/user?action=login" method="post"> -->
	<form action="/bulletinBoard/view/loginForm.jsp">

		<label for="userName"> Email : <input type="text"
			name="userName" id="userName" required="required">
		</label> <span>@</span> <select name="email">
			<option>naver.com</option>
			<option>gmail.com</option>
			<option>daum.net</option>
			<option>nate.com</option>
			<option>hanmail.com</option>
		</select> <label for="password"> 비밀번호 : <input type="password"
			name="password" id=password required="required">
		</label> <input type="submit" value="LogIn">

	</form>
	<button>
		<a href="/bulletinBoard/view/joinForm.jsp">회원가입</a>
	</button>

</body>
</html>