<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberVO" class="model.member.MemberVO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 입력 화면</title>
</head>
<body>
<h2>게시글 등록</h2>	
<hr>
<a href="control.jsp?action=list">메인으로 돌아가기</a>
<hr>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action" value="insert">
<%-- <input type="hidden" name="id" value="<%= (String) session.getAttribute("id") %>"> --%>
<input type="hidden" name="id" value="<%= memberVO.getId() %>">
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" required></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" required></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="글 등록">
			</td>
		</tr>
	</table>
</form>

</body>
</html>