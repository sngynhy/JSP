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
		if (body != null) { // 태그 바디가 있는 경우 사용하지 않으려면 if문으로 처리해줘야 함 - body가 null인 경우 에러가 날 수 있기때문에
			out.println("<h1>");
			body.invoke(null); // body.invoke() : 외부(jsp)로부터 전달된 태그바디 내용을 출력
			out.println("</h1>");
		}
		
		DataBean db = new DataBean();
		
		// 스트링 버퍼 활용 -> 성능 향상
		StringBuffer sb = new StringBuffer();
		sb.append("<table border=").append(border).append(" bgcolor=").append(bgcolor).append(">");
		out.println(sb.toString());
		
		/*out.println("<table border=");
		out.println(border);
		out.println(" bgcolor="); // 공백 주의!!
		out.println(bgcolor);
		out.println(">");*/
		for (String v : db.getDataList()) {
			out.println("<tr><td>" + v + "</td></tr>");
		}
		out.println("</table>");
	}
	
}
