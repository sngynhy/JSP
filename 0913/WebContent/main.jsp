<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2><a href="control.jsp?action=selectAll">전체 댓글 목록</a></h2>

<hr>

<h2>전체목록</h2>

<c:forEach var="v" items="${datas}">
   <c:set var="m" value="${v.message}"/>
   <h3>[${m.u_id}] ${m.msg} &gt;&gt; [좋아요 ${m.favcount} | 댓글 ${m.replycount} | ${m.mdate}]</h3>
   <ol><c:forEach  var="r" items="${v.rlist}">
      <li>${r.u_id} >> ${r.rmsg} [${r.rdate}]</li>
   </c:forEach></ol>
</c:forEach>

<a href="control.jsp?action=main&mcnt=${mcnt+1}">댓글 더보기</a><br>

<hr>

<c:if test="${selUser != null}">
	<form action="control.jsp" method="post"> <!-- insert 반드시 폼으로 처리! -->
		<input type="hidden" name="action" value="MSGinsert">
		<input type="hidden" name="u_id" value="${selUser}">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="text" name="msg" placeholder="이곳에 댓글을 입력하세요.">
		<input type="submit" value="댓글 등록">
	</form>
</c:if>


<form action="control.jsp" method="post">
<c:choose>
   <c:when test="${empty selUser}"> <!-- 로그아웃 상태 -->
      <input type="hidden" name="action" value="login">
      <input type="hidden" name="mcnt" value="${mcnt}">
      <input type="text" name="u_id">
      <input type="password" name="pw">
      <input type="submit" value="로그인">
      
      <hr>

	<a href="signup.jsp">회원가입</a>
	
	<br>
   </c:when>
   <c:otherwise> <!-- 로그인 상태 -->
      ${selUser}님, 환영합니다! 
      <a href="control.jsp?action=main&selUser=${selUser}">내 댓글 목록</a><br>
      <hr>
      <input type="hidden" name="action" value="logout">
      <input type="submit" value="로그아웃">
   </c:otherwise>
</c:choose>
</form>

</body>
</html>