<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="bbb.jsp" method="post">
		<select name="menu">
			<c:forEach var="v" items="${coffee}">
				<option>${v}</option>
			</c:forEach>
		</select>
		<input type="submit" value="제출">
	</form>
</body>
</html>