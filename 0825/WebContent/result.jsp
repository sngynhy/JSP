<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>

<%-- <h1><%= request.getParameter("username") %></h1>
<h1><%= request.getParameter("email") %></h1> --%>

<h1><%= request.getParameter("username") %></h1>
<h1><%= request.getParameter("grade") %></h1>
<h1>
<%
	String data[] = request.getParameterValues("subject"); // .getParameterValues() : string 배열로 반환
	// System.out.println(data); // 로깅 기법

	if (data != null) {
	   out.println("수강하는 과목");
	   for (String v : data) {
	      out.println(v + "<br>");
	   }
	} else {
	   out.println("수강과목없음!");
	}
%>
</h1>


</body>
</html>