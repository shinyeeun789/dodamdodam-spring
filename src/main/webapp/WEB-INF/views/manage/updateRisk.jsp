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
		alert('식품의 위험도가 변경되었습니다.');
	</c:if>
	<c:if test="${msg == 0}">
		alert('오류가 발생했습니다. 잠시후 다시 시도해주세요.');
	</c:if>
</script>
<script type="text/javascript">
	function setFoodList(datas) {
		$("#foodList option").remove();
		if (datas.length != 0) {
			for (idx in datas) {
				if (datas[idx].manufacturer != "없음") {
					var str = "<option value='"+datas[idx].foodID+"'> ["+datas[idx].manufacturer+ "] " + datas[idx].foodName +"</option>";
					$("#foodList").append(str);
				} else {
					var str = "<option value='"+datas[idx].foodID+"'>" + datas[idx].foodName + "</option>";
					$("#foodList").append(str);
				}
			}
		} 
	}

	$(document).ready(function() {
		$("#getFoodInfo").click(function() {
			var foodName = $("#foodName").val();
			$.ajax({
				url : "/manage/getFoodInfo.do",
				type: "post",
				data: {"foodName" : foodName},
				success: function(datas) {
					console.log('success');
					setFoodList(datas);
				},
				error  : function(request, status, error) {
					alert("데이터를 불러오지 못했습니다");
				}
			});
		});
	});
</script>
</head>
<body class="is-preload">
	<script type="text/javascript">
		// 폼 유효성 검사
		function riskForm_check() {	
			var foodList = document.getElementById("foodList");
			var risk = document.getElementById("risk");
			
			// 입력되지 않은 값이 있는지 확인
			if (!foodList.value) {
				alert('음식명을 선택해주세요 :)');
				foodList.focus();
				return false;
			} else if (!risk.value) {
				alert('위험도를 선택해주세요 :)')
				risk.focus();
				return false;
			}
			
			document.risk_form.submit();
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
					<h3> UPDATE RISK! </h3>
					<form name="risk_form" method="post">
						<div class="row gtr-uniform">
							<!-- 음식명 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 음식명 </h5>
							</div>
							<div class="col-8 col-12-small">
								<input type="text" name="foodName" id="foodName" placeholder="음식명을 입력해주세요" autocomplete="off">
							</div>
							<div class="col-4 col-12-small">
								<button type="button" style="font-family: 'Gothic A1', sans-serif;" id="getFoodInfo" value="N" 
										class="fit"> 음식 불러오기 </button>
							</div>
							<!-- foodList -->
							<div class="col-12">
								<select name="foodID" id="foodList" style="height:100px" size="5"></select>
							</div>
							
							<!-- 식품의 위험도 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 위험도 </h5>
								<select name="risk" id="risk">
									<option value=""> - RISK - </option>
									<option value="0"> 0 </option>
									<option value="1"> 1 </option>
									<option value="2"> 2 </option>
									<option value="3"> 3 </option>	
								</select>
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<button type="button" class="primary fit" onclick="riskForm_check()"> UPDATE RISK </button>
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