<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, model.member.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDAO" class="model.member.MemberDAO" />
<jsp:useBean id="memberVO" class="model.member.MemberVO" scope="session" />
<jsp:setProperty property="*" name="memberVO" />

<%
	String action = request.getParameter("action");

	if (action.equals("login")) {
		MemberVO mem = memberDAO.login(memberVO);
		if (mem != null) {
			session.setAttribute("mem", mem);
			response.sendRedirect("control.jsp?action=main");
		} else {
			out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
		}
	}

	else if (action.equals("logout")) {
		session.invalidate();
		pageContext.forward("main.jsp");
	}

	else if (action.equals("main")) {
		pageContext.forward("main.jsp");
	}
%>