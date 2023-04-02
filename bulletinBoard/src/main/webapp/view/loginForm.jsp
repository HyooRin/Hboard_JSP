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
	<form action="/bulletinBoard/user?action=login" method="Get">

		<label for="userName">
		 Email : 
		<input type="text" name="userName" id="userName" required="required">
		</label> 

		 <span>@</span>
		 
		 <select name="email" >
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
				<option>nate.com</option>
				<option>hanmail.com</option>
		 </select>		
		
		
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