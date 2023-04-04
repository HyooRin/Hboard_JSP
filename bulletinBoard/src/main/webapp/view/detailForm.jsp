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
 

 
 
 <table>
  <tr>
  <th>title</th>
  <td>${board.title}</td>
  
  <th>writer</th>
  <td>${nickName}</td>
  
  <th>Date</th>
  <td>${board.date}</td>
  </tr>
  
  <tr>
  <th>content</th>
  <td>${board.content}</td>
  </tr>
  
  
 </table>
 
 <button><a href="/bulletinBoard/boardDetail?action=update&boardId=${boardId}&nickName=${nickName}">글 수정하기</a></button>


			
			
					
								
			
			


	


</body>
</html>