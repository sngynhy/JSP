package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { // 인터페이스
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	// 파라미터로 response, request를 받아 page를 리턴
	// 페이지 경로(path)와 페이지 전달방식(redirect)이 필요하므로 두 값을 필드로 갖는 ActionForward 클래스를 만들어 리턴!
	
}