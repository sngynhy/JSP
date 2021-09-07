<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- url: 자원 / var : 저장소 , jsp:include와 같은 기능-->
		<!-- 내부자원 -->
<c:import url="NewFile.jsp" var="innerURL" />
<c:out value="${innerURL}" escapeXml="false"></c:out>

<hr>
		<!-- 외부자원 -->
<c:import url="https://www.naver.com" var="outerURL" />
<c:out value="${outerURL}" escapeXml="false"></c:out>
</body>
</html>