<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cancel() {
		history.go(-1);
	}
</script>
</head>
<body>
	
	<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="bnum" value="${data.bnum}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${data.title}" required></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="${data.author}" required></td>
			</tr>
			<tr>
				<td>장르</td>
				<td><input type="text" name="genre" value="${data.genre}" required></td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td><textarea name="summary" required>${data.summary}</textarea></td>
			</tr>
		</table>
		<input type="submit" value="수정하기">
		<input type="button" value="취소하기" onclick="cancel()">
	</form>
	
</body>
</html>