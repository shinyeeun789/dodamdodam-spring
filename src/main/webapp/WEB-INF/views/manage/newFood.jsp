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
<script>
	<c:if test="${msg == 1}">
		alert('새로운 음식이 추가되었습니다');
	</c:if>
	<c:if test="${msg == 0}">
		alert('오류가 발생했습니다. 잠시후 다시 시도해주세요.');
	</c:if>
	<c:if test="${empty userVO}">
		alert('로그인 후 사용할 수 있습니다.');
		location.href="/user/login.do";
	</c:if>
</script>
</head>
<body class="is-preload">
	<script type="text/javascript">
		// 폼 유효성 검사
		function foodForm_check() {
			
			var manufacturer = document.getElementById("manufacturer");
			var foodName = document.getElementById("foodName");
			var risk = document.getElementById("risk");
			
			// 입력되지 않은 값이 있는지 확인
			if (!manufacturer.value) {
				alert('제조사명을 입력해주세요 :)');
				manufacturer.focus();
				return false;
			} else if (!foodName.value) {
				alert('음식명을 입력해주세요 :)');
				foodName.focus();
				return false;
			} else if (!risk.value) {
				alert('위험도를 입력해주세요 :)')
				risk.focus();
				return false;
			}
			
			document.food_form.submit();
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
				<!-- 새 음식 추가 폼 -->
				<section>
					<h3> NEW FOOD! </h3>
					<form name="food_form" method="post">
						<div class="row gtr-uniform">
							
							<!-- 제조사명 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 제조사명* </h5>
								<input type="text" name="manufacturer" id="manufacturer" placeholder="제조사명을 입력해주세요">
							</div>
							
							<!-- 음식명 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 음식명* </h5>
								<input type="text" name="foodName" id="foodName" placeholder="음식명을 입력해주세요" autocomplete="off">
							</div>
							
							<!-- 식품의 성분 정보 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 성분 정보 </h5>
							</div>
							<% String[] types = {"난류","우유","메밀","땅콩","대두","밀","고등어","게","새우",
										"돼지고기","복숭아","토마토","아황산염","호두","닭고기","쇠고기","오징어","조개류"};
								
								for (int i=0; i<types.length; i++) { %>
									<div class="col-4 col-12-small">
										<input type="checkbox" id="<%=i%>" value="<%=types[i]%>" name="ingredient">
										<label for="<%=i%>"> <%=types[i]%> </label>
									</div>
							<% } %>
							
							<!-- 식품의 교차오염 정보 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 교차오염 정보 </h5>
							</div>
							<% for (int i=0; i<types.length; i++) { %>
									<div class="col-4 col-12-small">
										<input type="checkbox" id="<%=types[i]%>" value="<%=types[i]%>" name="crossContamination">
										<label for="<%=types[i]%>"> <%=types[i]%> </label>
									</div>
							<% } %>
							
							<!-- 카테고리 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 식품의 카테고리 </h5>
								<select name="category" id="category">
									<option value=""> - CATEGORY - </option>
									<% String[] categories = {"피자","치킨","분식","패스트푸드","빵","간식","가공식품","기타"};
										for (int i=0; i<categories.length; i++) { %>
											<option value="<%=categories[i]%>"> <%=categories[i]%> </option>
									<% } %>									
								</select>
							</div>
							
							
							<!-- 식품의 위험도 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 위험도* </h5>
								<select name="risk" id="risk">
									<option value=""> - RISK - </option>
									<option value="0"> 0 </option>
									<option value="1"> 1 </option>
									<option value="2"> 2 </option>
									<option value="3"> 3 </option>	
								</select>
							</div>
							
							<!-- 이미지 파일명 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 이미지 파일명 </h5>
								<input type="text" name="image" id="image" placeholder="이미지 파일명을 입력해주세요" autocomplete="off">
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<button type="button" class="primary fit" onclick="foodForm_check()"> ADD FOOD </button>
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