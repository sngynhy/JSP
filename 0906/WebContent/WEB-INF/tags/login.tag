<%@ tag language="java" pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("customer") == null) { // 로그아웃 상태
%>
	<form action="control.jsp" method="post" name="form2">
		<input type="hidden" name="action" value="login">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="login">
				<input type="button" value="sign up" onclick="location.href='signup.jsp'"></td>
			</tr>
		</table>
	</form>
<%
	}
%>