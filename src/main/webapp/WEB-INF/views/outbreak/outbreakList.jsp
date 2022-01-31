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
<script src="../resources/js/tui-grid.js"></script>
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
		<c:if test="${msg == -1}">
			alert('문제가 발생했습니다. 잠시 후 다시 시도해주세요');
		</c:if>
		<c:if test="${msg == 0}">
			alert('증상 정보가 추가되었습니다.');
		</c:if>
		
		$(document).ready(function() {
			grid = new tui.Grid({
		        el: document.getElementById('grid'),
		        scrollX: false,
		        scrollY: false,
		        columns: [
		        	{
		            	header: 'Date',
		            	name: 'outbreakDate',
		            	sortingType: 'desc',
			            sortable: true
		          	},
		          	{
		            	header: 'outbreakTime',
		            	name: 'outbreakTime',
		            	sortingType: 'desc',
		            	sortable: true
		          	},
		          	{
		            	header: 'medicineTime',
		            	name: 'medicineTime',
		            	sortingType: 'desc',
			            sortable: true
		          	},
		          	{
		            	header: 'type',
		            	name: 'type'
		          	},
		          	{
		            	header: 'bodyPart',
		            	name: 'bodyPart'
		          	},
		          	{
		            	header: 'medicine',
		            	name: 'medicine'
		          	},
		          	{
		            	header: 'medicineInfo',
		            	name: 'medicineInfo'
		          	}
		        ]
		      });
			
			$("#outbreakMonth").change(function() {
				$.ajax({
					url		 : "/outbreak/getOutbreakListWithMonth.do",
					method 	 : "GET",
					dataType : "JSON",
					data	 : {"userID":"${userVO.userID}", "outbreakMonth":$("#outbreakMonth").val()},
					success  : function(result) {
						grid.resetData(result);
					}
				});
			});
		})
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
					<h3> OUTBREAK LIST </h3>
					<form name="dietPlus_form" method="post">
						<div class="row gtr-uniform">
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 날짜를 선택해주세요. </h5>
								<input type="month" name="outbreakMonth" id="outbreakMonth">
							</div>
							<div class="col-12">
								<div id="grid"></div>
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