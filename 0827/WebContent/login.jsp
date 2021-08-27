<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lb" class="bean.LoginBean"/> <%-- LoginBean lb = new LoginBean(); --%>
<jsp:setProperty property="*" name="lb"/> <%-- lb.setUserID(); --%>
    <%
   	if (lb.check()) {
   		out.println("<h1>로그인 성공!</h1>");
   	} else {
   		out.println("<h1>로그인 실패!</h1>");
   	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	입력한 ID: <jsp:getProperty property="userID" name="lb"/> <!-- lb.getUserID(); -->
	<br>
	입력한 PW: <jsp:getProperty property="userPW" name="lb"/> <!-- lb.getUserPW(); -->
	<!-- 추후에는 toString오버라이딩을 이용하여 값을 가져오는경우가 많아서 getProperty는 사용 빈도가 낮다 => 표현식으로 대체 사용 -->
</body>
</html>