<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
<style type="text/css">
	#box1 {
		border: 1px solid red;
	}
	#box2 {
		border: 1px solid blue;
	}
</style>
</head>
<body>
	<!-- include : 페이지를 추가하는 지시어 -->
	<!-- 협업에 유리! 외부의 페이지를 추가하여 하나의 서블릿으로 구성되도록 -->
	<!-- 단, 콘텐츠가 자주 바뀌는 파일들은 부적합 ex) 뉴스 등 -->
	<%@ include file = "menu.jsp" %>
	<hr>
	<div id="box1"><%@ include file = "news.jsp" %></div>
	<div id="box2"><%@ include file = "shopping.jsp" %></div>
	
</body>
</html>