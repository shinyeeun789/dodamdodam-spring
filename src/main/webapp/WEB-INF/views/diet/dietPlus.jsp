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
<script type="text/javascript">	
	<c:if test="${empty userVO}">
		alert('로그인 후 사용할 수 있습니다.');
		location.href="/user/login.do";
	</c:if>

	$(document).ready(function() {
		$(document).keypress(function(e) {
			if (e.keyCode == 13) {
				e.preventDefault();
				getFoodInfo();
			}
		});
		
		$("#addFood").click(function() {		// 음식 추가하기
			var selectItem = $("select[name=searchFoodList]").val();
			if (selectItem != null) {
				var option = "<option value='" + selectItem + "'>" + selectItem + "</option>";
				$("select[name=selectFoodList]").append(option);
			}
		});
		$("#removeFood").click(function() {
			$("select[name=selectFoodList] option:selected").remove();
		});
	});

	// 음식 불러오기 버튼 함수
	function getFoodInfo() {
		var foodName = $("#foodName").val();
		$.ajax({
			url : "/manage/getFoodInfo.do",
			type: "post",
			data: {"foodName" : foodName},
			success: function(datas) {
				$("#searchFoodList option").remove();
				if (datas.length != 0) {			// 음식 DB에 있는 음식일 경우
					for (idx in datas) {
						if (datas[idx].manufacturer != "알수없음") {
							var str = "<option> ["+datas[idx].manufacturer+ "] " + datas[idx].foodName +"</option>";
							$("#searchFoodList").append(str);
						} else {
							var str = "<option>" + datas[idx].foodName + "</option>";
							$("#searchFoodList").append(str);
						}
					}
				} else {
					var foodName = document.getElementById('foodName');
					var str = "<option value='"+ foodName.value +"'>" + foodName.value + "</option>";
					$("#searchFoodList").append(str);
				}
			},
			error  : function(request, status, error) {
				alert("데이터를 불러오지 못했습니다");
			}
		});
	}
</script>
</head>
<body class="is-preload">
	<script type="text/javascript">
		// 폼 유효성 검사
		function dietPlusForm_chk() {
			var userID = document.getElementById("userID");
			var dietDate = document.getElementById("dietDate");
			var dietTime = document.getElementById("dietTime");
			var selectFoods = document.getElementById("selectFoodList");
			
			// 입력되지 않은 값이 있는지 확인
			if (!dietDate.value) {
				alert('식단 날짜를 입력해주세요 :)');
				dietDate.focus();
				return false;
			} else if (!dietTime.value) {
				alert('식단을 먹은 시간을 입력해주세요 :)');
				dietTime.focus();
				return false;
			} else if (!selectFoods.value) {
				alert('음식을 선택해주세요 :)');
				selectFoods.focus();
				return false;
			}
			
			document.dietPlus_form.submit();
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
				<!-- 리스크 변경 폼 -->
				<section>
					<h3> PLUS DIET </h3>
					<form name="dietPlus_form" method="post">
						<div class="row gtr-uniform">
							<!-- 식단 날짜 선택 -->
							<div class="col-6 col-12-small">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 날짜* </h5>
								<input type="date" name="dietDate" id="dietDate" class="fit">
							</div>
							<!-- 식단 시간 선택 -->
							<div class="col-6 col-12-small">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 시간* </h5>
								<input type="time" name="dietTime" id="dietTime" class="fit" min="00:00:00" max="23:59:59">
							</div>
							
							<!-- 식단 유형 선택 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 유형* </h5>
								<select name="brelupper" id="brelupper">
									<option value="아침"> 아침 </option>
									<option value="점심"> 점심 </option>
									<option value="저녁"> 저녁 </option>
									<option value="간식"> 간식 </option>
								</select>
							</div>
							
							<!-- 음식명 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 음식명* </h5>
								<input type="text" name="foodName" id="foodName" placeholder="음식명 입력 후 엔터키를 눌러주세요" autocomplete="off">
							</div>
							
							<!-- 검색된 음식 리스트 -->
							<div class="col-12">
								<select name="searchFoodList" id="searchFoodList" style="height:100px" size="5"></select>
							</div>
							
							<!-- 추가하기&제거하기 버튼 -->
							<div class="col-6 col-12-small">
								<button type="button" style="font-family: 'Gothic A1', sans-serif;" id="addFood"
										class="fit"> 추가하기 </button>
							</div>
							<div class="col-6 col-12-small">
								<button type="button" style="font-family: 'Gothic A1', sans-serif;" id="removeFood" 
										class="fit"> 제거하기 </button>
							</div>
							
							<!-- 사용자가 선택한 음식 리스트 -->
							<div class="col-12">
								<select name="selectFoodList" id="selectFoodList" style="height:100px" size="5" multiple></select>
							</div>
							
							<input type="hidden" name="userID" id="userID" value="${userVO.userID}">
							<!-- Break -->
							<div class="col-12">
								<button type="button" class="primary fit" onclick="dietPlusForm_chk()"> ADD DIET </button>
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