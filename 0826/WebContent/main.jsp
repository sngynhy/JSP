<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HG AIR</title>
</head>
<body>

<%= session.getAttribute("id") %>님 환영합니다!
<br><br><br>
<h2>항공권 목록</h2>
<form action="addProduct.jsp" name="form1" method="post">
	<h4>출발지</h4>
	<select name="product">
		<option selected>서울/김포</option>
		<option>인천</option>
		<option>제주</option>
		<option>부산</option>
	</select>
	<hr>
	<h4>도착지</h4>
	<select name="product">
		<option selected>제주</option>
		<option>부산</option>
		<option>서울/김포</option>
		<option>인천</option>
	</select>
	<hr>
	<h4>날짜/시간</h4>
	<select name="product">
		<option selected>2021/08/26 12:00</option>
		<option>2021/08/26 13:20</option>
		<option>2021/08/26 14:30</option>
		<option>2021/08/26 15:10</option>
		<option>2021/08/26 18:00</option>
		<option>2021/08/26 21:30</option>
	</select>
	<input type="number" value="1" name="cnt">
	<input type="submit" value="상품 추가하기">
</form>
<hr>
<a href="buy.jsp">예약하기</a>

</body>
</html>