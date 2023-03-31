<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<h1>글수정하자</h1>
	<form action="/bulletinBoard/board?action=update" method="post">
		<!-- value 동적으로  -->
		<input type="hidden" name="id" value="${boardId}">
		<label for="title">
		 제목 :  
		<input type="text" name="title" id="title" value="${board.title}">
		</label> 
		<a>작성자 :
		<input type="text" name="nickName" value="${board.nickName}">
		 ${board.nickName}
		</a>
		<label for="content">
		 내용 :
		 <input type="text" name="content" id="content" value="${board.content}" >
		</label>
	
		<input type="submit" value="update">

	</form>

</body>
</html>