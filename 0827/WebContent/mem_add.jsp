<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberVO"	class="bean.MemberVO" />
<jsp:setProperty property="*" name="memberVO"/>
<jsp:useBean id="memberDAO" class="bean.MemberDAO" scope="application" />
<%
	memberDAO.addMember(memberVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원가입</h2>
<hr>
<table border="1">
	<tr>
		<td>이름</td>
		<td><%=memberVO.getUserName()%></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=memberVO.getUserID()%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=memberVO.getUserPW()%></td>
	</tr>
</table>
<hr>
<a href="mem_main.jsp">처음으로</a>

</body>
</html>