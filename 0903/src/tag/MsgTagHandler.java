package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import model.DataBean;

public class MsgTagHandler extends SimpleTagSupport {
	
	private String bgcolor;
	private String border;
	
	public String getBgcolor() {
		return bgcolor;
	}
	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}
	public String getBorder() {
		return border;
	}
	public void setBorder(String border) {
		this.border = border;
	}
	
	public void doTag() throws IOException, JspException {
		
		JspWriter out = getJspContext().getOut();
		
		JspFragment body = getJspBody();
		if (body != null) { // �±� �ٵ� �ִ� ��� ������� �������� if������ ó������� �� - body�� null�� ��� ������ �� �� �ֱ⶧����
			out.println("<h1>");
			body.invoke(null); // body.invoke() : �ܺ�(jsp)�κ��� ���޵� �±׹ٵ� ������ ���
			out.println("</h1>");
		}
		
		DataBean db = new DataBean();
		
		// ��Ʈ�� ���� Ȱ�� -> ���� ���
		StringBuffer sb = new StringBuffer();
		sb.append("<table border=").append(border).append(" bgcolor=").append(bgcolor).append(">");
		out.println(sb.toString());
		
		/*out.println("<table border=");
		out.println(border);
		out.println(" bgcolor="); // ���� ����!!
		out.println(bgcolor);
		out.println(">");*/
		for (String v : db.getDataList()) {
			out.println("<tr><td>" + v + "</td></tr>");
		}
		out.println("</table>");
	}
	
}
