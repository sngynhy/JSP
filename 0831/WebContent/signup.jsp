<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function checkID() { // 회원 가입 시 ID 중복 체크하는 함수
		$.ajax({ 
			type: "GET", // 단순 정보 조회 시에는 GET, 정보가 너무 많거나 insert/update를 할때는 POST
			url: "control.jsp",
			data: {
				action : 'checkID',
				id : $(".id").val() // $().val() : 값 가져오기
			},
			dataType: "json",
			success: function(data) { 
				if (!data) { // 중복 데이터가 없을 때
					alert("사용 가능한 ID입니다.");
				} else {
					alert("ID가 이미 존재합니다. 다시 입력하세요.");
				}
			},
			error: function(xhr) {
				console.log(xhr.status + " : " + xhr.errorText);
				alert("에러발생!");
			}
		});
	}
</script>
</head>
<body>
	<form action="control.jsp" method="post" name="form1">
	<input type="hidden" name="action" value="signup">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" class="id" required></td>
				<td><button type="button" name="btn" onclick="checkID()">ID 중복확인</button></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>