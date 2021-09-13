<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.bank.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao1" class="model.bank.Bank1DAO" />
<jsp:useBean id="dao2" class="model.bank.Bank2DAO" />
<jsp:useBean id="b1" class="model.bank.Bank1VO" />
<jsp:setProperty property="*" name="b1"/>
<jsp:useBean id="b2" class="model.bank.Bank2VO" />
<jsp:setProperty property="*" name="b2"/>

<%
	String action = request.getParameter("action");
	
	if (action.equals("main")) {
		Bank1VO data1 = dao1.getBank1();
		Bank2VO data2 = dao2.getBank2();
		request.setAttribute("data1", data1);
		request.setAttribute("data2", data2);
		pageContext.forward("main.jsp");
	} else if (action.equals("trans1")) {
		System.out.println(request.getParameter("bal"));
		int bal = Integer.parseInt(request.getParameter("bal"));
		if(dao1.trans(bal)) {
			out.println("<script>alert('이체 성공!');</script>");
			out.println("<script>location.href='control.jsp?action=main';</script>");
			/* pageContext.forward("control.jsp?action=main"); */
		} else {
			out.println("<script>alert('잔고 부족! 이체 실패!');history.go(-1)</script>");
		}

	} else if (action.equals("trans2")) {
		int bal = Integer.parseInt(request.getParameter("bal"));
		if(dao2.trans(bal)) {
			out.println("<script>alert('이체 성공!');</script>");
			out.println("<script>location.href='control.jsp?action=main'</script>");
		} else {
			out.println("<script>alert('잔고 부족! 이체 실패!');history.go(-1)</script>");
		}

	} else {
		out.println("잘못된 파라미터");
	}


%>