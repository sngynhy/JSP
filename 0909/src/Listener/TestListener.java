package Listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener // ��Ĺ�� ����Ǹ� �����Ͽ� �ڵ����� ����
public class TestListener implements ServletContextListener {

    public TestListener() {
        // TODO Auto-generated constructor stub
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

    public void contextInitialized(ServletContextEvent sce)  { 
        // ���� ���� ��� �̸� ��ü ���� 
    	ServletContext context = sce.getServletContext();
    	context.setAttribute("student", new Student("ȫ�浿", 97)); // �ʱ�ȭ ������ ���� - scope=application
    }
	
}
