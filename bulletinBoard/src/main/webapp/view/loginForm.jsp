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

<style type="text/css">
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	flex-direction: column;
}

form {
	display: flex;
	flex-direction: column;
}

/*속성 선택자 - 태그[속성="값"]*/
input[type="text"], input[type="submit"], select
	{
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
	
}

input[type="password"]{

	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 300px;
}

input[type="submit"]  {
	background-color: #7755B2;
	color: #fff;
	border: none;
	cursor: pointer;
	width: 150px;
	
}
/*속성선택자 + 가상선택자*/
input[type="submit"]:hover {
	background-color: #1E6EB7
}

label{
	margin-bottom: 5px;
	font-weight: bold;

}


input[type="submit"] {
    background-color: #7755B2;
    color: #fff;
    border: none;
    cursor: pointer;
    margin: 10px;
    
 }
button {
	background-color: #7755B2;
	color: #fff;
	border: none;
	cursor: pointer;
	margin-top: 15px;
	font-weight: bold;
	padding: 20px;

}

.button-submit{

	display: flex;
}

#userName{
	margin-left: 20px;
}
</style>
<script type="text/javascript">
	
	function goJoinForm() {
		location.href="joinForm.jsp";
	}

</script>

</head>
<body>
	<h1>Can you join us?</h1>

	<form action="/bulletinBoard/view/loginForm.jsp" method="post">

		<label for="userName"> Email : <input type="text"
			name="userName" id="userName" required="required"> <span>@</span>
			<select name="email">
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
				<option>nate.com</option>
				<option>hanmail.com</option>
		</select>
		</label> <label for="password"> 비밀번호 : <input type="password"
			name="password" id=password required="required">
		</label>
		<div class="button-submit"> 
		<input type="submit" value="LogIn"> 
		<input type="submit" value="join" onclick="goJoinForm()">
		</div>
	</form>
	<br>
	<!-- <label><a href="/bulletinBoard/view/joinForm.jsp" class="long-style"><button>회원가입</button></a></label>
	 -->
</body>
</html>