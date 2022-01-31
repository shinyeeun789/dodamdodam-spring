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
		
	});
</script>
</head>
<body class="is-preload">
	<script type="text/javascript">
		// 폼 유효성 검사
		function outbreakPlusForm_chk() {
			var medicineDate = document.getElementById("medicineDate");
			var medicineTime = document.getElementById("medicineTime");
			var medicine = document.getElementById("medicine");
			
			// 입력되지 않은 값이 있는지 확인
			if (!medicineDate.value) {
				alert('약을 복용한 날짜를 입력해주세요 :)');
				medicineDate.focus();
				return false;
			} else if (!medicineTime.value) {
				alert('약을 복용한 시간을 입력해주세요 :)');
				medicineTime.focus();
				return false;
			} else if (!medicine.value) {
				alert('복용한 약의 정보를 입력해주세요 :)');
				medicine.focus();
				return false;
			}
			
			document.outbreakPlus_form.submit();
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
					<h3> ADD MEDICINE INFO </h3>
					<form name="outbreakPlus_form" method="post">
						<div class="row gtr-uniform">
							<!-- 날짜 선택 -->
							<div class="col-6 col-12-small">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 날짜* </h5>
								<input type="date" name="medicineDate" id="medicineDate" class="fit">
							</div>
							<!-- 시간 선택 -->
							<div class="col-6 col-12-small">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 시간* </h5>
								<input type="time" name="medicineTime" id="medicineTime" class="fit" min="00:00:00" max="23:59:59">
							</div>
							
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 약 복용 정보* </h5>
								<input type="text" name="medicine" id="medicine" placeholder="어떤 약을 복용했나요?" autocomplete="off">
							</div>
							
							<input type="hidden" name="userID" id="userID" value="${userVO.userID}">
							<!-- Break -->
							<div class="col-12">
								<button type="button" class="primary fit" onclick="outbreakPlusForm_chk()"> ADD OUTBREAK </button>
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