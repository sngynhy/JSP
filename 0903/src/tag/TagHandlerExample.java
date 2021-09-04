package tag;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TagHandlerExample extends SimpleTagSupport {
	
	private String size;
	private String color;
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public void doTag() throws IOException, JspException {
		
		JspWriter out = getJspContext().getOut();
		JspFragment body = getJspBody();
		
		StringBuffer sb = new StringBuffer();
		
		if (body != null) {
			sb.append("<p style='font-size:").append(size).append("; color:").append(color).append(";'>");
			System.out.println(sb.toString());
			out.println(sb.toString());
			body.invoke(null);
			
			out.println("</p>");
		}
	}
	
}
