<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>

<h2>SNS Login</h2>
<form action="sns_auth.jsp" method="post" name="form">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name="pw"></td>
		</tr>
	</table>
	<input type="submit" value="login" name="btn">
</form>
</body>
</html>