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

<c:set var="msg" value="ang" />
<c:if test="${msg=='ang'}" var="res"> <!-- jstl에 if문만 사용하고 else문은 없다! / test는 필수(requierd) 속성 -> 조건식 작성 / var : 결과 저장 -->
	1-결과는 [${res}]입니다. <!-- if문에서는 보통 바디태그 사용 -->
</c:if>
<c:if test="${msg!='ang'}" var="res"> <!-- 조건식이 true일때만 결과 출력 -->
	2-결과는 [${res}]입니다.
</c:if>
</body>
</html>