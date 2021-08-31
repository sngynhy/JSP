<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.*"%>
<jsp:useBean id="memberVO" class="db.MemberVO" />
<jsp:setProperty property="*" name="memberVO" />
<jsp:useBean id="memberDAO" class="db.MemberDAO" scope="application"/>
<%
	boolean check = memberDAO.signIn(memberVO);
	if (check) { // 세션 scope로 로그인 인증 정보 저장
		%>
		<jsp:useBean id="login" class="db.MemberVO" scope="session" />
		<%
		response.sendRedirect("order.jsp");
	} else {
		response.sendRedirect("Signin.html");
	}
%>
<%--
<%
   MemberVO res=dao.login(vo);
   if(res!=null){ // 세션 scope로 로그인 인증정보를 저장!
      out.println("로그인 성공!<br>");
   }
   else{
      out.println("로그인 실패!<br>");
   }
%>
 --%>
