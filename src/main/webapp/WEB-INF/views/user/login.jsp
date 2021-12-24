<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
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
				<!-- 로그인 폼 -->
				<section>
					<h3> LOGIN </h3>
					<form method="post">
						<div class="row gtr-uniform">
							<div class="col-12">
								<input type="text" name="userID" id="userID" placeholder="아이디">
							</div>
							<div class="col-12">
								<input type="password" name="userPassword" id="userPassword" placeholder="비밀번호">
							</div>
							
							<c:if test="${msg == 0}">
								<p style="color:red;"> 로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요. </p>
							</c:if>
							<c:if test="${msg == -1}">
								<p style="color:red;"> 회원가입되지 않은 아이디입니다. </p>
							</c:if>
							<!-- Break -->
							<div class="col-12">
								<input type="submit" value="LOGIN" class="primary" />
							</div>
						</div>
					</form>
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