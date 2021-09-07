<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="member" class="test.Member" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:catch var="errMsg">
	<%= 10/0 %>
</c:catch>
${errMsg}<br> <!-- errMsg: 사용빈도 낮음 -> 대신 isErrorPage를 사용 -->


<c:set var="msg" value="안녕하세요!" /> <!-- set: 값 선언 , var : 변수, value : 값, scope도 설정가능하지만 보통 page단위(기본값)으로 설정-->
<h1>${msg}</h1>
<!-- <%= pageContext.getAttribute("msg") %>와 같음 -->

<c:remove var="msg"/> <!-- msg값 삭제 -->
<h1>${msg}</h1>

<c:set target="${member}" property="email" value="sngynhy@gmail.com" /> <!-- 객체의 속성 정의 -->
${member.name}<br>
${member.email}

</body>
</html>