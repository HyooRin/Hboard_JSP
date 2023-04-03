<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"> 

<title>게시판</title>

<style type="text/css">

button{
	background-color: #7755B2;
	
}

ul li a{	
	color: #fff;
}

ul{
	display: flex;

}



ul li {
	display: flex;
	list-style: none;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}


</style>


</head>
<body>
    <div class="page-container">
	<h2>게시글</h2>
	</div>

	<!-- http://localhost:8080/bulletinBoard/boardDetail -->
    <div class ="btn-list">
    
    <ul>
	 <li><button><a href="/bulletinBoard/view/writeForm.jsp" >글쓰자</a></button></li>
	 <li><button><a href="/bulletinBoard/blog">MyBlog</a></button></li>
	 <li><button><a href="/bulletinBoard/user">MyUser</a></button></li>
     <li><button><a href="/bulletinBoard/view/loginForm.jsp">로그인</a></button></li>	 
	 </ul>
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
			<td><a href="/bulletinBoard/boardDetail?action=select&boardId=${board.id}">${board.title}</a></td>			
			<td>${board.userId}</td>
			<td>${board.date}</td>
		</tr>
		</c:forEach>

	   
	</table>
	

	

	
	<div class ="footer">
	 <ul class="pagination">
	 <li><a href="#">1</a></li>
	 <li><a href="#">2</a></li>
	 <li><a href="#">3</a></li>
	 <li><a href="#">4</a></li>	
	 </ul>	
	</div>
    
    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>