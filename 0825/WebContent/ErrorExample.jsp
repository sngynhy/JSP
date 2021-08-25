<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%> <%-- 페이지 지시어 --%>
<%-- errorPage="error.jsp" 만약 현재 페이지에서 에러가 발생했다면 error.jsp를 불러옴(페이지 이동 X) --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String str = "test";
	int i=Integer.parseInt(str);
	%>
</body>
</html>