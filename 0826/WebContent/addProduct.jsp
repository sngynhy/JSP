<%@page import="java.util.ArrayList"%>
<%@page import="sun.security.util.ArrayUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String product = request.getParameter("product");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	ArrayList<String> list = (ArrayList) session.getAttribute("list");
	if (list == null) {
		list = new ArrayList<String>();
		session.setAttribute("list", list);
	}
	list.add(product); // 사용자가 추가한 상품을 구매목록 리스트에 추가
%>

<script type="text/javascript">
	alert("<%= product %> 상품이 추가되었습니다!");
	history.go(-1); // 페이지 뒤로 가기
</script>
</body>
</html>