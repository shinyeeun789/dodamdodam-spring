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
<title> 도담도담 </title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/easyPieChart.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://rendro.github.io/easy-pie-chart/javascripts/jquery.easy-pie-chart.js"></script>
<script type="text/javascript" src="../resources/js/easypiechart.js"></script>
</head>
<script>
	<c:if test="${empty userVO}">
		alert('로그인 후 사용할 수 있습니다.');
		location.href="/user/login.do";
	</c:if>
</script>
<body class="is-preload">
	<script>
		jQuery(document).ready(function($) {
			$('.chart1').easyPieChart({
                easing		: 'easeOutBounce',
                barColor 	: '#F78D8D',
                lineWidth	: 30,
                lineCap		: 'round',
                size		: 300,
                animate		: 1000,
                onStart		: $.noop,
                onStop		: $.noop 			
	        });
			$('.chart2').easyPieChart({
                easing: 'easeOutBounce',
                barColor 	: '#FFD966',
                lineWidth	: 30,
                lineCap		: 'round',
                size		: 300,
                animate		: 1000,
                onStart		: $.noop,
                onStop		: $.noop
            });
            $('.chart3').easyPieChart({
                easing: 'easeOutBounce',
                barColor	: '#A9D18E',
                lineWidth	: 30,
                lineCap		: 'round',
                size		: 300,
                animate		: 1000,
                onStart		: $.noop,
                onStop		: $.noop
            });
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
						<h3 style="font-family:'Gothic A1',serif"> 예상 유발 식품 </h3>
					</header>
					<div class="col-12" id="allergenInfo" style="text-align:center">
						<c:if test="${empty allergenList}">
							<p style='font-family:Gothic A1,serif'> 아직 원인을 분석할 수 없어요. 더 많은 양의 데이터가 필요해요 :) </p>
						</c:if>
						<c:forEach var="allergen" items="${allergenList}" varStatus="status">
							<c:if test="${(not empty allergen) and (status.count <= 3)}">
								<div class='chart chart${status.count}' data-percent='${allergen.percent}'>
									<span class='percent'>
										<img src="../../resources/picture/유발식재료_${allergen.ingredient}.png" alt="">
									</span>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</section>
				
				<section>
					<header class="major">
						<h3 style="font-family:'Gothic A1',serif"> 그 외 예상 유발 식품 </h3>
					</header>
					<div class="col-12">
						<c:if test="${empty allergenList}">
							<p style='font-family:Gothic A1,serif; text-align:center'> 식단 정보와 증상 정보를 더 추가해주세요 :) </p>
						</c:if>
						<c:forEach var="allergen" items="${allergenList}" varStatus="status">
							<c:if test="${(not empty allergen) and (status.count > 3)}">
								<h5 style='font-family:Gothic A1,serif'> ${allergen.ingredient} (${allergen.percent}%) </h5>
							</c:if>
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