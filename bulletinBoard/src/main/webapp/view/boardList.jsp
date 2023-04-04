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

<title>게시판</title>

<style type="text/css">
button {
	background-color: #7755B2;
	margin-right: 10px;
	margin-left: 10px;
	border: none;
	box-shadow: 2px 3px 3px #7755B2;
	border-radius: 5px;
}

.btn-list {
	display: flex;
	justify-content: flex-end;
}

.btn-list ul li a {
	color: #fff;
}

ul {
	display: flex;
}

ul li {
	display: flex;
	list-style: none;
}

a {
	color: black;
	text-decoration: none;
}

.pagination li a:hover {
	background-color: #7755B2;
	color: #fff;
}

.pagination {
	display: flex;
	justify-content: center;
}

.page-link {
	color: #7755B2;
}


</style>


</head>
<body>
	<div class="header">
		<h2>게시글</h2>


		<%
		String userName = (String) session.getAttribute("userName");

		if (userName != null) {
		%>

		<div class="btn-list">
			<ul>
				<li><button>
						<a href="/bulletinBoard/view/writeForm.jsp">글쓰자</a>
					</button></li>
				<li><button>
						<a href="/bulletinBoard/blog">MyBlog</a>
					</button></li>
				<li><button>
						<a href="/bulletinBoard/user">MyUser</a>
					</button></li>
				<li><button>
						<a href="/bulletinBoard/view/loginForm.jsp">로그아웃</a>
					</button></li>
			</ul>
		</div>


		<%
		} else {
		%>

		<div class="btn-list">
			<ul>
				<li><button>
						<a href="/bulletinBoard/view/writeForm.jsp">글쓰자</a>
					</button></li>

				<li><button>
						<a href="/bulletinBoard/view/loginForm.jsp">로그인</a>
					</button></li>
			</ul>
		</div>

		<%
		}
		%>



	</div>

	<table class="table">
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>NAME</th>
			<th>DATE</th>
		</tr>

		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.id}</td>
				<!-- boardId 전송 -->
				<td><a
					href="/bulletinBoard/boardDetail?action=select&boardId=${board.id}&nickName=${board.user.nickName}">${board.title}</a></td>
				<td>${board.user.nickName}</td>
				<td>${board.date}</td>
			</tr>
		</c:forEach>


	</table>

	<ul class="pagination">

		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>

	</ul>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>