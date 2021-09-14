<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="control.jsp" method="post">
<input type="hidden" name="action" value="signup">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="u_id" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" required></td>
		</tr>
	</table>
	<input type="submit" value="회원가입">
</form>
</body>
</html>