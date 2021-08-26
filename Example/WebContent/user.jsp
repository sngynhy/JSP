<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");
%>

<%= id %>님, 반갑습니다!

<h2>[ 메뉴 목록 ]</h2>
<form action="add.jsp" name="form1" method="post">
	<select name="menu">
		<option selected>유스베리</option>
		<option>히비스커스</option>
		<option>자스민</option>
		<option>잉글리쉬브랙퍼스트</option>
		<option>TWG 1837</option>
	</select>
	<input type="number" value="1" name="cnt" min="1" max="5">
	<input type="submit" value="메뉴 담기">
</form>
<br>
<button type="button" onclick="location.href='buy.jsp'">결제하기</button>
<!-- <a href="buy.jsp">결제하기</a> -->
</body>
</html>