<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.msg.*,model.user.*"%>
<jsp:useBean id="mDAO" class="model.msg.MessageDAO" />
<jsp:useBean id="rDAO" class="model.msg.ReplyDAO" />
<jsp:useBean id="uDAO" class="model.user.UserDAO" />
<jsp:useBean id="mVO" class="model.msg.MessageVO" />
<jsp:setProperty property="*" name="mVO"/>
<jsp:useBean id="rVO" class="model.msg.ReplyVO" />
<jsp:setProperty property="*" name="rVO"/>
<jsp:useBean id="uVO" class="model.user.UserVO" />
<jsp:setProperty property="*" name="uVO"/>
<%
	String action = request.getParameter("action");
 	String url = "control.jsp?action=main";	
	String mcntt = request.getParameter("mcnt");
	int mcnt = 0;
	if(mcntt != null) {
		mcnt = Integer.parseInt(mcntt);
	}
	url= url+ "&mcnt="+mcnt;
	
	String selUser = request.getParameter("selUser"); // 내 글 보기, 검색 시 필요한 변수
	if(selUser != null){ // 로그인 정보 url에 추가
		url = url + "&selUser=" + selUser;
	}
	
	if(action.equals("main")){ // 메인화면 - 게시글 + 댓글 출력
		ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll(); // 신규 회원 목록
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers); // 신규 회원
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		pageContext.forward("main.jsp");
	} else if (action.equals("login")) { // 로그인
		if (uDAO.login(uVO)) {
			session.setAttribute("sssUser", uVO.getU_id()); // 로그인 아이디 세션단위로 저장 sssUser
			/* System.out.println(url); */
			response.sendRedirect(url);
		} else {
			out.println("<script>alert('로그인에 실패!');history.go(-1)</script>");
		}
	} else if (action.equals("logout")) { // 로그아웃
		session.invalidate(); // 데이터 초기화
		response.sendRedirect("control.jsp?action=main");
	} else if (action.equals("signup")) { // 회원가입
		if (uDAO.signup(uVO)) {
			out.println("<script>alert('회원가입 성공!');</script>");
			out.println("<script>window.close();</script>");
		} else {
			out.println("<script>alert('회원가입 실패!');history.go(-1)</script>");
		}
	} else if (action.equals("checkID")) {
		/* System.out.println("u id :" +request.getParameter("u_id")); */
		if (request.getParameter("u_id") == null) {
			out.println("null");
		} else {
			out.println(uDAO.checkID(request.getParameter("u_id")));
		}
	} else if (action.equals("insertMSG")) { // 댓글 등록
		if (mDAO.MSGinsert(mVO)) {
			out.println("<script>location.href='" + url + "';</script>");
		} else {
			out.println("<script>alert('댓글 등록 실패!');history.go(-1)</script>");
		}
	} else if (action.equals("deleteMSG")) { // 댓글 삭제
		if (mDAO.MSGdelete(mVO)) {
			response.sendRedirect(url);
		} else {
			out.println("<script>alert('댓글 삭제 실패!');history.go(-1)</script>");
		}
	} else if (action.equals("insertRMSG")) { // 댓글 등록
		if (rDAO.RMSGinsert(rVO)) {
			response.sendRedirect(url);
		} else {
			out.println("<script>alert('댓글 등록 실패!');history.go(-1)</script>");
		}
	} else if (action.equals("deleteRMSG")) { // 댓글 삭제
		if (rDAO.RMSGdelete(rVO)) {
			response.sendRedirect(url);
		} else {
			out.println("<script>alert('댓글 삭제 실패!');history.go(-1)</script>");
		}
	} else if (action.equals("favcount")) { // 좋아요 +1
		if (mDAO.favCount(mVO)) {
			response.sendRedirect(url);
		} else {
			out.println("<script>alert('좋아요 실패!');history.go(-1)</script>");
		}
	} else {
		out.println("잘못된 파라미터! " + action);
	}
%>