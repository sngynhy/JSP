<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자 찍기</title>
<style type="text/css">
	#even {
		color: blue;
	}
	#odd {
		color: red;
	}
</style>
</head>
<body>
	
	<%
	for(int i=1; i<11; i++) {
		if(i%2==0) {
			%><span id="even"><% out.println(i); %></span><br>
		<%} else {
			%><span id="odd"><%= i %></span><br>
		<%}
	}
	%>
	
	<%
	for (int i = 1; i <= 10; i++) {
		if (i % 2 == 0) {
		   out.println("<div style='color:red;'>"+ i + "<br>");
		}else{
		   out.println("<div style='color:blue;'>"+ i + "<br>");
		}
	}
	%>
	
</body>
</html>