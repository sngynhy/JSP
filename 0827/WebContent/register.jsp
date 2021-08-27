<%@page import="java.util.ArrayList, bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberVO" class="bean.MemberVO" />
<jsp:setProperty property="*" name="memberVO"/>
<jsp:useBean id="memberDAO" class="bean.MemberDAO" scope="application" />
			<%--scope="application" 설정해야 서버 기준 데이터가 계속 유지됨 --%>
<%
	memberDAO.addMember(memberVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>
<body>
	
	<h2>회원 정보</h2>
	<table>
		<tr>
			<td>Name</td>
			<td><%= memberVO.getUserName() %></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><%= memberVO.getUserID() %></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><%= memberVO.getUserPW() %></td>
		</tr>
	</table>
	<hr>
	<a href="result.jsp">회원 목록</a>
</body>
</html>