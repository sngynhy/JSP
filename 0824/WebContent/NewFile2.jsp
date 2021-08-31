<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- useBean : 빈즈 사용하기 -->
<!-- 1. CalcBean 클래스에서 "기본 생성자"를 이용하여 calc 객체 생성 == 객체화 == 인스턴스화 -->
<jsp:useBean id="calc" class="test.CalcBean"/> <%-- 서블릿 파일로 변환 시 CalcBean calc = new CalcBean()와 같음 --%>

<!-- 2. setter 함수에 접근하는 태그 == 값 저장 -->
<jsp:setProperty property="*" name="calc"/>

<!-- 3. getter 함수에 접근하는 태그는 필요한 곳에 삽입! -->
<%-- <jsp:getProperty property="" name=""/> --%>
<!DOCTYPE html>

<!-- 계산하는 기능 함수 호출 -->
<% if(request.getMethod().equals("POST")){ calc.calculate(); } %>

<html>
<head>
<meta charset="UTF-8">
<title>계산기 실습2</title>
</head>
<body>

	<h2>계산기</h2>
	<hr>
	<form method="post" name="form1"> <!-- 일반적으로 form 태그는 Post방식으로 전달 -->
		<input type="text" name="num1" id="num1"> <!-- name == id -->
		<select name="op">
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
	<h3>계산결과: <jsp:getProperty property="result" name="calc"/></h3> <!-- CalcBean의 결과값 result 받아오기 -->
	
</body>
</html>