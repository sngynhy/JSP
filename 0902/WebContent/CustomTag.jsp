<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
		<%-- url: 핸들러 클래스 기반일 때 사용 / 파일 기반은 tagdir로 설정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 태그</title>
</head>
<body>

<h1><mytag:print /></h1>
<h6><mytag:print /></h6>

<hr>

<mytag:printDataBean border="1" bgcolor="pink">커스텀 태그 실습중!</mytag:printDataBean>

</body>
</html>