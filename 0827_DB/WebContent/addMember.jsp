<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberVO" class="db.MemberVO" />
<jsp:setProperty property="*" name="memberVO" />
<jsp:useBean id="memberDAO" class="db.MemberDAO" />
<%
	memberDAO.signUp(memberVO);
%>