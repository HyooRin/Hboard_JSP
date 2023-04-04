<%@page import="com.HR.board.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <%

	// 로그인 세션
		String userName = (String)session.getAttribute("userName");
 		
 		 
 
 	
	if(userName == null){
		response.sendRedirect("loginForm.jsp");
	}
 		
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

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

button,input,optgroup,select,textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit
}



</style>


</head>
<body>
	<h1>글쓰자</h1>
	<form action="/bulletinBoard/board?action=insert" method="post">
		<label for="title"> 제목 : 
		<input type="text" name="title"	id="title" required="required"> 
		</label>
		
		<label for=userId> 닉네임(userId) : <input type="number" name="userId" id="userId" value="" ></label>
		
		<!-- <label for="content"> 내용 : 
		<input type="text" name="content" id="content" required="required">
		</label>
		 --> 
		content :
		<textarea rows="" cols="">
		
		</textarea> 
		 
		
		 
		<input type="submit" value="SAVE">

	</form>



</body>
</html>