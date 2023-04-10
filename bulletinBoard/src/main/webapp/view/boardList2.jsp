<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Home - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        





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
    
    
    

</body>
</html>