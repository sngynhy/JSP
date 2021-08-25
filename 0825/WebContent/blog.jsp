<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLOG</title>
</head>
<body>

<%
	int cnt = (Integer) application.getAttribute("cnt");
	String id = (String) session.getAttribute("id");
	cnt++;
	application.setAttribute("cnt", cnt);
%>

<h1><%= session.getAttribute("id") %>'s BLOG</h1>
<h2>오늘 방문자 수 : <%= cnt %></h2>

</body>
</html>