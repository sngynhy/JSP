<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, model.book.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bookVO" class="model.book.BookVO" />
<jsp:setProperty property="*" name="bookVO" />
<jsp:useBean id="bookDAO" class="model.book.BookDAO" />
<%
	String action = request.getParameter("action");

	if (action.equals("main")) {
		// 모든 데이터 출력
		ArrayList<BookVO> datas = null;
		datas = bookDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp");
	} else if (action.equals("select")) {
		// 선택된 데이터 출력
		/* System.out.println("확인"); */
		System.out.println("bnum : " + bookVO.getBnum());
		BookVO data = bookDAO.getDBData(bookVO);
		request.setAttribute("data", data);
		pageContext.forward("select.jsp");
	} else if (action.equals("edit")) {
		// 수정 화면
		BookVO data = bookDAO.getDBData(bookVO);
		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
	} else if (action.equals("update")) {
		// 데이터 수정
		/* System.out.println("bnum : " + bookVO.getBnum()); */
		bookDAO.updateDB(bookVO);
		response.sendRedirect("control.jsp?action=select&bnum=" + bookVO.getBnum());
	} else if (action.equals("insert")) {
		// 데이터 추가
		bookDAO.insertDB(bookVO);
		out.println("<script>alert('추가되었습니다.');</script>");
		out.println("<script>location.href='control.jsp?action=main';</script>");
		/* response.sendRedirect("control.jsp?action=main"); */
	} else if (action.equals("delete")) {
		// 데이터 삭제
		/* System.out.println(bookVO.getBnum()); */
		bookDAO.deleteDB(bookVO);
		out.println("<script>alert('삭제되었습니다.');</script>");
		out.println("<script>location.href='control.jsp?action=main';</script>");
		/* response.sendRedirect("control.jsp?action=main"); */
	} else {
		out.println("잘못된 파라미터 입니다!");
	}



%>