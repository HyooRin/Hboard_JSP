<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글</title>
</head>
<body>
 <input type="hidden" value="{boardId}">
 <li>${board.title}</li>
 <li>${board.content}</li>
 <li>${board.nickName}</li>
 <li>${board.date}</li>
 
 
 <button><a href="/bulletinBoard/boardDetail?action=update&boardId=${boardId}">글 수정하기</a></button>


			
			
					
								
			
			


	


</body>
</html>