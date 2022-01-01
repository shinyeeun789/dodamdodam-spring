<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				
				<!-- Food Detail -->
				<section id="banner">
					<div class="content">
						<header>
							<h2 style="font-family:'Gothic A1', sans-serif;"> [ ${foodInfo.manufacturer} ] ${foodInfo.foodName} </h2>
						</header>
						<br>
						<div class="col-12">
							<h3 style="font-family:'Gothic A1', sans-serif;"> 성분 정보 </h3>
							<h4 style="font-family:'Gothic A1', sans-serif; color: gray"> ${foodInfo.ingredient} </h4>
						</div>
						<br><br>
						<div class="col-12">
							<c:if test="${foodInfo.crossContamination eq ''}">
								<h3 style="font-family:'Gothic A1', sans-serif;"> 교차오염 정보 </h3>
								<h4 style="font-family:'Gothic A1', sans-serif; color: gray"> 교차 오염 정보가 없습니다. </h4>
							</c:if>
							<c:if test="${foodInfo.crossContamination ne ''}">
								<h3 style="font-family:'Gothic A1', sans-serif;"> 교차오염 정보 </h3>
								<h4 style="font-family:'Gothic A1', sans-serif; color: gray"> ${foodInfo.crossContamination} 를 원료로 한 제품과 같은 제조시설에서 제조하였습니다. </h4>
							</c:if>
						</div>
					</div>
					<span class="image object">
						<img src="../../resources/picture/${foodInfo.image}" alt="" />
					</span>
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