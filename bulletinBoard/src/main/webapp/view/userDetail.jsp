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
 <input type="hidden" value="${user.id}">
<ul>
 <li>${user.userName}</li>
 <li>${user.email}</li>
 <li>${user.password}</li>
 <li>${user.nickName}</li>
 </ul>
 
 <!--<button><a href="/bulletinBoard/boardDetail?action=update&boardId=${boardId}">글 수정하기</a></button>-->

</body>
</html>