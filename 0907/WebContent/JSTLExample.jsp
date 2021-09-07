<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ArrayList<String> datas = new ArrayList<String>(Arrays.asList("마르게리따 피자","콩국수","꽃게탕","삼겹살","소주","김치전"));
	session.setAttribute("datas", datas);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>예제1)</h4>
<form>
	<input type="number" placeholder="정수를 입력하세요." name="num" value="0" min="0">
	<input type="submit" value="제출">
</form>
<c:if test="${param.num%2==0}">
	입력하신 수는 짝수 입니다.
</c:if>
<c:if test="${param.num%2==1}">
	입력하신 수는 홀수 입니다.
</c:if>

<hr>

<h4>예제2)</h4>
<c:forEach var="data" items="${datas}">
	${data}<br>
</c:forEach>
	
</body>
</html>