<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<h2>관리자 페이지입니다.</h2>
<hr>
<h3>오늘의 주문량 : <%= application.getAttribute("totalCnt") %></h3>
</body>
</html>