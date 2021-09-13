<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script type="text/javascript">
	function check(bnum) {
		document.location.href = "control.jsp?action=select&bnum=" + bnum;
	}
</script>
</head>
<body>

	<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="select">
		<input type="button" value="도서추가" onclick="location.href='insert.jsp'">
		<table border="1">
			<tr>
				<th>제목</th><th>저자</th>
			</tr>
			<c:forEach var="data" items="${datas}">
				<tr>
					<td><a href="javascript:check(${data.bnum})">${data.title}</td>
					<td>${data.author}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>