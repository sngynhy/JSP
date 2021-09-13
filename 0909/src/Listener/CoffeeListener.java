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
    	 coffee.add("아메리카노");
    	 coffee.add("카페모카");
    	 coffee.add("아인슈페너");
    	 context.setAttribute("coffee", coffee); // application 단위로 초기 데이터 설정
    }
	
}
