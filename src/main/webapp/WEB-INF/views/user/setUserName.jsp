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
	<script type="text/javascript">
		// 회원가입 폼 유효성 검사
		function nameForm_check() {
			
			var userName = document.getElementById("userName");
			
			if (!userName.value) {
				alert('닉네임을 입력해주세요 :)');
				userName.focus();
				return false;
			}
			
			// 닉네임 중복체크
			$.ajax({
				url : "/user/nameCheck.do",
				type : "post",
				dataType : "json",
				data : {"userName" : userName.value},
				success : function(data) {
					if (data == 1) {
						alert("이미 사용 중인 닉네임입니다");
						userName.focus();
					} else if (data == 0) {
						// 입력 값 전송
						document.name_form.submit();
					}
				}
			});
			return false;
		}
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
				<!-- 폼 -->
				<section>
					<h3> NICKNAME </h3>
					<form name="name_form" method="post">
						<div class="row gtr-uniform">
							
							<!-- userName -->
							<div class="col-12">
								<input type="text" name="userName" id="userName" placeholder="변경할 닉네임을 입력해주세요" autocomplete="off">
							</div>
							
							<%	String userID = null;
								if(session.getAttribute("userID") != null) 
									userID = (String) session.getAttribute("userID"); %>
									
							<input type="hidden" id="userID" name="userID" value="<%=userID%>"/>
							<!-- Break -->
							<div class="col-12">
								<button type="button" class="primary fit" onclick="nameForm_check()"> Confirm </button>
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