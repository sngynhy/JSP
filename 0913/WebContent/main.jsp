<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function signup() {
		window.open('signup.jsp', '회원가입', 'width=700, height=500');
	}
	$(document).ready(function() {
		$(".msg").click(function() {
			$(this).closest('h3').siblings('span').slideToggle(); // siblings() : 형제 노드 찾기 - ()안에는 태그, id, class 모두 사용 가능
		}); // closest() : 가장 가까운 h3 태그, parents() : 바로 상위 태그
	});
</script>
</head>
<body>

	<h2>
		<a href="control.jsp?action=main">메인로고</a>
	</h2>

	<hr>

	<h2>댓글 목록</h2>
	<c:forEach var="v" items="${datas}">
		<c:set var="m" value="${v.message}" />
		
			<div>
				<form action="control.jsp" method="post">
					<input type="hidden" name="action" value="insertRMSG">
					<input type="hidden" name="u_id" value="${selUser}">
					<input type="hidden" name="m_id" value="${m.m_id}">
					<input type="hidden" name="mcnt" value="${mcnt}">
					<h3>
						<span class="msg">${m.u_id}&gt;&gt; ${m.msg} [좋아요 ${m.favcount} | 댓글 ${m.replycount} | ${m.mdate}]</span> 
						<mytag:msgdelete m_id="${m.m_id}" u_id="${m.u_id}"/>
					</h3> 
					<span style="display: none"><input type="text" name="rmsg"
						style="width: 261px;" placeholder="댓글을 입력하세요."> <input type="submit" value="댓글달기"></span>
				<!-- </form> -->
				<ol>
					<c:forEach var="r" items="${v.rlist}">
						<li>${r.u_id}>> ${r.rmsg} [${r.rdate}] <mytag:rmsgdelete r_id="${r.r_id}" u_id="${r.u_id}"/> </li>
					</c:forEach>
				</ol>
				</form>
			</div>
		
	</c:forEach>

	<a href="control.jsp?action=main&mcnt=${mcnt+1}" id="moreview">댓글
		더보기</a>
	<br>
	<a href="control.jsp?action=selectAll" id="allview">전체 댓글 보기</a>
	<br>

	<hr>

	<c:if test="${selUser != null}">
		<form action="control.jsp" method="post">
			<!-- insert 반드시 폼으로 처리! -->
			<input type="hidden" name="action" value="insertMSG">
			<input type="hidden" name="u_id" value="${selUser}">
			<input type="hidden" name="mcnt" value="${mcnt+1}">
			<input type="text" name="msg" placeholder="댓글을 입력하세요.">
			<input type="submit" value="댓글 등록">
		</form>
	</c:if>

	<mytag:login />

</body>
</html>