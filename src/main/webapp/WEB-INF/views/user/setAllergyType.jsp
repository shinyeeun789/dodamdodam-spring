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
	$(document).ready(function() {
	<%	String[] allergyTypes = (String[])request.getAttribute("allergyTypes");
		if (allergyTypes != null) { 	
			for (int i=0; i<allergyTypes.length; i++) { %>
				$("input:checkbox[id='<%=allergyTypes[i]%>']").prop("checked", true);	
		<%	}
		} %>
	});
</script>
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
				<!-- 회원가입 폼 -->
				<section>
					<h3> Allergy Type! </h3>
					<form method="post">
						<div class="row gtr-uniform">
							<!-- 알러지 타입 선택 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 가지고 있는 알러지 타입을 알고 있나요? </h5>
							</div>
							<%  String[] types = {"난류","우유","메밀","땅콩","대두","밀","고등어","게","새우",
										"돼지고기","복숭아","토마토","아황산염","호두","닭고기","쇠고기","오징어","조개류(굴, 전복, 홍합 포함)"};
								
								for (int i=0; i<types.length; i++) { %>
									<div class="col-4 col-12-small">
										<input type="checkbox" id="<%=types[i]%>" value="<%=types[i]%>" name="allergyType">
										<label for="<%=types[i]%>"> <%=types[i]%> </label>
									</div>
							<%	}
								
								String userID = null;
								if(session.getAttribute("userID") != null) {
									userID = (String) session.getAttribute("userID");
								}
								%>
							<input type="hidden" id="userID" name="userID" value="<%=userID%>"/>
							<!-- Break -->
							<div class="col-12">
								<input type="submit" value="Confirm" class="primary fit">
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