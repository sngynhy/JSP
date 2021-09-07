package test;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class InitialMember implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) { // DB 해제
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) { // DB 연결
		
		// DB 데이터 생성 -> Member.java
		ArrayList<Member> datas = new ArrayList<Member>();
		for (int i=0; i<5; i++) {
			Member data = new Member("티모" + i, "timo" + i + "@naver.com");
			datas.add(data);
		}
		
		datas.add(new Member("아리", null));
		datas.add(new Member("아무무", null));
		
		// 현재 만든 데이터들은 톰캣이 시작될 때 생성됨
		// 톰캣이 종료되기 전까지 유지하고 싶다면 scope=application으로 저장
		ServletContext context = sce.getServletContext();
		context.setAttribute("member", new Member());
		context.setAttribute("members", datas); // application scope에 저장됨
	}
}
