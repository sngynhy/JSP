<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제 페이지</title>
</head>
<body>
<h2>[<%= session.getAttribute("id") %>님께서 주문 상품 목록 ]</h2>
<hr>
<%
	ArrayList<String> menus = (ArrayList<String>) session.getAttribute("menus");
	ArrayList<Integer> menuCnt = (ArrayList<Integer>) session.getAttribute("menuCnt");
	int totalCnt = (Integer) application.getAttribute("totalCnt");

	if (menus == null) {
		out.println("주문하신 메뉴가 없습니다.");
	} else {
		for (int i=0; i<menus.size(); i++) {
			out.println(menus.get(i) + " " + menuCnt.get(i) + "잔 ");
			out.println("결제 금액: " + session.getAttribute("totalPrice") + "원<br>");
			totalCnt += menuCnt.get(i);
			application.setAttribute("totalCnt", totalCnt);
		}
	}
%>
<br>
<button type="button" onclick="location.href='logout.jsp'">Logout</button>
</body>
</html>