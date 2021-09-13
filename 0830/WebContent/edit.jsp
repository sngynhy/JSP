<%@page import="model.book.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="data" class="model.book.MessageVO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정/삭제 화면</title>
<script type="text/javascript">
	function del() {
		result = confirm("정말로 삭제하시겠습니까?");
		if (result == true) {
			document.form1.action.value = "delete"; // form1의 action 파라미터를 delete로 설정
			document.form1.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
<h2>게시글 수정</h2>	
<hr>
<a href="control.jsp?action=list">메인으로 돌아가기</a>
<hr>
<form action="control.jsp" method="post" name="form1">
<!-- 사용자 눈에 보이지 않는 데이터는 hidden으로 처리 -->
<input type="hidden" name="action" value="update">
<input type="hidden" name="mnum" value="<%= data.getMnum() %>">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="<%= data.getWriter() %>"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%= data.getTitle() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" value="<%= data.getContent() %>"></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><input type="date" name="date" value="<%= data.getWdate() %>"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="내용 수정">
				<input type="button" value="글 삭제" onclick="del()">
			</td>
		</tr>
	</table>
</form>	
	
</body>
</html>