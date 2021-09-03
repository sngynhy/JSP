<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 표현 언어 - 표현식 대체</title>
</head>
<body>

<%-- ${param.data} == <%= request.getParameter("data") %> --%>
	선택한 데이터는 ${param.data}입니다. <br>
	${dataBean.data1}<br> <!-- 이미 전 페이지에서 dataBean이 선언되었기 때문에 별도의 선언없이 사용 가능 -->
	${dataBean.data2}<br>
	${dataBean.data1 + dataBean.data2}<br>
	${dataBean.data1 gt dataBean.data2}<br>
	
</body>
</html>