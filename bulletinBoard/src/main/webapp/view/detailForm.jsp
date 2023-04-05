<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글</title>
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

table {
	border: 1px solid black;
	border-radius: 5px;
	width: 500px;
	height: 500px;
	 border-collapse: collapse;
}

/*table th, td{

	border-bottom: 1px solid black; 
}*/

.content {
	display: flex;
	
	height: 500px;
}

.content p {
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

button a{

	color: #fff;

}


</style>

</head>
<body>
	<input type="hidden" value="{boardId}">


	<h5>NO.${boardId}</h5>
		

	<table>
		<tr class="info" style="border-bottom: 1px solid #000">

			<td colspan="4">
			<h2>${board.title}</h2>
			</td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr style="border-bottom: 1px solid #000">
			<th>writer:</th>
			<td>${nickName}</td>
			<th>Date :</th>
			<td>${board.date}</td>
		</tr>
		<tr class="content">

			<td colspan="4"><p>${board.content}</p></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>



	<button>
		<a href="/bulletinBoard/boardDetail?action=update&boardId=${boardId}&nickName=${nickName}">글
			수정하기</a>
	</button>

</body>
</html>