<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
				<td><a
					href="/bulletinBoard/boardDetail?action=select&boardId=${board.id}">${board.title}</a></td>
				<td>${user.nickName}</td>
				<td>${board.date}</td>
			</tr>
		</c:forEach>

	</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>



</body>
</html>