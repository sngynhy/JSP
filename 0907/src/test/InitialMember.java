package test;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class InitialMember implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) { // DB ����
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) { // DB ����
		
		// DB ������ ���� -> Member.java
		ArrayList<Member> datas = new ArrayList<Member>();
		for (int i=0; i<5; i++) {
			Member data = new Member("Ƽ��" + i, "timo" + i + "@naver.com");
			datas.add(data);
		}
		
		datas.add(new Member("�Ƹ�", null));
		datas.add(new Member("�ƹ���", null));
		
		// ���� ���� �����͵��� ��Ĺ�� ���۵� �� ������
		// ��Ĺ�� ����Ǳ� ������ �����ϰ� �ʹٸ� scope=application���� ����
		ServletContext context = sce.getServletContext();
		context.setAttribute("member", new Member());
		context.setAttribute("members", datas); // application scope�� �����
	}
}
