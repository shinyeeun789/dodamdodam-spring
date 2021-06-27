<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 도담도담 </title>
</head>
<body class="is-preload">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">
			<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>Menu</h2>
				</header>
				<ul>
				<% if(userID == null) { %>
					<li><a href="/user/login"> 로그인 </a></li>
				<% } else { %>
					<li><a href="/logout"> 로그아웃 </a></li>
				<% } %>
					<li>
						<span class="opener"> 식단 관리 </span>
						<ul>
							<li><a href="#"> 식단 추가 </a></li>
							<li><a href="#"> 식단 리스트 </a></li>
							<li><a href="#"> 내 갤러리 </a></li>
						</ul>
					</li>
					<li>
						<span class="opener"> 증상 관리 </span>
						<ul>
							<li><a href="#"> 증상 추가 </a></li>
							<li><a href="#"> 증상 리스트 </a></li>
						</ul>
					</li>
					<li><a href="#"> 원인 분석 </a></li>
					<li><a href="#"> 증상 변화 </a></li>
				</ul>
			</nav>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Reference</h2>
				</header>
				<p> 제공하는 정보의 알러지 성분은 제품의 제조사에서 제공한 정보이며, 알레르기 유발 식재료의 종류는 식약처장에서 발표한 자료입니다. 또한, 본 웹에서 제공하는 모든 정보는 참고 사항입니다.</p>
				<ul class="contact">
					<li class="icon solid fa-envelope"> tlsdpdms789@naver.com </li>
					<li class="icon solid fa-home"> https://github.com/shinyeeun789 </li>
				</ul>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<p class="copyright">&copy; Untitled. All rights reserved. Images: <a href="https://www.flaticon.com">Flaticon</a> And <a href="https://www.iconfinder.com">IconFinder</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
			</footer>
		</div>
	</div>
</body>
</html>