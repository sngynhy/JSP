<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 주문</title>
</head>
<body>

	<form mothod="post" action="ELExample2.jsp">
		<jsp:useBean id="menuBean" class="model.message.MenuBean" scope="session" />
		<select name="menu">
			<%
				for (String v : menuBean.getProduct()) {
			%>
				<option><%=v%></option>
			<%
				}
			%>
		</select>
		<input type="number" min="1" name="cnt" placeholder="수량 선택" required>
		<input type="submit" value="결제하기">
	</form>
	
</body>
</html>