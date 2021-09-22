package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.msg.MessageDAO;
import model.msg.MsgSet;
import model.user.UserDAO;
import model.user.UserVO;

public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null; // output
		
		// 1. uVO를 만들 수 있는 인자들을 get
		// 2. 로그인 성공, 실패 여부 판단
		// 3. 성공 : 세션 단위로 세팅 / 실패 : 스크립트 출력 -> 이와같이 팝업창을 띄워야하는 경우 기존방식으로 control.jsp로 처리해도 무방
		
		UserDAO uDAO = new UserDAO();
		UserVO uVO = new UserVO();
		uVO.setU_id(request.getParameter("u_id"));
		uVO.setPw(request.getParameter("pw"));
		
		if (uDAO.login(uVO)) { // 로그인 성공 시
			HttpSession session = request.getSession(); // 세션을 사용하기 위해 세션 얻어오기
			session.setAttribute("sssUser", uVO.getU_id());
			
			forward = new ActionForward();
			forward.setPath("main.do"); // 메인으로 이동 -> main.do인 이유는 main화면에 출력될 데이터가 필요하기 때문에 MainAction을 거쳐가도록 하기 위함!
			forward.setRedirect(false);
		} else { // 로그인 실패 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
		}
		
		return forward;
	}
}
