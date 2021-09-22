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
		
		// 1. uVO�� ���� �� �ִ� ���ڵ��� get
		// 2. �α��� ����, ���� ���� �Ǵ�
		// 3. ���� : ���� ������ ���� / ���� : ��ũ��Ʈ ��� -> �̿Ͱ��� �˾�â�� ������ϴ� ��� ����������� control.jsp�� ó���ص� ����
		
		UserDAO uDAO = new UserDAO();
		UserVO uVO = new UserVO();
		uVO.setU_id(request.getParameter("u_id"));
		uVO.setPw(request.getParameter("pw"));
		
		if (uDAO.login(uVO)) { // �α��� ���� ��
			HttpSession session = request.getSession(); // ������ ����ϱ� ���� ���� ������
			session.setAttribute("sssUser", uVO.getU_id());
			
			forward = new ActionForward();
			forward.setPath("main.do"); // �������� �̵� -> main.do�� ������ mainȭ�鿡 ��µ� �����Ͱ� �ʿ��ϱ� ������ MainAction�� ���İ����� �ϱ� ����!
			forward.setRedirect(false);
		} else { // �α��� ���� ��
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�α��� ����!');history.go(-1)</script>");
		}
		
		return forward;
	}
}
