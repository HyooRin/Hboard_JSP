<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰자</h1>
	<form action="/bulletinBoard/board?action=insert" method="post">

		<label for="title">
		 제목 :  
		<input type="text" name="title" id="title" required="required">
		</label> 
		<label for="content">
		 내용 :
		 <input type="text" name="content" id="content" required="required">
		</label> 
		<label for="nickName">
		 닉네임 :
		 <input type="text" name="nickName" id="nickName" required="required">
		</label> 
	
		<input type="submit" value="SAVE">

	</form>
	
 

</body>
</html>