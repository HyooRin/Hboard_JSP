<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>My Blog</h2>


	<!-- http://localhost:8080/bulletinBoard/boardDetail -->

	<table class="table">
		<tr>
			<th>NO</th>
			<th>TITLE</th>			
			<th>NAME</th>
			<th>DATE</th>
		</tr>

	   <c:forEach var="board" items="${board}"> 
		<tr>
			<td>${board.id}</td>
			<!-- boardId 전송 -->
			<td><a href="/bulletinBoard/boardDetail?action=select&boardId=${board.id}">${board.title}</a></td>			
			<td>${board.userId}</td>
			<td>${board.date}</td>
		</tr>
		</c:forEach>  

	</table>

	

</body>
</html>