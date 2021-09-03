<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 태그 실습</title>
</head>
<body>

<form mothod="post" action="ELExample2.jsp">
	<mytag:printMenu>메뉴 주문</mytag:printMenu>
	<input type="number" min="1" name="cnt" placeholder="수량 선택" required>
	<input type="submit" value="결제하기">
</form>
</body>
</html>