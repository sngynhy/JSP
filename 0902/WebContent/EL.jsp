<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 표현 언어 - 표현식 대체</title>
</head>
<body>

	<form method="post" action="EL2.jsp">
		<jsp:useBean id="dataBean" class="model.DataBean" scope="session" />
		<select name="data">
			<%
				for(String v : dataBean.getDataList()) { // DataBean에 저장되어있는 data list 가져오기
			%>
				<option><%=v%></option>
			<%
				}
			%>
		</select>
		<input type="submit" value="다음 페이지로!">
	</form>

</body>
</html>