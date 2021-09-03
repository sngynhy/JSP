<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.message.*, java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="memberVO" class="model.member.MemberVO" scope="session" />

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>게시글 목록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript">
	function check(mnum, id) {
		if (id == '<%=memberVO.getId()%>') {
			document.location.href="control.jsp?action=edit&mnum=" + mnum;
		} else {
			alert("접근 권한이 없습니다!");
		}
	}

	function mylist() {
		document.form1.action.value = "mylist";
		document.form1.submit();
	}
</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>Elements</h1>
			<p>Ipsum dolor sit amet nullam</p>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Content -->
			<section id="content" class="main">

				<!-- Table -->
				<!-- 여기에 추가해~~~~~~~~~~~~~~~~~ -->
				<section>
					<h2>게시글 목록</h2>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (datas.size() == 0) {
										%>
										<tr>
											<td colspan="5" align="center">검색 결과가 없습니다.</td>
										</tr>
										<%
									} else {
										for (MessageVO vo : (ArrayList<MessageVO>) datas) { // useBean class 속성에서 제네릭을 사용하지 않았기 때문에 캐스팅 필요!
								%>
									<tr>
										<!-- 글 번호 클릭 시 상세페이지로 이동 -->
																<!-- 파라미터로 edit과 mnum 넘겨주기 -->
										<%-- <td><a href="control.jsp?action=edit&mnum=<%=vo.getMnum()%>"><%=vo.getMnum()%></a></td> --%>
										<td><%=vo.getMnum()%></td> <!-- 글 변경을 위한 비밀번호 확인 등의 인증작업 처리 필요! -->
										<td><a href="javascript:check(<%=vo.getMnum()%>,'<%=vo.getId()%>')"><%=vo.getTitle()%></a></td>	
										<td><%=vo.getId()%></td>
										<td><%=vo.getWdate()%></td>
									</tr>
								<%
										}
									}
								%>
							
							</tbody>
						</table>
						<form action="control.jsp" name="form1">
							<input type="hidden" name="action" value="list">
							<table>
								<tr>
									<td><input type="text" name="search"></td>
									<td><input type="submit" value="검색"></td>
									<td><input type="button" name="myself" value="내 게시글" onclick="mylist()"></td>
									<td><input type="button" value="글쓰기" class="button" onclick="location.href='form.jsp'"></td>
								</tr>
							</table>
						</form>
						<form action="control.jsp" method="post" name="form2">
							<input type="hidden" name="action" value="logout">
							<input type="submit" value="SIGN OUT" class="button">
						</form>
					</div>

			</section>

		</div>

		<!-- Footer -->
		<footer id="footer">
			<section>
				<h2>Aliquam sed mauris</h2>
				<p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat
					consequat magna adipiscing tempus etiam dolore veroeros. eget
					dapibus mauris. Cras aliquet, nisl ut viverra sollicitudin, ligula
					erat egestas velit, vitae tincidunt odio.</p>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</section>
			<section>
				<h2>Etiam feugiat</h2>
				<dl class="alt">
					<dt>Address</dt>
					<dd>1234 Somewhere Road &bull; Nashville, TN 00000 &bull; USA</dd>
					<dt>Phone</dt>
					<dd>(000) 000-0000 x 0000</dd>
					<dt>Email</dt>
					<dd>
						<a href="#">information@untitled.tld</a>
					</dd>
				</dl>
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter alt"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f alt"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-instagram alt"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands fa-github alt"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon brands fa-dribbble alt"><span
							class="label">Dribbble</span></a></li>
				</ul>
			</section>
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>