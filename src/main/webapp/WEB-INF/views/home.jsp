<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">		<!-- 모바일 반응형을 만들 때 필요 -->
<title> 도담도담 </title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body class="is-preload">
<script>
	var result = '${msg}';
	if (result == 'success')) {
		
	}
</script>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="/main.do" class="logo"> 도담도담 </a>
					<ul class="icons">
						<li><a href="https://github.com/shinyeeun789" class="icon brands fa-github"><span class="label"> GitHub </span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span class="label"> Mail </span></a></li>
					</ul>
				</header>
				
				<% if (userID == null) { %>
					<!-- Banner -->
					<section id="banner">
						<div class="content">
							<header>
								<h1> 알레르기 유발 식재료 </h1>
								<p> 식약처장 발표 자료 </p>
							</header>
							<p> 난류, 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합 포함) </p>
							<ul class="actions">
								<li><a href="/user/login.do" class="button big"> LOGIN </a></li>
							</ul>
						</div>
						<span class="image object">
							<img src="resources/picture/allergy.png" alt=""/>
						</span>
					</section>
					
				<% } else { %>
				
				<% } %>
				
				<!-- 식품 검색 -->
				<section>
					<header class="major">
						<h2> Search Food </h2>
					</header>
					
					<!-- Search -->				
					<section id="search" class="alt">
						<form method="post" action="#">
							<input type="text" name="keyword" id="keyword" placeholder="제품명 또는 제조사를 검색해보세요!" />
						</form>
					</section>
				</section>
				
				<!-- 식품 카테고리 -->
				<section>
					<header class="major">
						<h2> Food Category </h2>
					</header>
					
					<div class="posts">
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_피자.png" alt=""/></a>
							<h3> 피자 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_치킨.png" alt="" width="40%" /></a>
							<h3> 치킨 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_분식.png" alt="" width="40%" /></a>
							<h3> 분식 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_패스트푸드.png" alt="" width="40%" /></a>
							<h3> 패스트푸드 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_빵.png" alt="" width="40%" /></a>
							<h3> 빵 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_간식.png" alt="" width="40%" /></a>
							<h3> 간식 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_가공식품.png" alt="" width="40%" /></a>
							<h3> 가공식품 </h3>
						</article>
						<article>
							<a href="#" class="image"><img src="resources/picture/카테고리_기타.png" alt="" width="40%" /></a>
							<h3> 기타 </h3>
						</article>
					</div>
				</section>
			</div>
		</div>	
		<!-- Menu -->
		<jsp:include page="menu.jsp" flush="false"/>		
	</div>
	
	<!-- Scripts -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/browser.min.js"></script>
	<script src="resources/js/breakpoints.min.js"></script>
	<script src="resources/js/util.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>