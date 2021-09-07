<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<form action="control.jsp" method="post" name="form1">
	<input type="hidden" name="action" value="update">
	<%-- <mytag:myinfoedit>나의 정보 수정</mytag:myinfoedit> --%>
	<table border="1">
	<tr>
		<td>ID</td>
		<td><input type="text" name="id" value="${customer.id}"></td>
	</tr>
	<tr>
		<td>PW</td>
		<td><input type="text" name="pw" value="${customer.pw}"></td>
	</tr>
	<tr>
		<td>NAME</td>
		<td><input type="text" name="name" value="${customer.name}"></td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td><input type="text" name="address" value="${customer.address}"></td>
	</tr>
	<tr>
		<td>PHONE NUMBER</td>
		<td><input type="text" name="phone_num" value="${customer.phone_num}"></td>
	</tr>
</table>
	<input type="submit" value="수정하기">
</form>
</body>
</html>