<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 내장 객체</title>
</head>
<body>

<%
	application.setAttribute("username", "홍길동");
	application.setAttribute("cnt", 1); // 블로그 방문자
%>

<a href="hong.jsp">홍길동님의 블로그</a>
</body>
</html>