<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글</title>
<style type="text/css">


body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
}


table{
	display: flex;
	flex-direction: column;
	border-collapse: collapse;
	margin: auto;
	text-align: center;
}

table th, td{
	
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;


}


.title{
	font-size: 20px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 300px;

}




.content td{
	width: 450px;
	height: 430px;
	display: flex;
	align-items: flex-start;
	
	
}

button {
	background-color: #7755B2;
	margin-right: 10px;
	margin-left: 10px;
	border: none;
	box-shadow: 2px 3px 3px #7755B2;
	border-radius: 5px;
	width: 100px;
	height: 35px;
	
}

button a {
	color: #fff;
	text-decoration: none;
}

button :hover{

}

</style>

</head>
<body>
	<input type="hidden" value="{boardId}">
	<h5>NO.${boardId}</h5>

	<table>
		<tr class="title">
			<th>${board.title}</th>
		</tr>
		<tr class="info">
			<th>writer: ${nickName}   Date : ${board.date}</th>
		</tr>
		<tr class="content">
			<td>${board.content}</td>
		</tr>
		<tr>
		<td>
			<button>
				<a href="/bulletinBoard/boardDetail?action=update&boardId=${boardId}&nickName=${nickName}">글
					수정하기</a>
			</button>
		</td>
		</tr>
	</table>












</body>
</html>