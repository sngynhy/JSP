<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결제</title>
</head>
<body>

	주문하신 메뉴는 [${param.menu}] x ${param.cnt}잔 입니다.<br>
	총 결제 금액은 ${menuBean.pay(param.menu, param.cnt)}원 입니다.

</body>
</html>