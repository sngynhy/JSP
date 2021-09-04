<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>&lt;c:forEach&gt;실습</h1>
	<table border="1">
	<c:forEach var="v" items="${members}"> <!-- == for(Var v : members) : application 단위로 저장한 members 데이터 불러오기 -->
		<tr>
			<td>${v.name}</td>
			<td><c:out value="${v.email}">email 정보 없음</c:out></td>
			<!-- c:out : 출력하는 기능, value: 출력할 값, 태그바디 : 만약 출력할 데이터가 없을 경우 출력할 메세지 -->
			<td><c:out value="${v.email}" escapeXml="false"><font color="red">email 정보 없음</font></c:out></td>
			<!-- escapeXml="false" : c:out 태그 바디에 작성된 또다른 태그를 적용할 때 -->
		</tr>
	</c:forEach>
	</table>

</body>
</html>