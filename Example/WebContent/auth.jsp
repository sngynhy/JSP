<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// login 페이지로부터 전달받은 데이터 저장
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	
	if (id.toLowerCase().equals("admin")) { // 관리자 아이디 admin 입력
		response.sendRedirect("admin.jsp");
	} else { // 그 외 일반 사용자
		if (application.getAttribute("totalCnt") == null) {
			application.setAttribute("totalCnt", 0);
		}
		/* application.setAttribute("totalCnt", 0); */
		response.sendRedirect("user.jsp");
	}
%>
