<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${empty sssUser}"> <!-- 로그아웃 상태 -->
	<form action="login.do" method="post">
		<input type="hidden" name="mcnt" value="${mcnt}">
			<input type="text" name="u_id" required="required">
			<input type="password" name="pw" required="required">
			<input type="submit" value="로그인">
		<hr>
		<a href="javascript:void(0);" onclick="signup()">회원가입</a> <!-- window.open으로 처리 -->
		<hr>
	</form>
	</c:when>
	<c:otherwise> <!-- 로그인 상태 -->
		${sssUser}님, 환영합니다!
		<a href="main.do?selUser=${sssUser}" onclick="hidden()">내 댓글 목록</a><br>
		<hr>
		<a href="logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>