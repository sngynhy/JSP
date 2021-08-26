<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
<%-- <%
	session.invalidate();
	if (application.getAttribute("totalCnt") == null) {
		application.setAttribute("totalCnt", 0);
	}
%> --%>
<h2>Sign In</h2>
<form action="auth.jsp" method="post" name="form">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id" required></td>
		</tr>
	</table>
	<input type="submit" value="Login" name="btn">
</form>

</body>
</html>