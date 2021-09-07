<%@ tag language="java" pageEncoding="UTF-8" import="model.customer.*"%>
<%
	CustomerVO customer = (CustomerVO) session.getAttribute("customer");
%>

<h1><jsp:doBody /></h1>

<table border="1">
	<tr>
		<td>ID</td>
		<td><input type="text" name="id" value="<%=customer.getId()%>"></td>
	</tr>
	<tr>
		<td>PW</td>
		<td><input type="text" name="pw" value="<%=customer.getPw()%>"></td>
	</tr>
	<tr>
		<td>NAME</td>
		<td><input type="text" name="name" value="<%=customer.getName()%>"></td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td><input type="text" name="address" value="<%=customer.getAddress()%>"></td>
	</tr>
	<tr>
		<td>PHONE NUMBER</td>
		<td><input type="text" name="phone_num" value="<%=customer.getPhone_num()%>"></td>
	</tr>
</table>