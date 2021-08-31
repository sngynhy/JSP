<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 액션 태그2</title>
</head>
<body>
	<h2>ActionTag.jsp 페이지입니다.</h2>
	<hr>
	<jsp:forward page="footer.jsp">
		<jsp:param value="sngynhy@goolgle.com" name="email"/>
		<jsp:param value="010-1234-5678" name="tel"/>
	</jsp:forward>
	<!-- forward (include와 비교하여 알아두기)
		페이지의 주도권이 footer로 넘어가서 다시 돌아오지 않음
		굳이 데이터를 받아서 다시 원래의 페이지로 넘어오지 않아도 되는 경우 사용한다.
	-->
</body>
</html>