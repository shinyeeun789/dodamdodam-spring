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
	<script type="text/javascript">
		<c:if test="${msg == 1}">
			alert('회원가입되었습니다.');
		</c:if>
	</script>
	
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
								<input type="text" name="userID" id="userID" placeholder="아이디" autocomplete="off">
							</div>
							<div class="col-12">
								<input type="password" name="userPassword" id="userPassword" placeholder="비밀번호">
							</div>
							
							<c:if test="${msg == 0}">
								<p style="color:red;"> 아이디 또는 비밀번호가 잘못 입력되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요. </p>
							</c:if>
							<!-- Break -->
							<div class="col-12">
								<input type="submit" value="&nbsp; &nbsp; &nbsp; &nbsp; LOGIN &nbsp; &nbsp; &nbsp; &nbsp;" class="primary" />
							</div>
							<div class="col-12" onclick="kakaoLogin()">
								<img src="../../resources/picture/kakao_login.png">
							</div>
						</div>
					</form>
					<div class="row gtr-uniform">
						<div class="col-12">
							<p> 아직 회원이 아니신가요? </p>
							<button onclick="location='/user/join.do'"> 
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;JOIN&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</button>
						</div>
					</div>
				</section>
			</div>
		</div>	
		<!-- Menu -->
		<jsp:include page="../menu.jsp" flush="false"/>		
	</div>
	
	<!-- Kakao Script -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('1052bc1543b3ee1978691f75c7c4cb7c');
		console.log(Kakao.isInitialized());					// sdk 초기화 여부 판단
		
		// 카카오 로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success: function(response) {
					Kakao.API.request({
						url: '/v2/user/me',
						success: function (res) {
							console.log(res.id);
							
							$.ajax({
								url : "/user/kakaoLogin.do",
								method : "POST",
								data : {"userID" : res.kakao_account.email,
										"userName" : res.properties.nickname},
								success : function(data) {
									if (data == 1) {				// 로그인
										location.href="/main.do";
									} else if (data == 0) {			// 회원가입
										location.href="/user/setAllergyType.do"
									}
								},
								fail : function(error) {
									console.log(error);
								}
							});
						},
						fail: function(error) {
							console.log(error);
						},
					})
				},
				fail: function(error) {
					console.log(error);
				}
			})
		}
		
		// 카카오 로그아웃
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url: '/v1/user/unlink',
					success: function(response) {
						console.log(response);
					},
					fail: function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined);
			}
		}
		
	</script>
	
	<!-- Scripts -->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/browser.min.js"></script>
	<script src="../resources/js/breakpoints.min.js"></script>
	<script src="../resources/js/util.js"></script>
	<script src="../resources/js/main.js"></script>
</body>
</html>