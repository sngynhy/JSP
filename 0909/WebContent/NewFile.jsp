<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기화 매개변수 실습</title>
</head>
<body>
	<h2><%= getServletContext().getInitParameter("name3") %></h2>
	<h2><%= getServletContext().getInitParameter("encoding") %></h2>
</body>
</html>