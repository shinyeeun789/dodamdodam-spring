<%@page import="com.inhatc.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">		<!-- 모바일 반응형을 만들 때 필요 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>	<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>		<!-- Chart.js -->
<link rel="stylesheet" href="../resources/css/tui-grid.css" type="text/css">
<title> 도담도담 </title>

<link rel="stylesheet" href="../resources/css/main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<script>
	<c:if test="${empty userVO}">
		alert('로그인 후 사용할 수 있습니다.');
		location.href="/user/login.do";
	</c:if>
</script>
<body class="is-preload">
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				url 	 : "/allergen/getAllergen.do",
				type	 : "POST",
				dataType : "JSON",
				data	 : {"userID":"${userVO.userID}"},
				success  : function(result) {					
					$.each(result, function(index, value) {
						$("#allergenInfo").append($("<article>" + 
								"<span class='icon' style='text-align:center;'>" +
									"<img src='../../resources/picture/유발식재료_" + value + ".png' alt='' style='width:50%; height:50%; vertical-align:middle'></span>" +
								"<div class='content'>" +
									"<h3 style='font-family:Gothic A1,serif'>" + value + "</h3>" +  
								"</div> </article>"))
					})
				}, error : function() {
					alert('데이터를 불러오지 못했습니다. 잠시 후 다시 시도해주세요.');
				}
			})
			
			$.ajax({
				url 	 : "/allergen/eatableFood.do",
				type	 : "POST",
				dataType : "JSON",
				data	 : {"allergy_type":"${userVO.allergy_type}"},
				success  : function(result) {
					console.log(result);
					$.each(result, function(index, value) {
						$("#eatableFoodInfo").append($("<p style='font-family: Gothic A1,serif'>[" + value.manufacturer + "] " + value.foodName + "</p>"))
					})
				}, error : function() {
					alert('데이터를 불러오지 못했습니다. 잠시 후 다시 시도해주세요.');
				}
			})
		});
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
				<section>
					<header class="major">
						<h3 style="font-family:'Gothic A1',serif"> 내가 가진 알레르겐 </h3>
					</header>
					<div class="features" id="allergenInfo"></div>
				</section>
				
				<hr class="major" />
				
				<section>
					<header class="major">
						<h3 style="font-family:'Gothic A1',serif"> 이 음식들은 안전해요! </h3>
					</header>
					<div class="col-12" id="eatableFoodInfo"></div>
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