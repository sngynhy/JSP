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
			out.println("<script>alert('ȸ������ ����!');opener.parent.location.reload();window.close()</script>");
			// opener : ���� �����ִ� �˾�â, parent : �θ� â, location.reload : ���ΰ�ħ
			// ��, ���� �����ִ� �θ� â�� ���ΰ�ħ
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>alert('ȸ������ ����!');history.go(-1)</script>");
		}
		
		return forward;
	}
}
