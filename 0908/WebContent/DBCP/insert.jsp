<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="insert">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" placeholder="제목 입력" required="required"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" placeholder="저자 입력" required="required"></td>
			</tr>
			<tr>
				<td>장르</td>
				<td><input type="text" name="genre" placeholder="장르 입력" required="required"></td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td><textarea name="summary" required="required"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="추가하기">
	</form>
	
</body>
</html>