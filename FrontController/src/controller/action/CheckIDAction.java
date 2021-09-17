package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.UserDAO;

public class CheckIDAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = null; // output
		String u_id = request.getParameter("u_id");
		PrintWriter out = response.getWriter();
		
		UserDAO uDAO = new UserDAO();

		if (u_id == null || u_id == "") { // 입력값이 없는 경우
			out.println("null");
		} else {
			out.println(uDAO.checkID(request.getParameter("u_id")));
		}
		return forward;
	}
}
