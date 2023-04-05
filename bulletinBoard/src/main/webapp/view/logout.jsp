<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
session.invalidate(); // 로그아웃 -> 세선 메모리에서 해제 
response.sendRedirect("/bulletinBoard/board"); // 로그아웃 이후 페이지 이동
%>