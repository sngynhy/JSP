<%@page import="java.util.ArrayList, model.message.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO" />
<jsp:useBean id="messageVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="messageVO" />
<%
	// 컨트롤러를 호출했을때의 요청 파라미터를 분석
	String action = request.getParameter("action");

	if (action.equals("list")) {
		// 모든 데이터 조회 후 저장 selectAll
		// 데이터 저장 후  list.jsp로 이동
		ArrayList<MessageVO> datas = messageDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("list.jsp"); // 내장 객체가 액션 태그보다 사용 빈도가 높음
		
	} else if (action.equals("insert")) {
		
		if (messageDAO.insertDB(messageVO)) {
			response.sendRedirect("control.jsp?action=list");
		} else {
			throw new Exception("DB insert 오류 발생!");
		}
		
	} else if (action.equals("delete")) {
		if (messageDAO.deleteDB(messageVO)) {
			response.sendRedirect("control.jsp?action=list");
		} else {
			throw new Exception("DB delete 오류 발생!");
		}
		
	} else if (action.equals("update")) {
		if (messageDAO.updateDB(messageVO)) {
			response.sendRedirect("control.jsp?action=list");
			// 수정 완료 후 list 페이지로 이동 -> 중복 코드를 최소화 하기 위해 sendRedirect로 처리
		} else {
			throw new Exception("DB update 오류 발생!");
		}
		
	} else if (action.equals("edit")) {
		// 사용자가 수정할 데이터 저장 selecOne
		MessageVO data = messageDAO.getDBData(messageVO);
		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
		
		// GUI 상에서 사용자가 잘못된 mnum를 건네는 경우는 없다!
		// 하지만 url을 이용하여 잘못된 정보가 입력되면 "에러 페이지"로 처리!
		
	} else { // 그 밖의 파라미터를 받았을 때
		out.println("파라미터 확인!"); // 에러페이지로 연결하는 방법도 가능!
	}
%>

