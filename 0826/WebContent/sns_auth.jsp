<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// login 페이지로부터 전달받은 데이터 저장
	String id = request.getParameter("id"); // 유지보수를 위해 같은 값을 갖고 있는 변수는 동일하게 작성
	String pw = request.getParameter("pw");

	if (id.length() != 0 && !pw.equals("")) { // 로그인 성공 시
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("sns_main.jsp");
	} else {
		out.println("<script>alert('ID와 PW를 모두 기입하세요.')</script>");
		response.sendRedirect("sns_login.jsp");
	}
%>

</body>
</html>