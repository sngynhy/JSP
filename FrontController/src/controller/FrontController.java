package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// "모든" 클라이언트의 요청이 현재 서블릿으로 들어오게 되고, 이곳에서 요청에 따라 control.jsp로 이동하도록 함

@WebServlet("/FrontController")
/*@WebServlet("*.do")*/ // 간단하게 이 방식도 가능
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
		
		/* 1. 클라이언트의 "요청"을 분석하는 함수 == String action = request.getParameter("action"); */
		String uri = request.getRequestURI();
		//System.out.println("uri:" + uri); // uri:/FrontController/main.do
		
		String cp = request.getContextPath();
		//System.out.println("cp:" + cp); // cp:/FrontController
		
		String action = uri.substring(cp.length());
		//System.out.println("action:" + action); // /main.do
		
		ActionForward forward = null;
		
		
		/* 2. control을 매핑하는 역할 == if(action.equals("main")) */
		if (action.equals("/main.do")) {
			// main 컨트롤러로 이동
			forward = new MainAction().execute(request, response);
		} else if (action.equals("/insertmsg.do")) {
			
		} else { // 만약 잘못된 action값인 경우 즉, null인 경우
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("NewFile1.jsp"); // error.jsp
		}
		
		if (forward.isRedirect()) { // redirect 방식
			response.sendRedirect(forward.getPath());
		} else { // forward 방식
			// Dispatcher
			// : 클라이언트로부터 최초에 들어온 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는 역할을 수행하거나,
			//   특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); // 최종 경로
			dispatcher.forward(request, response);
		}
		
		
		/* 3. 클라이언트에게 처리된 데이터 출력(reponse) */
	}

}
