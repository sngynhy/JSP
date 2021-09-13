package Listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener // 톰캣이 실행되면 감지하여 자동으로 실행
public class TestListener implements ServletContextListener {

    public TestListener() {
        // TODO Auto-generated constructor stub
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

    public void contextInitialized(ServletContextEvent sce)  { 
        // 서버 실행 즉시 미리 객체 생성 
    	ServletContext context = sce.getServletContext();
    	context.setAttribute("student", new Student("홍길동", 97)); // 초기화 데이터 설정 - scope=application
    }
	
}
