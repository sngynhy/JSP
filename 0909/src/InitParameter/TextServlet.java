package InitParameter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ��� 1) ������̼��� �̿��Ͽ� �ʱ�ȭ �Ű����� ����														// name1�� ������ ari�� ����
@WebServlet(urlPatterns= {"/TestServlet","/abc"}, initParams= {@WebInitParam(name="name1",value="moncher"),@WebInitParam(name="name2",value="leon")})
public class TextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TextServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); // JSP ���� ��ü out�� ���� ���
		response.setContentType("text/html;charset=UTF-8");
		out.println("<html><body>");
		out.println(getInitParameter("name1") + "<br>"); // �ʱ�ȭ �Ű������� ������ �� ���
		out.println(getInitParameter("name2") + "<br>"); // �ʱ�ȭ �Ű������� ������ �� ���
		
		// �ܺ� ����(web.xml)�� ������ �ʱ�ȭ �Ű����� ��� - getServletContext() ���
		out.println(getServletContext().getInitParameter("name3") + "<br>");
		out.println(getServletContext().getInitParameter("encoding") + "<br>");
		
		out.println("</body></html>");
	}

}
