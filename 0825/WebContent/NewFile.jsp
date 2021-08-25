<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%-- <%@ ... %> : 지시어 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= new Date() %></h2> <%-- <%= new Date() %> : JSP 표현식 --%>
	<%-- JSP 표현식 => 서블릿 파일(NewFile_jsp.java)로 변환되었을때,
	서블릿 파일 내부에서 표현식 부분은 out.println(new Date());와 같은 형식이다. --%>
</body>
</html>