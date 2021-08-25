<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%-- isErrorPage="true" : 현재 페이지를 에러 페이지로 설정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 처리 페이지</title>
<style type="text/css">
	#err {
		color: red;
	}
</style>
</head>
<body>
	<%-- <h2>발생 에러: <span id="err"><%= exception %></span></h2> --%>
	<!-- 에러 발생 시 현재 페이지의 내용이 화면에 보여짐 -->
	<h4>수강과목 없음!</h4>
</body>
</html>