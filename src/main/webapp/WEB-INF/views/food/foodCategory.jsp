<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">		<!-- 모바일 반응형을 만들 때 필요 -->
<title> 도담도담 </title>
<link rel="stylesheet" href="../resources/css/main.css">
</head>
<body class="is-preload">
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
				<!-- 검색 -->
				<section>
					<header class="major">
						<h2> Food Category </h2>
					</header>
					<div class="posts">
						<c:forEach items="${foodList}" var="foodVO">
							<article>
								<c:if test="${fn:contains(foodVO.image, 'http')}">
									<a href="/food/foodDetail.do?foodID=${foodVO.foodID}" class="image"><img src="${foodVO.image}" alt="" /></a>
								</c:if>
								<c:if test="${!fn:contains(foodVO.image, 'http')}">
									<a href="/food/foodDetail.do?foodID=${foodVO.foodID}" class="image"><img src="../../resources/picture/${foodVO.image}" alt="" /></a>
								</c:if>
								<h3> [ ${foodVO.manufacturer} ] ${foodVO.foodName} </h3>
								<p> ${foodVO.ingredient} </p>
								<ul class="actions">
									<li><a href="/food/foodDetail.do?foodID=${foodVO.foodID}" class="button"> MORE </a></li>
								</ul>
							</article>
						</c:forEach>
					</div>
				</section>
			</div>
		</div>	
		<!-- Menu -->
		<jsp:include page="../menu.jsp" flush="false"/>		
	</div>
	
	<!-- Scripts -->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/browser.min.js"></script>
	<script src="../resources/js/breakpoints.min.js"></script>
	<script src="../resources/js/util.js"></script>
	<script src="../resources/js/main.js"></script>
</body>
</html>