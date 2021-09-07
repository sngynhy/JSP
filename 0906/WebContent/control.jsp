<%@ page import="java.util.ArrayList, model.product.*, model.customer.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="productDAO" class="model.product.ProductDAO" />
<jsp:useBean id="productVO" class="model.product.ProductVO" />
<jsp:setProperty property="*" name="productVO" />
<jsp:useBean id="customerDAO" class="model.customer.CustomerDAO" />
<jsp:useBean id="customerVO" class="model.customer.CustomerVO" scope="session" />
<jsp:setProperty property="*" name="customerVO" />
<%
	String action = request.getParameter("action");
	System.out.println(action);
	if (action.equals("main")) { // 상품 리스트 들고 메인으로 이동
		ArrayList<ProductVO> datas = productDAO.getProductAll();
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp");
	} else if (action.equals("login")) {
		CustomerVO customer = customerDAO.login(customerVO);
		/* System.out.println(customer); */
		if (customer != null) {
			session.setAttribute("customer", customer);
			response.sendRedirect("control.jsp?action=main");
		} else {
			out.println("<script>alert('로그인에 실패하였습니다. 정보를 다시 입력하세요.');history.go(-1)</script>");
		}
	} else if (action.equals("logout")) {
		session.invalidate(); // 데이터 초기화
		response.sendRedirect("control.jsp?action=main");
	} else if (action.equals("signup")) {
		if (customerDAO.signUp(customerVO)) {
			response.sendRedirect("control.jsp?action=main");
		} else {
			out.println("<script>alert('회원가입에 실패하셨습니다. 정보를 다시 확인해주세요.');history.go(-1)</script>");
		}
	} else if (action.equals("search")) {
		ArrayList<ProductVO> datas = productDAO.getSearchProduct(request.getParameter("search"));
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp");
	} else if (action.equals("delete")) {
		if (customerDAO.deleteCustomer(customerVO)) {
			session.invalidate(); // 데이터 초기화
			out.println("<script>alert('회원 탈퇴 성공!')</script>");
			response.sendRedirect("control.jsp?action=main");
		} else {
			throw new Exception("DB delete 오류 발생!");
		}
	} else if (action.equals("update")) { // 회원정보 변경
		CustomerVO customer = customerDAO.updateCustomerInfo(customerVO);
		if (customer != null) {
			session.setAttribute("customer", customer);
			response.sendRedirect("mypage.jsp");
		} else {
			throw new Exception("DB update 오류 발생!");
		}
	} else if (action.equals("checkID")) {
		out.println(customerDAO.checkID(request.getParameter("id")));
	} else if (action.equals("order")) {
		/* System.out.println(productVO); */
		ProductVO selectproduct = productDAO.getProductOne(productVO);
		if (selectproduct.getStock() < productVO.getCnt()) { // DB상의 재고량 < 주문수량
			out.println("<script>alert('재고가 부족합니다.');history.go(-1)</script>");
		} else {
			request.setAttribute("pnum",selectproduct.getPnum()); // 결제 시 필요한 데이터 들고 결제 화면으로 이동
			request.setAttribute("pname",selectproduct.getPname()); // pname, cnt는 productVO에 저장되어있고
			request.setAttribute("price",selectproduct.getPrice()); // 나머지 정보는 조회 시 불러온 selectproduct에 담겨있음
			request.setAttribute("cnt",productVO.getCnt());
			pageContext.forward("pay.jsp");
		}
	} else if (action.equals("pay")) {
		if (productDAO.updateProduct(productVO)) {
			response.sendRedirect("control.jsp?action=main");
		} else {
			throw new Exception("DB update 오류 발생!");
		}
	} else {
		out.println("잘못된 요청입니다.");
	}

%>