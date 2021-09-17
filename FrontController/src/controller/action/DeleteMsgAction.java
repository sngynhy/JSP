package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.msg.MessageDAO;
import model.msg.MessageVO;

public class DeleteMsgAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setM_id(Integer.parseInt(request.getParameter("m_id")));
		
		try {
			if (mDAO.MSGdelete(mVO)) {
				forward = new ActionForward();
				forward.setPath("main.do");
				forward.setRedirect(false);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('댓글 삭제 실패!');history.go(-1)</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return forward;
	}
}
