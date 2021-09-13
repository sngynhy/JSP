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
<input type="hidden" name="action" value="trans1">
	<table border="1">
		<tr>
			<td>${data1.id}</td>
			<td>${data1.name}</td>
			<td>${data1.balance}</td>
			<td><input type="number" name="bal" placeholder="금액 입력"></td>
			<td><input type="submit" value="이체하기"></td>
		</tr>
	</table>
</form>

<form action="control.jsp" method="post">
<input type="hidden" name="action" value="trans2">
	<table border="1">
		<tr>
			<td>${data2.id}</td>
			<td>${data2.name}</td>
			<td>${data2.balance}</td>
			<td><input type="number" name="bal" placeholder="금액 입력"></td>
			<td><input type="submit" value="이체하기"></td>
		</tr>
	</table>
</form>

</body>
</html>