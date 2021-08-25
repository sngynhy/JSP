<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 방식</title>
</head>
<body>
	
	<%-- <jsp:forward page="result.jsp">
		<jsp:param value="sngynhy@google.com" name="email"/> 추가하여 보낼 데이터
	</jsp:forward> --%>
	
	<jsp:forward page="result.jsp" />
	
</body>
</html>