<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>

<%
// 프로그래머가 지향하는 ★★★낮은 결합도 == 높은 응집도★★★ == 프로그램의 높은 유연성

	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		Context initContext = new InitialContext(); // Context.xml 받아오기
		
		// initContext - lookup() : "java:comp/env"에 해당하는 객체를 찾아서 envContext에 삽입
		Context envContext = (Context) initContext.lookup("java:/comp/env"); // loockup : Object 반환
		
		// envContext - lookup() : "jdbc/orcl"에 해당하는 객체를 찾아서 ds에 삽입
		DataSource ds = (DataSource) envContext.lookup("jdbc/orcl"); // 최종적으로 얻어야 할 데이터 소스
		
		
		// getConnection() : 커넥션풀로부터 커넥션 객체를 얻어내어 conn변수에 저장
		conn = ds.getConnection();
		String sql = "insert into member (id,pw,name) values (?,?,?)";
		
		if (request.getParameter("id")!=null) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("pw"));
			pstmt.setString(3, request.getParameter("name"));
			pstmt.executeUpdate();
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>


<form method="post">
	<input type="text" name="id">
	<input type="password" name="pw">
	<input type="text" name="name">
	<input type="submit" value="추가하기">
</form>

<hr>

<%
	try {
		String sql = "select * from member";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			out.println(rs.getString("id"));
			out.println(rs.getString("pw"));
			out.println(rs.getString("name"));
			out.println(rs.getInt("m_point"));
		}
		
		// 이미 확보된 connection을 사용하므로 close()는 생략가능하지만 작성을 권장함!
		// -> 커넥션 풀이 DB 연결 상태 체크하는 시간을 줄여줌
		rs.close();
		pstmt.close();
		conn.close();
	} catch(SQLException e) {
		e.printStackTrace();
	}
%>
<!-- DB 연결이 해제되면 커넥션 풀이 자원을 반납해주는 형태 (커넥션 객체 소멸 X) -->
</body>
</html>