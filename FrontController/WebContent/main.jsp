<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function signup() {
		window.open('signup.jsp', '회원가입', 'width=700, height=500');
	}
	$(document).ready(function() {
		$(".msg").click(function() {
			$(this).closest('h4').siblings('span').slideToggle(); // siblings() : 형제 노드 찾기 - ()안에는 태그, id, class 모두 사용 가능
		}); // closest() : 가장 가까운 h4 태그, parents() : 바로 상위 태그
	});
	$.ajax({
		type: "GET",
		url: "data.json",
		dataType: "json",
		success: function(data) {
			var str = '';
			$.each(data, function(index, obj){
				str += '<a href="' + obj.link + '" target="_blank"><img src="img/' + obj.imgFileL + '" alt="' + obj.item + '"></a><br>';
			});
			$('.ad').append(str);
		},
		error: function() {
			alert("에러 발생!");
		}
	})
</script>
</head>
<body>
<header>
	<h1>
		<a href="main.do">메인로고</a>
	</h1>
</header>

<section>
	<h2>댓글 목록</h2>
	<c:forEach var="v" items="${datas}">
		<c:set var="m" value="${v.message}" />
		
			<div>
				<form action="insertRmsg.do" method="post">
					<input type="hidden" name="u_id" value="${sssUser}">
					<input type="hidden" name="selUser" value="${selUser}">
					<input type="hidden" name="m_id" value="${m.m_id}">
					<input type="hidden" name="mcnt" value="${mcnt}">
					<h4>
						<span class="msg">${m.u_id} &gt;&gt; ${m.msg} [좋아요 ${m.favcount} | 댓글 ${m.replycount} | ${m.mdate}] </span>
						<a href="favcount.do?m_id=${m.m_id}&mcnt=${mcnt}&selUser=${selUser}" color="red">❤</a> 
						<mytag:msgdelete m_id="${m.m_id}" u_id="${m.u_id}"/>
					</h4> 
					<span style="display: none">
						<input type="text" name="rmsg" style="width: 261px;" placeholder="댓글을 입력하세요."> <input type="submit" value="댓글달기">
					</span>
				<ol>
					<c:forEach var="r" items="${v.rlist}">
						<li>${r.u_id}>> ${r.rmsg} [${r.rdate}] <mytag:rmsgdelete r_id="${r.r_id}" u_id="${r.u_id}" m_id="${r.m_id}"/> </li>
					</c:forEach>
				</ol>
				</form>
			</div>
		
	</c:forEach>

	<a href="main.do?mcnt=${mcnt+1}" id="moreview">댓글
		더보기</a>
	<br>
	<a href="main.do?mcnt=20" id="allview">전체 댓글 보기</a>
	<br>

	<c:if test="${sssUser != null}">
		<form action="insertMsg.do" method="post">
			<!-- insert 반드시 폼으로 처리! -->
			<input type="hidden" name="u_id" value="${sssUser}">
			<input type="hidden" name="mcnt" value="${mcnt+1}">
			<input type="text" name="msg" placeholder="댓글을 입력하세요.">
			<input type="submit" value="댓글 등록">
		</form>
	</c:if>

	<mytag:login />
	
	
	<h4>신규 회원 목록</h4>
	<ol>
		<c:forEach var="v" items="${newUsers}">
			<li><a href="main.do?selUser=${v.u_id}&mcnt=${mcnt}">${v.u_id}[${v.name}]</a>님 가입완료</li>
		</c:forEach>
	</ol>
	
</section>
<aside>
	<div class="ad"></div>
</aside>
</body>
</html>