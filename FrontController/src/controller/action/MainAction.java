package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.msg.MessageDAO;
import model.msg.MsgSet;
import model.user.UserDAO;
import model.user.UserVO;

public class MainAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward(); // output
		
		String mcntt = request.getParameter("mcnt");
		int mcnt = 0;
		if(mcntt != null) {
			mcnt = Integer.parseInt(mcntt);
		}
		
		String selUser = request.getParameter("selUser"); // �� �� ����, �˻� �� �ʿ��� ����
		
		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
		
		ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll(); // �ű� ȸ�� ���
		
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers); // �ű� ȸ��
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		
		forward.setRedirect(false); // false �� forward ������� ����
		forward.setPath("main.jsp"); // main.jsp �������� �̵�
		return forward;
	}
}