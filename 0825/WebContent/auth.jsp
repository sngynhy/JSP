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
	/* request.setCharacterEncoding("UTF-8"); */ // 정보를 한글로 받을 경우 필요 (한글이 깨지지 않도록)

	// login 페이지로부터 전달받은 데이터 저장
	String id = request.getParameter("id"); // 유지보수를 위해 같은 값을 갖고 있는 변수는 동일하게 작성
	String pw = request.getParameter("pw");
	/* System.out.println(id.length());
	System.out.println(pw.length()); */
	if (id.length() != 0 && pw.length() != 0) { // 로그인 성공 시
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setMaxInactiveInterval(10);
		response.sendRedirect("loginOk.jsp");
	} else {
		response.sendRedirect("login.jsp");
	}

	application.setAttribute("cnt", 0);
%>

</body>
</html>