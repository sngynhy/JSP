package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.UserDAO;
import model.user.UserVO;

public class SignupAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = null; // output
		
		UserDAO uDAO = new UserDAO();
		UserVO uVO = new UserVO();
		uVO.setName(request.getParameter("name"));
		uVO.setU_id(request.getParameter("u_id"));
		uVO.setPw(request.getParameter("pw"));
		
		PrintWriter out = response.getWriter();
		
		if (uDAO.signup(uVO)) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>alert('회원가입 성공!');opener.parent.location.reload();window.close()</script>");
			// opener : 현재 열려있는 팝업창, parent : 부모 창, location.reload : 새로고침
			// 즉, 현재 열려있는 부모 창을 새로고침
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>alert('회원가입 실패!');history.go(-1)</script>");
		}
		
		return forward;
	}
}
