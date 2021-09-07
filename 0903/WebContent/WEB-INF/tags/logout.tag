<%@ tag language="java" pageEncoding="UTF-8"%>


<%
	if (session.getAttribute("mem") != null) { // 로그인 상태
%>
	<input type="button" value="logout" onClick="logout()">
<%
	}
%>
