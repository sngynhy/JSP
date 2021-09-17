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
		
		String selUser = request.getParameter("selUser"); // 내 글 보기, 검색 시 필요한 변수
		
		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
		
		ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll(); // 신규 회원 목록
		
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers); // 신규 회원
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		
		forward.setRedirect(false); // false 시 forward 방식으로 전달
		forward.setPath("main.jsp"); // main.jsp 페이지로 이동
		return forward;
	}
}