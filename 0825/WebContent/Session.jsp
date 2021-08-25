<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장 객체</title>
</head>
<body>

<%
	if(session.isNew()) { // isNew() : 새로운 세션이니?
		out.println("<script>alert('세션을 설정함!')</script>");
		session.setAttribute("user", "sngynhy");
		session.setMaxInactiveInterval(5); // 시간 5초로 설정 -> 세션 정보 5초동안 유지되도록
		// "sngynhy"를 "user"로 세션 단위로 저장
		//  == 브라우저가 종료되지 않는 한 정보가 사라지지 않는다. => 브라우저 단위로 스코프 형성
		//  == 시간 개념, 기본 30분 (1800초)동안 유지 - .setMaxInactiveInterval() : 시간 설정 가능
	}
%>

<%= session.getAttribute("user") %>님, 환영합니다!<br>
<%= session.getMaxInactiveInterval() %> 초동안 세션정보가 유지됩니다.<br>

</body>
</html>