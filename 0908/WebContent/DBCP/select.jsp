<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		document.form1.action.value="delete";
		document.form1.submit();
		/* document.location.href = "control.jsp?action=delete&bnum=" + bnum; */
	}
	function main() {
		document.form1.action.value="main";
		document.form1.submit();
	}
</script>
</head>
<body>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action" value="edit">
<input type="hidden" name="bnum" value="${data.bnum}">
	<table border="1">
		<tr>
			<th>제목</th>
			<td>${data.title}</td>
		</tr>
		<tr>
			<th>저자</th>
			<td>${data.author}</td>
		</tr>
		<tr>
			<th>장르</th>
			<td>${data.genre}</td>
		</tr>
		<tr>
			<th>줄거리</th>
			<td>${data.summary}</td>
		</tr>
	</table>
	<input type="submit" value="수정하기">
	<input type="button" value="삭제하기" onclick="del()">
	<input type="button" value="메인으로" onclick="main()">
</form>
</body>
</html>