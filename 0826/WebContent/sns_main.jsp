<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
</head>
<body>

<%
	String id = request.getParameter("id");

	if (id != null) {
		session.setAttribute("id", id);
	}
%>

<h2>SNS 게시글 등록</h2>
<hr>
<form action="sns_add.jsp" method="post"> <!-- 게시글이 최초로 등록되면 sns_add 페이지에서 set 시킨다! -->
	[<%= session.getAttribute("id") %>] <input type="text" name="msg"> <input type="submit" value="등록하기">
</form>
<ol>
<%
	ArrayList<String> msgs = (ArrayList<String>) application.getAttribute("msgs");
	if(msgs != null){
		for(String v : msgs){
			out.println("<li>" + v + "</li>");
		}
	}
%>
</ol>
</body>
</html>