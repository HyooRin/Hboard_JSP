<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

form {
	border: 1px solid black;
	border-radius: 5px;
	width: 500px;
	height: 500px;
}

#title {
	font-size: 20px;
	
}

a {
	font-size: 15px;
}

#content {
	width: 450px;
	height: 430px;
}

label{

	padding: 10px;
	margin: 10px;
	justify-content: center;
	align-items: center;
	
}

input[type="submit"]{
	display: flex;
	justify-content: center;
	align-items: center;	
}
</style>
</head>
<body>
	<h1>글수정하자</h1>
	<form action="/bulletinBoard/board?action=update" method="post">
		<!-- value 동적으로  -->
		<input type="hidden" name="id" value="${boardId}"> 
		<label for="title">
		<input type="text" name="title" id="title" value="${board.title}">
		</label> 
		<a>writer :
		<input type="hidden" name="userId"	value="${board.userId}"> ${nickName}
		</a> 
		<br>
		<br>
		<label for="content"> 
		<input type="text"	name="content" id="content" value="${board.content}">
		</label>
		<br>
		<input type="submit" value="update">
	</form>

</body>
</html>