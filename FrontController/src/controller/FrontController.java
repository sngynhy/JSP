package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// "���" Ŭ���̾�Ʈ�� ��û�� ���� �������� ������ �ǰ�, �̰����� ��û�� ���� control.jsp�� �̵��ϵ��� ��

@WebServlet("/FrontController")
/*@WebServlet("*.do")*/ // �����ϰ� �� ��ĵ� ����
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 1. Ŭ���̾�Ʈ�� "��û"�� �м��ϴ� �Լ� == String action = request.getParameter("action"); */
		String uri = request.getRequestURI();
		//System.out.println("uri:" + uri); // uri:/FrontController/main.do
		
		String cp = request.getContextPath();
		//System.out.println("cp:" + cp); // cp:/FrontController
		
		String action = uri.substring(cp.length());
		//System.out.println("action:" + action); // /main.do
		
		ActionForward forward = null;
		
		
		/* 2. control�� �����ϴ� ���� == if(action.equals("main")) */
		if (action.equals("/main.do")) {
			// main ��Ʈ�ѷ��� �̵�
			forward = new MainAction().execute(request, response);
		} else if (action.equals("/insertmsg.do")) {
			
		} else { // ���� �߸��� action���� ��� ��, null�� ���
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("NewFile1.jsp"); // error.jsp
		}
		
		if (forward.isRedirect()) { // redirect ���
			response.sendRedirect(forward.getPath());
		} else { // forward ���
			// Dispatcher
			// : Ŭ���̾�Ʈ�κ��� ���ʿ� ���� ��û�� JSP/Servlet ������ ���ϴ� �ڿ����� ��û�� �ѱ�� ������ �����ϰų�,
			//   Ư�� �ڿ��� ó���� ��û�ϰ� ó�� ����� ������ ����� �����ϴ� Ŭ����
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); // ���� ���
			dispatcher.forward(request, response);
		}
		
		
		/* 3. Ŭ���̾�Ʈ���� ó���� ������ ���(reponse) */
	}

}
