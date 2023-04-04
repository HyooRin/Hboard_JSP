<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Insert title here</title>

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
input[type="text"], input[type="submit"], select {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

input[type="password"] {
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 300px;
}

input[type="submit"] {
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

label {
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

.button-submit {
	display: flex;
}

#userName {
	margin-left: 20px;
}
</style>

</head>
<body>

	<h1>마이페이지</h1>

	<input type="hidden" value="${user.id}">


	<table>
		<tr>
			<th>email</th>
			<td>${user.userName}@ ${user.email}</td>
		</tr>

		<tr>
			<th>password</th>
			<td>${user.password}</td>
		</tr>

		<tr>
			<th>nickName</th>
			<td>${user.nickName}</td>
		</tr>


	</table>





	<!--<button><a href="/bulletinBoard/boardDetail?action=update&boardId=${boardId}">글 수정하기</a></button>-->







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>




</body>
</html>