package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalcServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8"); // html에 작성된 text를 charset=UTF-8으로 설정
		PrintWriter out = response.getWriter();
		
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String op = request.getParameter("op");
		
//		int result = calc(num1, num2, op);
		Calc calc = new Calc(num1, num2, op);
		int result = calc.getResult();
		
		out.println("<HTML>"); // 사용자에게 응답하는 페이지에 작성
		out.println("<head><title>계산기 서블릿</title></head>");
		out.println("<body>");
		out.println("<h2>계산결과: ");
		out.println(num1 + " " + op + " " + num2 + " = " + result);
		out.println("</h2>");
		out.println("</body></HTML>");
	}
	
	/*public int calc(int num1, int num2, String op) {
		int result = 0;
		
		if (op.equals("+")) {
			result = num1 + num2;
		} else if (op.equals("-")) {
			result = num1 - num2;
		} else if (op.equals("*")) {
			result = num1 * num2;
		} else if (op.equals("/")) {
			result = num1 / num2;
		}
		
		return result;
	}*/
}
