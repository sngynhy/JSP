package tag;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TestTagHandler extends SimpleTagSupport {
	
	// doTag() : ���� �±��� ����� �����ϴ� �޼ҵ�
	// ���� �±׸� ������ ȣ���
	public void doTag() throws IOException {
		
		// getOut() : JSP�κ��� ������ �޾ƿ� �� �ֵ��� �ϴ� �޼ҵ�
		// out ���� ��ü�� ������ �� ���
		JspWriter out = getJspContext().getOut();
		out.println("�±� �ڵ鷯 Ŭ���� ��� �ǽ���!");
	}
	
}
