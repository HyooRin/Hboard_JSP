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
	display:flex;
	flex-direction: column;
	align-items: center;
	border-radius: 5px;
	width: 500px;
	height: 70vh;
}

#title {
	font-size: 20px;
	
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
tr{
	display:flex;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title{
	border:none;
}
#title:hover{
	border:1px solid black;
}

input[type="submit"]{
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #7755B2;	
	margin-right: 10px;
	margin-left: 10px;
	border: none;
	box-shadow: 2px 3px 3px #7755B2;
	border-radius: 5px;
	width: 100px;
	height: 35px;	
	color: white;
}

textarea{
	font-size: 16px; 
	word-spacing: 10px;
	line-height: 3;
}

</style>
</head>
<body>
	<h1 style="margin-top:10%;">글수정하자</h1>
	<form action="/bulletinBoard/board?action=update" method="post">
		<input type="hidden" name="id" value="${boardId}">
		<!-- value 동적으로  -->
		<table>
			<tr>
				<th><input type="text" name="title" id="title" value="${board.title}"></th>
				<th>writer :
					<input type="hidden" name="userId"	value="${board.userId}">${nickName}
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="30" cols="50"> ${board.content}</textarea>
				</td>		
			</tr>
			<tr>
				<td><input type="submit" value="update"></td>			
			</tr>
		</table>		
	</form>
<!-- 
<input type="text"	name="content" id="content" value="${board.content}">
 -->
</body>
</html>