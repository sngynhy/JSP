<%@page import="java.util.ArrayList, model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 메뉴 추가</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String menu = request.getParameter("menu");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	/* System.out.println(menu); */
	
	int price = new MenuDAO().select(menu);
	int totalPrice = cnt * price;
	
	/* System.out.println(cnt); */
	ArrayList<String> menus = (ArrayList<String>) session.getAttribute("menus");
	ArrayList<Integer> menuCnt = (ArrayList<Integer>) session.getAttribute("menuCnt");
	
	if (menus == null || menuCnt == null) {
		menus = new ArrayList<String>();
		session.setAttribute("menus", menus);
		
		menuCnt = new ArrayList<Integer>();
		session.setAttribute("menuCnt", menuCnt);
		
		session.setAttribute("totalPrice", totalPrice);
	}
	menus.add(menu);
	menuCnt.add(cnt);
	%>
	<script type="text/javascript">
		alert("<%= menu %>티 <%= cnt %>잔이 주문 목록에 추가되었습니다.");
		history.go(-1);
	</script>
	<%
%>

</body>
</html>