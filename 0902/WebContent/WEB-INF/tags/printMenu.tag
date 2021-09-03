<%@ tag language="java" pageEncoding="UTF-8"%>

<h1><jsp:doBody /></h1>
<hr>

<jsp:useBean id="menuBean" class="model.MenuBean" scope="session" />
<select name="menu">
	<%
		for (String v : menuBean.getProduct()) {
	%>
		<option><%=v%></option>
	<%
		}
	%>
</select>