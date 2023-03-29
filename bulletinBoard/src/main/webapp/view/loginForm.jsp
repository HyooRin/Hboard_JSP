<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>Can you join us?</h1>
	<form action="/bulletinBoard/user?action=insert" method="post">

		<label for="email">
		 ID : 
		<input type="text" name="emailId" id="emailId" required="required">
		</label> 
		<label for="password">
		 비밀번호 : <input type="password" name="password" id=password required="required">
		</label> 
		<input type="submit" value="LogIn">

	</form>
	<button>
	<a href="/bulletinBoard/view/joinForm.jsp">회원가입</a>
	</button>

</body>
</html>