<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

	<button type="button" onclick="location.href='signup.jsp'">회원가입</button>
	<form action="control.jsp" method="post" name="form1">
	<input type="hidden" name="action" value="login">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td colspan='2' align="right"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>