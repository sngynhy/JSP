<%@page import="model.message.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request"/>

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>글 수정/삭제 화면</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript">
	function del() {
		result = confirm("정말로 삭제하시겠습니까?");
		if (result == true) {
			document.form1.action.value = "delete"; // form1의 action 파라미터를 delete로 설정
			document.form1.submit();
		} else {
			return;
		}
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
					<h2>게시글 수정</h2>
					<div class="table-wrapper">
					<form action="control.jsp" method="post" name="form1">
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="mnum" value="<%= data.getMnum() %>">
					<input type="hidden" name="mnum" value="<%= data.getId() %>">
						<table>	
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" value="<%= data.getTitle() %>"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><input type="text" name="content" value="<%= data.getContent() %>"></td>
								</tr>
								<tr>
									<th>작성일</th>
									<td><input type="date" name="date" value="<%= data.getWdate() %>"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2" align="right">
										<input type="submit" value="내용 수정" class="button">
										<input type="button" value="글 삭제" class="button" onclick="del()">
										<input type="button" value="메인으로" onclick="location.href='control.jsp?action=list'">
									</td>
								</tr>
							</tfoot>
						</table>
					</form>	
					</div>

					<!-- <h3>Alternate</h3>
					<div class="table-wrapper">
						<table class="alt">
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Item One</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item Two</td>
									<td>Vis ac commodo adipiscing arcu aliquet.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item Three</td>
									<td>Morbi faucibus arcu accumsan lorem.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item Four</td>
									<td>Vitae integer tempus condimentum.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item Five</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</section>

				Buttons
				<section>
					<h3>Buttons</h3>
					<ul class="actions">
						<li><a href="#" class="button primary">Primary</a></li>
						<li><a href="#" class="button">Default</a></li>
					</ul>
					<ul class="actions">
						<li><a href="#" class="button large">Large</a></li>
						<li><a href="#" class="button">Default</a></li>
						<li><a href="#" class="button small">Small</a></li>
					</ul>
					<ul class="actions fit">
						<li><a href="#" class="button primary fit">Fit</a></li>
						<li><a href="#" class="button fit">Fit</a></li>
						<li><a href="#" class="button fit">Fit</a></li>
					</ul>
					<ul class="actions fit small">
						<li><a href="#" class="button primary fit small">Fit +
								Small</a></li>
						<li><a href="#" class="button fit small">Fit + Small</a></li>
						<li><a href="#" class="button fit small">Fit + Small</a></li>
					</ul>
					<ul class="actions">
						<li><a href="#" class="button primary icon solidfa-download">Icon</a></li>
						<li><a href="#" class="button icon solid fa-upload">Icon</a></li>
						<li><a href="#" class="button icon solid fa-save">Icon</a></li>
					</ul>
					<ul class="actions">
						<li><span class="button primary disabled">Disabled</span></li>
						<li><span class="button disabled">Disabled</span></li>
					</ul>
				</section>

				Form
				<section>
					<h2>Form</h2>
					<form method="post" action="#">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="demo-name" id="demo-name" value=""
									placeholder="Name" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="email" name="demo-email" id="demo-email" value=""
									placeholder="Email" />
							</div>
							<div class="col-12">
								<select name="demo-category" id="demo-category">
									<option value="">- Category -</option>
									<option value="1">Manufacturing</option>
									<option value="1">Shipping</option>
									<option value="1">Administration</option>
									<option value="1">Human Resources</option>
								</select>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="demo-priority-low" name="demo-priority"
									checked> <label for="demo-priority-low">Low</label>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="demo-priority-normal"
									name="demo-priority"> <label for="demo-priority-normal">Normal</label>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="demo-priority-high" name="demo-priority">
								<label for="demo-priority-high">High</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" id="demo-copy" name="demo-copy">
								<label for="demo-copy">Email me a copy</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" id="demo-human" name="demo-human" checked>
								<label for="demo-human">Not a robot</label>
							</div>
							<div class="col-12">
								<textarea name="demo-message" id="demo-message"
									placeholder="Enter your message" rows="6"></textarea>
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" value="Send Message"
										class="primary" /></li>
									<li><input type="reset" value="Reset" /></li>
								</ul>
							</div>
						</div>
					</form>
				</section>

				Image
				<section>
					<h2>Image</h2>
					<h3>Fit</h3>
					<div class="box alt">
						<div class="row gtr-uniform">
							<div class="col-12">
								<span class="image fit"><img src="images/pic04.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic01.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic02.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic03.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic03.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic01.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic02.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic02.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic03.jpg"
									alt="" /></span>
							</div>
							<div class="col-4">
								<span class="image fit"><img src="images/pic01.jpg"
									alt="" /></span>
							</div>
						</div>
					</div>
					<h3>Left &amp; Right</h3>
					<p>
						<span class="image left"><img src="images/pic05.jpg" alt="" /></span>Fringilla
						nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis
						eget. tempus euismod. Vestibulum ante ipsum primis in faucibus
						vestibulum. Blandit adipiscing eu felis iaculis volutpat ac
						adipiscing accumsan eu faucibus. Integer ac pellentesque praesent
						tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
						ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
						iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
						pellentesque praesent. Donec accumsan interdum nisi, quis
						tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
						ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
						iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
						pellentesque praesent tincidunt felis sagittis eget. tempus
						euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
						Blandit adipiscing eu felis iaculis volutpat ac adipiscing
						accumsan eu faucibus. Integer ac pellentesque praesent. Blandit
						adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu
						faucibus. Integer ac pellentesque praesent tincidunt felis
						sagittis eget. tempus euismod. Vestibulum ante ipsum primis in
						faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat
						ac adipiscing accumsan eu faucibus. Integer ac pellentesque
						praesent lorem ipsum dolor sit amet veroeros consequat. Etiam
						tempus lorem ipsum.
					</p>
					<p>
						<span class="image right"><img src="images/pic06.jpg"
							alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis
						tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
						ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
						iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
						pellentesque praesent tincidunt felis sagittis eget. tempus
						euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
						Blandit adipiscing eu felis iaculis volutpat ac adipiscing
						accumsan eu faucibus. Integer ac pellentesque praesent. Donec
						accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus
						euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
						Blandit adipiscing eu felis iaculis volutpat ac adipiscing
						accumsan eu faucibus. Integer ac pellentesque praesent tincidunt
						felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis
						in faucibus vestibulum. Blandit adipiscing eu felis iaculis
						volutpat ac adipiscing accumsan eu faucibus. Integer ac
						pellentesque praesent. Blandit adipiscing eu felis iaculis
						volutpat ac adipiscing accumsan eu faucibus. Integer ac
						pellentesque praesent tincidunt felis sagittis eget. tempus
						euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
						Blandit adipiscing eu felis iaculis volutpat ac adipiscing
						accumsan eu faucibus..
					</p>
				</section> -->

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