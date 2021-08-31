<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 액션 태그</title>
</head>
<body>
	<h2>ActionTag.jsp 페이지입니다.</h2>
	<hr>
	<jsp:include page="footer.jsp">
		<jsp:param value="sngynhy@goolgle.com" name="email"/>
		<jsp:param value="010-1234-5678" name="tel"/>
	</jsp:include>
	<!-- include 지시어와의 차이점 
		1. 태그 바디 존재 <>태그바디<>
			태그 바디에서 즉각적으로 파라미터를 보낼 수 있다. => include 지시어보다 동적임
		동적이거나, 자주 바뀌는 콘텐츠는 지시어보다는 액션태그 사용이 유리하다.
	-->
</body>
</html>