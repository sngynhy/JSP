package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// �ٱ��� ó�� ���� ���� - ��Ʈ�ѷ� �۾�

@WebFilter("*.jsp") // ���(*) jsp ���Ϸ� �̵��Ϸ��� �ݵ�� ���� ���͸� ���İ����� ����
public class TestFilter implements Filter {

	private String encoding;
	
    public TestFilter() {
        
    }
    
    // �������� ����(��Ĺ) ���� �� (���) ���� ����
	public void destroy() {
		
	}
	
	// jsp ������ ȣ���� ������ ���� ����
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// �ܺ� ����(web.xml)�� �����س��� �ʱ�ȭ �Ű������� �������� ����
		request.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response);
	}
	
	// �����̳� ����(��Ĺ) ���� ��� (���) ���� ����
	public void init(FilterConfig fConfig) throws ServletException {
		// �ܺ�����(web.xml)�� �����س��� �ʱ�ȭ �Ű�������(==UTF-8)�� ��������� ����
		this.encoding = fConfig.getServletContext().getInitParameter("encoding");
	}
	/*
	 ����(��Ĺ) ���� �� ���� ����
	1. ������̼��� ���� ����, ������, ������ ���� ������ ����
	2. ������ - �̴ϼȶ����� ���� / ���� - �̴� ����
	3. �Է°��� ���� �� jsp�� �̵� �� doFilter() ����
	 */
}
