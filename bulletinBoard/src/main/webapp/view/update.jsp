<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<h1>글수정하자</h1>
	<form action="/bulletinBoard/board?action=insert" method="post">

		<!-- value 변경 -->
		<input type="hidden" name="id" value="1">
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
	
		<input type="submit" value="update">

	</form>
	
 

</body>
</html>