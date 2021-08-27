<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.*"%>
<jsp:useBean id="memberDAO" class="bean.MemberDAO" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<a href="signup.html">회원가입</a> 
	<a href="login.html">로그인</a><br>
	<h2>회원 목록</h2>
	<table border="1">
		<tr>
			<th>NAME</th><th>ID</th><th>PW</th>
		</tr>
		<%
			for (MemberVO vo : memberDAO.getDatas()) {	
		%>
		<tr>
			<td><%= vo.getUserName() %></td>
			<td><%= vo.getUserID() %></td>
			<td><%= vo.getUserPW() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>