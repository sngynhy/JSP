package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 다국어 처리 필터 생성 - 컨트롤러 작업

@WebFilter("*.jsp") // 모든(*) jsp 파일로 이동하려면 반드시 현재 필터를 거쳐가도록 설정
public class TestFilter implements Filter {

	private String encoding;
	
    public TestFilter() {
        
    }
    
    // 컨네이터 서버(톰캣) 종료 시 (모든) 필터 해제
	public void destroy() {
		
	}
	
	// jsp 파일을 호출할 때마다 필터 실행
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 외부 파일(web.xml)에 설정해놓은 초기화 매개변수를 참조함을 선언
		request.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response);
	}
	
	// 컨테이너 서버(톰캣) 실행 즉시 (모든) 필터 생성
	public void init(FilterConfig fConfig) throws ServletException {
		// 외부파일(web.xml)에 설정해놓은 초기화 매개변수값(==UTF-8)을 멤버변수로 저장
		this.encoding = fConfig.getServletContext().getInitParameter("encoding");
	}
	/*
	 서버(톰캣) 실행 시 수행 과정
	1. 어노테이션을 통해 서블릿, 리스너, 필터의 존재 유무를 감지
	2. 리스너 - 이니셜라이즈 실행 / 필터 - 이닛 실행
	3. 입력값을 받은 후 jsp로 이동 시 doFilter() 실행
	 */
}
