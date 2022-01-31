<%@page import="com.inhatc.domain.FoodVO"%>
<%@page import="com.inhatc.domain.UserVO"%>
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
				
				<!-- Food Detail -->
				<section id="banner">
					<div class="content">
						<header>
							<h2 style="font-family:'Gothic A1', sans-serif;"> [ ${foodInfo.manufacturer} ] ${foodInfo.foodName} </h2>
						</header>
						<br>
						<div class="col-12">
							<h3 style="font-family:'Gothic A1', sans-serif;"> 성분 정보 </h3>
							<c:if test="${empty userVO.allergy_type}">
								<h4 style="font-family:'Gothic A1', sans-serif; color: gray"> ${foodInfo.ingredient} </h4>
							</c:if>
							<c:if test="${not empty userVO.allergy_type}">
								<h4 style="font-family: 'Gothic A1', sans-serif; color: gray">
								<%	UserVO userVO = (UserVO) session.getAttribute("userVO");
									FoodVO foodVO = (FoodVO) request.getAttribute("foodInfo");
									String[] userAllergy = userVO.getAllergy_type().split(",");
									String[] foodAllergy = foodVO.getIngredient().split(",");
									for (int i=0; i<foodAllergy.length; i++) {
										int cnt = 0;
										for (int j=0; j<userAllergy.length; j++) {
											if (foodAllergy[i].equals(userAllergy[j])) { %>
												<strong style="color:red"><%=foodAllergy[i]%></strong>,
										<%  } else { 
												cnt++;
											}
										}
										if (cnt == userAllergy.length) { 
											if (i == (foodAllergy.length-1)) { %>
												<%=foodAllergy[i]%>
										<%	} else {  %>
												<%=foodAllergy[i]%>,
										<%	}
										}
									} %>
								</h4>
							</c:if>
						</div>
						<br><br>
						<div class="col-12">
							<h3 style="font-family:'Gothic A1', sans-serif;"> 교차오염 정보 </h3>
							<h4 style="font-family:'Gothic A1', sans-serif; color: gray"> [ ${foodInfo.crossContamination} ] 를 원료로 한 제품과 같은 제조시설에서 제조하였습니다. </h4>
						</div>
					</div>
					<span class="image object">
						<c:if test="${fn:contains(foodInfo.image, 'http')}">
							<a href="/food/foodDetail.do?foodID=${foodInfo.foodID}" class="image"><img src="${foodInfo.image}" alt="" /></a>
						</c:if>
						<c:if test="${!fn:contains(foodInfo.image, 'http')}">
							<a href="/food/foodDetail.do?foodID=${foodInfo.foodID}" class="image"><img src="../../resources/picture/${foodInfo.image}" alt="" /></a>
						</c:if>
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