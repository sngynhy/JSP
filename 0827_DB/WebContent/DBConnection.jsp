<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user="sngynhy";
	String password="qwer";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(url, user, password);
		
		String sql = "insert into member (name, id, pw) values (?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("id"));
		pstmt.setString(3, request.getParameter("pw"));
		
		if (request.getParameter("name") != null && request.getParameter("name") != null && request.getParameter("name") != null) {
			pstmt.executeUpdate();
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<form action="DBConnection.jsp" method="post">
	<table>
		<tr>
			<td>NAME</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td><input type="submit" value="회원가입"></td>
		</tr>
	</table>
</form>
<hr>
<h2>가입 회원 목록</h2>
<%
	ResultSet rs = null;

	try {
		String sql = "select * from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			out.println(rs.getString("name") + " " + rs.getString("id") + " " + rs.getString("pw") + " " + rs.getInt("m_point") + "<br>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		rs.close();
		pstmt.close();
		conn.close();
	}
%>

</body>
</html>