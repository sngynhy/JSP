<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.order.*, model.product.*"%>
<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Stellar by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
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
											<h2><%=session.getAttribute("userID")%>님의 주문목록</h2>
										</header>
										<section>
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
														<th>userID</th>
														<th>product</th>
														<th>orderCnt</th>
													</tr>
												</thead>
												<tbody>
												<%
												ArrayList<OrderVO> list=(ArrayList)session.getAttribute("list");
												if(list==null){
													
													out.println("<tr>");
													out.println("<td colspan='3'>주문 내용이 없습니다.</td>");
													out.println("</tr>");
													out.println("</tbody>");
												}
												else{
													application.setAttribute("cnt", (Integer)application.getAttribute("cnt")+1);
													int totalPrice=new OrderDAO().calc(list);
															// list안에 들어가있는 데이터들의 금액의 합을 구하는 알고리즘이 필요!
													for(OrderVO vo:list){
														out.println("<tr>");
														out.println("<td>"+vo.getUserID()+"</td>");
														out.println("<td>"+vo.getProduct()+"</td>");
														out.println("<td>"+vo.getOrderCnt()+"</td>");
														out.println("</tr>");
													}
													out.println("</tbody>");
													out.println("<tfoot>");
													out.println("<tr>");
													out.println("<td colspan='3' align='right'>총 금액 : "+totalPrice+"원</td>");
													out.println("</tr>");
													out.println("</tfoot>");
												}
												%>
												
											</table>
										</div>
									</section>
										<a href="index.jsp" class="button primary">처음으로 돌아가기</a>
									</div>
									<span class="image"><img src="images/tmIcon.png" alt="티모 아이콘" /></span>
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