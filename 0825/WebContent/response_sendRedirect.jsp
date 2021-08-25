<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리다이렉팅 방식</title>
</head>
<body>
	
	<% response.sendRedirect("result.jsp"); %> <%-- sendRedirect() : 페이지 전환 --%>
	<%-- response를 주체로 한 .sendRedirect() 방식은
		 jsp 액션 태그(포워딩)와 다르게, 페이지를 전환/이동 할때에
		 전환/이동을 위한 request, reponse 객체를 매번 새로 생성한다!
		 => result.jsp로 전환되기 전 현재 페이지의 데이터는 사라지므로 새로운 페이지로 전환 시 null을 반환한다.
	 --%>
	
</body>
</html>