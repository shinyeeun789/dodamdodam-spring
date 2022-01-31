<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 도담도담 </title>
</head>
<body class="is-preload">
<%
	String userID = null;
	String userName = null;
<<<<<<< HEAD
	String user_type = "";
<<<<<<< HEAD
	if (session.getAttribute("userVO") != null) {
		userID = (String) session.getAttribute("userVO.userID");
		userName = (String) session.getAttribute("userVO.userName");
=======
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		userName = (String) session.getAttribute("userName");
		user_type = (String) session.getAttribute("user_type");
=======
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		userName = (String) session.getAttribute("userName");
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
>>>>>>> fcea751a4ecbca473c2e7ab6ee808b7c4c6a46fa
	}
%>

	<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">
			
			<!-- Menu -->
			<nav id="menu">
				<c:if test="${empty userVO}">
					<header class="major">
						<h2>Menu</h2>
					</header>
				</c:if>
				<c:if test="${not empty userVO}">
					<header class="major">
						<h2 style="font-family:'Gothic A1', sans-serif;"> <c:out value="${userVO.userName}"/> 님, </h2>
					</header>
				</c:if>
				
				<ul>
<<<<<<< HEAD
					<c:if test="${empty userVO}">
						<li><a href="/user/login.do"> 로그인 </a></li>
					</c:if>
					<c:if test="${userVO.user_type eq '회원'}">
						<li><a href="/user/logout.do"> 로그아웃 </a></li>
						<li>
							<span class="opener"> 마이페이지 </span>
							<ul>
								<li><a href="/user/setUserName.do"> 닉네임 변경 </a></li>
								<li><a href="/user/setAllergyType.do"> 알러지 타입 변경 </a></li>
							</ul>
						</li>
						<li>
							<span class="opener"> 식단 관리 </span>
							<ul>
								<li><a href="/diet/dietPlus.do"> 식단 추가 </a></li>
								<li><a href="/diet/dietList.do"> 식단 리스트 </a></li>
							</ul>
						</li>
						<li>
							<span class="opener"> 증상 관리 </span>
							<ul>
								<li><a href="/outbreak/outbreakPlus.do"> 증상 추가 </a></li>
								<li><a href="/outbreak/outbreakList.do"> 증상 리스트 </a></li>
								<li><a href="/outbreak/medicinePlus.do"> 약 복용 정보 추가 </a></li>
							</ul>
						</li>
						<li><a href="#"> 원인 분석 </a></li>
						<li><a href="/outbreak/outbreakReport.do"> 증상 변화 </a></li>				
					</c:if>
					<c:if test="${userVO.user_type eq '관리자'}">
						<li><a href="/user/logout.do"> 로그아웃 </a></li>
						<li><a href="/manage/newFood.do"> 새로운 식품 입력 </a></li>
						<li><a href="/manage/updateRisk.do"> 식품 위험도 변경 </a></li>
					</c:if>
=======
				<% if(userID == null) { %>
					<li><a href="/user/login.do"> 로그인 </a></li>
				<% } else if (user_type.equals("회원")) { %>
					<li><a href="/user/logout.do"> 로그아웃 </a></li>
					<li>
						<span class="opener"> 마이페이지 </span>
						<ul>
							<li><a href="/user/setUserName.do"> 닉네임 변경 </a></li>
							<li><a href="/user/setAllergyType.do"> 알러지 타입 변경 </a></li>
						</ul>
					</li>
<<<<<<< HEAD
=======
				<% } %>
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
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
				<% } else { %>
					<li><a href="/user/logout.do"> 로그아웃 </a></li>
					<li><a href="/manage/newFood.do"> 새로운 식품 입력 </a></li>
					<li><a href="/manage/updateRisk.do"> 식품 위험도 변경 </a></li>
				<% } %>
>>>>>>> fcea751a4ecbca473c2e7ab6ee808b7c4c6a46fa
					<li><a href="/food/search.do"> 식품 검색 </a></li>
					
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