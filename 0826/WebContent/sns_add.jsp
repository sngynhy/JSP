<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 게시글 set하는 페이지</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = (String) session.getAttribute("id");
	String msg = request.getParameter("msg");
	
	ArrayList<String> msgs = (ArrayList<String>) application.getAttribute("msgs");
	if(msgs == null) {
		msgs = new ArrayList<String>();
		application.setAttribute("msgs", msgs); // 최초등록
	}
	
	msgs.add(id + "님이 [" + msg + "] 등록");
	
	response.sendRedirect("sns_main.jsp");
%>

</body>
</html>