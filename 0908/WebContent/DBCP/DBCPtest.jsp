<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP 확인</title>
</head>
<body>

<!-- dataSource값은 web.xml에 작성된 <res-ref-name>jdbc/orcl</res-ref-name> -->
<sql:query var="rs" dataSource="jdbc/orcl">
	select * from member
	<!-- sql구문에 ;은 붙이지 않을 것! -->
</sql:query>

<h2>DBCP 연결 테스트</h2>
<c:forEach var="v" items="${rs.rows}">
	${v.id} / ${v.pw} / ${v.name} <br>
</c:forEach>

</body>
</html>