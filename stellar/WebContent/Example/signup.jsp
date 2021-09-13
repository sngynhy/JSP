<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML>
<html>
<head>
<title>회원가입 화면</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function checkID() { // 회원 가입 시 ID 중복 체크하는 함수
		$.ajax({ 
			type: "GET", // 단순 정보 조회 시에는 GET, 정보가 너무 많거나 insert/update를 할때는 POST
			url: "control.jsp",
			data: {
				action : 'checkID',
				id : $("#id").val() // $().val() : 값 가져오기
			},
			success: function(data) { 
				if (data.trim()=="false") { // 중복 데이터가 없을 때, trim():문자열 공백제거
					alert("사용 가능한 ID입니다.");
				} else {
					alert("ID가 이미 존재합니다. 다시 입력하세요.");
				}
			},
			error: function(xhr) {
				console.log(xhr.status + " : " + xhr.errorText);
				alert("에러발생!");
			}
		});
	}
</script>
</head>
<body class="is-preload">

<%
	session.invalidate();
	if(application.getAttribute("cnt")==null){
		application.setAttribute("cnt", 0);
	}
%>

	<!-- Wrapper -->
		<div id="wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<span class="logo"><img src="images/logo.svg" alt="" /></span>
					<h1>Stellar</h1>
					<p>Just another free, fully responsive site template<br />
					built by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a href="https://html5up.net">HTML5 UP</a>.</p>
				</header>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="#intro" class="active">Introduction</a></li>
						<li><a href="#first">First Section</a></li>
						<li><a href="#second">Second Section</a></li>
						<li><a href="#cta">Get Started</a></li>
					</ul>
				</nav>

			<!-- Main -->
				<div id="main">

					<!-- Introduction -->
						<section id="intro" class="main">
							<div class="spotlight">
								<div class="content">
									<header class="major">
										<h2>SIGN UP</h2>
									</header>
									<form action="control.jsp" method="post" name="form1">
									<input type="hidden" name="action" value="signup">
										<table border="1">
											<tr>
												<td>ID</td>
												<td><input type="text" name="id" id="id" required></td>
												<td><button type="button" name="btn" id="idcheck" onclick="checkID()">ID 중복확인</button></td>
											</tr>
											<tr>
												<td>PW</td>
												<td><input type="password" name="pw" required></td>
											</tr>
											<tr>
												<td>NAME</td>
												<td><input type="text" name="name" required></td>
											</tr>
											<tr>
												<td align="right"><input type="submit" value="회원가입"></td>
											</tr>
										</table>
									</form>
								</div>
								<span class="image"><img src="images/mushroom.ico" alt="버섯 아이콘" /></span>
							</div>
							
						</section>
			
			<!-- Footer -->
				<footer id="footer">
					<section>
						<h2>Aliquam sed mauris</h2>
						<p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat consequat magna adipiscing tempus etiam dolore veroeros. eget dapibus mauris. Cras aliquet, nisl ut viverra sollicitudin, ligula erat egestas velit, vitae tincidunt odio.</p>
						<ul class="actions">
							<li><a href="generic.html" class="button">Learn More</a></li>
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
							<dd><a href="#">information@untitled.tld</a></dd>
						</dl>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter alt"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f alt"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram alt"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github alt"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon brands fa-dribbble alt"><span class="label">Dribbble</span></a></li>
						</ul>
					</section>
					<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
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