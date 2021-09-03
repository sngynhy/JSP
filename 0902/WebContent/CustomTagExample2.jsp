<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 태그 실습 - 로그인/로그아웃</title>
</head>
<body>
	<form action="control.jsp" method="post" name="form1">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<input type="submit" value="로그인">
		</table>
	</form>
</body>
</html>