<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int result = 0; // 변수 선언
	
	// [JSP 내장 객체]
	// JSP가 변환된 Servlet 파일 내부에는
	// request, response, pageContext, session, application, out, config가 정의되어 있음 (서블릿 내부에서 제일 먼저 초기화됨)
	// 따라서 JSP에서는 별도의 선언없이 사용 가능! ==> JSP 내장 객체
	if (request.getMethod().equals("POST")) { // GET POST는 대문자로 작성
		
		String op = request.getParameter("operator");
		// 대게의 경우 파라미터값은 문자열로 주고받음
		int num1 = Integer.parseInt(request.getParameter("num1")); // String -> int로 타입변환
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		if (op.equals("+")) {
			result = num1 + num2;
		} else if (op.equals("-")) {
			result = num1 - num2;
		} else if (op.equals("*")) {
			result = num1 * num2;
		} else if (op.equals("/")) {
			result = num1 / num2;
		}
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>계산기 실습1</title>
</head>
<body>

	<h2>계산기</h2>
	<hr>
	<form method="POST" name="form1"> <!-- 일반적으로 form 태그는 Post방식으로 전달 -->
		<input type="text" name="num1" id="num1"> <!-- name == id -->
		<select name="operator">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type="text" name="num2" id="num2">
		<input type="submit" value="계산하기" name="btn1">
		<input type="reset" value="다시입력" name="btn2">
	</form>
	<hr>
	<h3>계산결과: <%= result %></h3>
	
</body>
</html>