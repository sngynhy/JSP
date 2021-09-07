<%@ tag language="java" pageEncoding="UTF-8"%>


<%
	if (session.getAttribute("customer") != null) { // 로그인 상태
%>
	<form action="control.jsp" method="post" name="form3">
		<input type="hidden" name="action" value="logout">
		<input type="submit" value="logout">
		<input type="button" value="mypage" onclick="location.href='mypage.jsp'">
	</form>
<%
	}
%>
