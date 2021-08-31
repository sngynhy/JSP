<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// index의 필요성 -> 페이지간의 이동 시 무조건 control 페이지를 거쳐야하므로
	// 메인 페이지가 열리기 전 먼저 시행되어야 함
	// 컨트롤러 페이지에게 list.jsp를 보여달라고 요청
	//  => action = list 와 같이 파라미터 이용!
	pageContext.forward("control.jsp?action=login");
%>
