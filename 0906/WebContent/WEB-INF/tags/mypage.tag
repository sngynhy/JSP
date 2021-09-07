<%@ tag language="java" pageEncoding="UTF-8" import="model.customer.*"%>
<%
	CustomerVO customer = (CustomerVO) session.getAttribute("customer");
%>

<h1><jsp:doBody /></h1>

<table border="1">
	<tr>
		<td>ID</td>
		<td><%=customer.getId()%></td>
	</tr>
	<tr>
		<td>PW</td>
		<td><%=customer.getPw()%></td>
	</tr>
	<tr>
		<td>NAME</td>
		<td><%=customer.getName()%></td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td><%=customer.getAddress()%></td>
	</tr>
	<tr>
		<td>PHONE NUMBER</td>
		<td><%=customer.getPhone_num()%></td>
	</tr>
</table>