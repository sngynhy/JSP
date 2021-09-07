<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script type="text/javascript">
	function del() {
		result = confirm("정말로 탈퇴하시겠습니까?");
		if (result == true) {
			document.form1.action.value = "delete";
			document.form1.submit();
		} else {
			return;
		}
	}
	function main() {
		document.form1.action.value = "main";
		document.form1.submit();
	}
</script>
</head>
<body>
	<%-- <mytag:mypage>나의 정보 확인</mytag:mypage> --%>
	<table border="1">
	<tr>
		<td>ID</td>
		<td>${customer.id}</td>
	</tr>
	<tr>
		<td>PW</td>
		<td>${customer.pw}</td>
	</tr>
	<tr>
		<td>NAME</td>
		<td>${customer.name}</td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td>${customer.address}</td>
	</tr>
	<tr>
		<td>PHONE NUMBER</td>
		<td>${customer.phone_num}</td>
	</tr>
</table>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action">
	<input type="button" value="내 정보 수정" onclick="location.href='edit.jsp'">
	<input type="button" value="회원탈퇴" onclick="del()">
	<input type="button" value="메인화면" onclick="main()">
</form>
</body>
</html>