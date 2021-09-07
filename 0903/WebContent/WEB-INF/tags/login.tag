<%@ tag language="java" pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("mem") == null) { // 로그아웃 상태
%>

<%
	} else {
%>
	<div class="content" style="display: none">
<%
	}
%>