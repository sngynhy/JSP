<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.message.*, java.util.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!-- control에서 넘겨받은 datas는 객체가 ArrayList이고, request에 저장되어있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 화면</title>
</head>
<body>

	<h2>게시글 목록</h2>	
	<hr>
	<a href="form.jsp">글 등록</a>
	<hr>
	<!-- 글 등록은 사전에 데이터 이용이 필요하지 않기 때문에 굳이 컨트롤러를 거치지 않고 바로 form페이지로 이동 -->
	<table border="1">
		<tr>
			<th>글 번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
		<%				// useBean class 속성에서 제네릭을 사용하지 않았기 때문에 캐스팅 필요!
			for (MessageVO vo : (ArrayList<MessageVO>) datas) {
		%>
			<tr>
				<!-- 글 번호 클릭 시 상세페이지로 이동 -->
										<!-- 파라미터로 edit과 mnum 넘겨주기 -->
				<td><a href="control.jsp?action=edit&mnum=<%=vo.getMnum()%>"><%=vo.getMnum()%></a></td> <!-- 글 변경을 위한 비밀번호 확인 등의 인증작업 처리 필요! -->
				<td><%= vo.getTitle() %></td>
				<td><%= vo.getWriter() %></td>
				<td><%= vo.getWdate() %></td>
			</tr>
		<%
			}
		%>
	</table>
	
</body>
</html>