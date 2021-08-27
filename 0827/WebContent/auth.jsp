<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberVO" class="bean.MemberVO" /> <!-- MemberVO 객체 생성 -->
<jsp:setProperty property="userID" name="memberVO" /> <!-- 입력받은 id 저장 -->
<jsp:setProperty property="userPW" name="memberVO" /> <!-- 입력받은 pw 저장 -->
<jsp:useBean id="memberDAO" class="bean.MemberDAO" scope="application"/> <!-- MemberDAO 객체 생성 -->

<%
	if (memberDAO.loginCheck(memberVO)) {
		out.println("<script>alert('로그인 성공!')</script>");
		response.sendRedirect("result.jsp");
	} else {
		out.println("<script>alert('로그인에 실패하였습니다. ID 혹은 PW를 다시 확인하세요.')</script>");
		response.sendRedirect("login.html");
	}
%>