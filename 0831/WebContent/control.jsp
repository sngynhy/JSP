<%@page import="java.util.ArrayList,model.member.*,model.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO" />
<jsp:useBean id="messageVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="messageVO" />
<jsp:useBean id="memberDAO" class="model.member.MemberDAO" />
<jsp:useBean id="memberVO" class="model.member.MemberVO" scope="session"/>
<jsp:setProperty property="*" name="memberVO" />
<%
	// 컨트롤러를 호출했을때의 요청 파라미터를 분석
	String action = request.getParameter("action");
	
	if (action.equals("index")) { // index(로그인) 화면으로 이동
		response.sendRedirect("index.jsp");
	} else if (action.equals("login")) { // 로그인 요청
		if (memberDAO.login(memberVO)) {
			/* session.setAttribute("id", memberVO.getId()); */
			response.sendRedirect("control.jsp?action=list");
		} else {
			out.println("<script>alert('로그인에 실패하였습니다. 정보를 다시 입력하세요.');history.go(-1)</script>");
		}
	} else if (action.equals("logout")) {
		session.invalidate(); // 데이터 초기화
		response.sendRedirect("control.jsp?action=index");
	} else if (action.equals("signup")) {
		if (memberDAO.signUp(memberVO)) {
			/* out.println("<script>alert('회원이 되신 것을 환영합니다!')</script>"); */
			response.sendRedirect("control.jsp?action=index");
		} else {
			out.println("<script>alert('회원가입에 실패하셨습니다. 정보를 다시 확인해주세요.')</script>");
		}
	} else if (action.equals("checkID")) {
		out.println(memberDAO.checkID(request.getParameter("id"))); // 입력받은 아이디 존재 여부 확인
	} else if (action.equals("list")) {
		// 모든 데이터 조회 후 저장 selectAll
		// 데이터 저장 후  list.jsp로 이동
		ArrayList<MessageVO> datas = null;
		/* System.out.println("search : " + request.getParameter("search")); */
		if (request.getParameter("search") != null) {
			datas = messageDAO.getDBSearchList(request.getParameter("search")); // 특정 키워드로 검색
		} else {
			datas = messageDAO.getDBList();
		}
		request.setAttribute("datas", datas);
		/* request.setAttribute("search",request.getParameter("search") == null ? "" : request.getParameter("search")); */
		pageContext.forward("list.jsp"); // 내장 객체가 액션 태그보다 사용 빈도가 높음 -> datas(데이터)와 함께 전달하기 위해 사용
	} else if (action.equals("mylist")) {
		ArrayList<MessageVO> datas = null;
		datas = messageDAO.getMyDBList(memberVO.getId());
		request.setAttribute("datas", datas);
		pageContext.forward("list.jsp");
	} else if (action.equals("insert")) { // 게시글 등록
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
		MessageVO data = messageDAO.getDBData(messageVO);
		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
	} else { // 그 밖의 파라미터를 받았을 때
		out.println("파라미터 확인!"); // 에러페이지로 연결하는 방법도 가능!
	}
%>

