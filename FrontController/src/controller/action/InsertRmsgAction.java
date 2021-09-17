package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.msg.ReplyDAO;
import model.msg.ReplyVO;

public class InsertRmsgAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = null;

		ReplyDAO rDAO = new ReplyDAO();
		ReplyVO rVO = new ReplyVO();
		rVO.setM_id(Integer.parseInt(request.getParameter("m_id")));
		rVO.setU_id(request.getParameter("u_id"));
		rVO.setRmsg(request.getParameter("rmsg"));
		
		try {
			if (rDAO.RMSGinsert(rVO)) {
				forward = new ActionForward();
				forward.setPath("main.do");
				forward.setRedirect(false);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('댓글 등록 실패!');history.go(-1)</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return forward;
	}
}
