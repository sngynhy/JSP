package Listener;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class CoffeeListener implements ServletContextListener {

    public CoffeeListener() {
        
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	 ServletContext context = sce.getServletContext();
    	 ArrayList<String> coffee = new ArrayList<String>();
    	 coffee.add("�Ƹ޸�ī��");
    	 coffee.add("ī���ī");
    	 coffee.add("���ν����");
    	 context.setAttribute("coffee", coffee); // application ������ �ʱ� ������ ����
    }
	
}
