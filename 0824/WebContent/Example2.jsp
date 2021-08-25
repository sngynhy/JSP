<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int totalPrice = 0;

	if (request.getMethod().equals("POST")) {
		
		String menu = request.getParameter("menu");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		if(menu.equals("ame")) {
			totalPrice = 2000 * cnt;
		} else if (menu.equals("latte")) {
			totalPrice = 2500 * cnt;
		}
		
	}
%>
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
	<h3>총 금액: <%= totalPrice %></h3>
	
</body>
</html>