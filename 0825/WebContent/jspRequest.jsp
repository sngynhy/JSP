<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 내장 객체 - request 결과 페이지</title>
</head>
<body>

이름: <%= request.getParameter("username") %><br>
학년: <%= request.getParameter("grade") %><br>

<%
	String data[] = request.getParameterValues("subject");

	out.println("<table border='1'>");
	
	if (data != null) {
	   out.println("<tr><td>수강하는 과목 </td></tr>");
	   for (String v : data) {
	      out.println("<tr><td>"+v+"</td></tr>");
	   }
	} else {
	   out.println("<tr><td>수강과목없음!</td></tr>");
	}
	
	out.println("</table>");
%>
</body>
</html>