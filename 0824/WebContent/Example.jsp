<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="coffee" class="test.CoffeeBean"/>
<jsp:setProperty property="*" name="coffee"/>
<!DOCTYPE html>
<% coffee.totalPrice(); %>
<html>
<head>
<meta charset="UTF-8">
<title>커피 키오스크</title>
</head>
<body>

	<h2>메뉴 선택</h2>
	<form method="POST" name="form1">
		<select name="menu">
			<option selected value="ame">아메리카노 2000원</option>
			<option value="latte">카페라떼 2500원</option>
		</select>
		<input type="text" name="cnt" id="cnt" placeholder="수량 입력">
		<input type="submit" value="결제하기" name="btn">
	</form>
	<hr>
	<h3>총 금액: <jsp:getProperty property="totalPrice" name="coffee"/></h3>
	

</body>
</html>