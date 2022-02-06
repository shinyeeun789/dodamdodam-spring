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
		// 중복 확인 누른 후 아이디를 변경하는 경우, 중복 확인 버튼 활성화
		$("#userID").on("propertychange change keyup paste input", function() {
			$("#idCheck").attr("value","N");
			$("#idCheck").attr("disabled", false);
		});
		
		// 비밀번호 유효성 검사
		$("#userPassword").on("propertychange change keyup paste input", function() {
			// 비밀번호 정규식 (영문자+숫자+특수문자 조합 8자리~25자리)
			var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
			
			if (!pwCheck.test(userPassword.value)) {
				$("#pwInfo").text("비밀번호는 영문자, 숫자, 특수문자 조합으로 8~25자리로 사용할 수 있습니다 :)");
			} else {
				$("#pwInfo").text("");
			} 
			
			// 비밀번호를 변경했을 때 비밀번호 확인의 값과 같은지 확인
			if ($("#userPassword").val() != $("#userPasswordCheck").val()) {
				$("#pwChkInfo").text("비밀번호와 비밀번호 확인의 값이 다릅니다.");
			} else {
				$("#pwChkInfo").text("");
			}
		});
	
		// 비밀번호와 비밀번호 확인의 값이 같은지 확인
		$("#userPasswordCheck").on("propertychange change keyup paste input", function() {
			if ($("#userPassword").val() != $("#userPasswordCheck").val()) {
				$("#pwChkInfo").text("비밀번호와 비밀번호 확인의 값이 다릅니다.");
			} else {
				$("#pwChkInfo").text("");
			}
		});
	});
</script>
</head>
<body class="is-preload">
	<script type="text/javascript">
		// 회원가입 폼 유효성 검사
		function joinForm_check() {
			
			var userID = document.getElementById("userID");
			var userPassword = document.getElementById("userPassword");
			var userPasswordCheck = document.getElementById("userPasswordCheck");
			var userName = document.getElementById("userName");
			
			var idCheck = document.getElementById("idCheck");
			var pwInfo = document.getElementById("pwInfo");
			var pwChkInfo = document.getElementById("pwChkInfo");
			
			// 입력되지 않은 값이 있는지 확인
			if (!userID.value) {
				alert('아이디를 입력해주세요 :)');
				userID.focus();
				return false;
			} else if (!userPassword.value) {
				alert('비밀번호를 입력해주세요 :)');
				userPassword.focus();
				return false;
			} else if (!userPasswordCheck.value) {
				alert('비밀번호 확인을 입력해주세요 :)')
				userPasswordCheck.focus();
				return false;
			} else if (!userName.value) {
				alert('닉네임을 입력해주세요 :)');
				userName.focus();
				return false;
			}
			
			// 아이디 중복 확인했는지 확인
			if (idCheck.value == "N") {
				alert('아이디 중복을 확인해주세요 :)');
				return false;
			}
			
			// 비밀번호 확인
			if (pwInfo.innerText != "" || pwChkInfo.innerText != "") {
				alert('비밀번호를 확인해주세요 :)');
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
						document.join_form.submit();
					}
				}
			});
			return false;
		}
		
		// 아이디 중복체크
		function id_check() {
			// 1) 아이디가 입력되었는지 확인
			if (!userID.value) {
				alert('아이디를 입력해주세요 :)');
				userID.focus();
				return false;
			}
			
			// 2) 아이디 정규식 (영문자+숫자)
			var IdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{5,50}$/;
			
			if (!IdCheck.test(userID.value)) {
				alert("아이디는 영문자, 숫자 조합으로 50자 이내만 사용할 수 있습니다 :)");
				userID.focus();
				return false;
			}

			// 3) AJAX를 사용하여 아이디 중복 확인
			$.ajax({
				url : "/user/idCheck.do",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data) {
					if (data == 1) {
						alert("중복된 아이디입니다 :(");
					} else if (data == 0) {
						$("#idCheck").attr("value","Y");
						document.getElementById("idCheck").disabled = true;
						alert("사용 가능한 아이디입니다.");
					}
				}
			});
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
				<!-- 회원가입 폼 -->
				<section>
					<h3> JOIN </h3>
					<form name="join_form" method="post">
						<div class="row gtr-uniform">
							
							<!-- ID -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 아이디* </h5>
							</div>
							<div class="col-8 col-12-small">
								<input type="text" name="userID" id="userID" placeholder="아이디를 입력해주세요" autocomplete="off">
							</div>
							<div class="col-4 col-12-small">
								<button type="button" style="font-family: 'Gothic A1', sans-serif;" id="idCheck" value="N" 
										class="primary fit" onclick="id_check()"> 중복 확인 </button>
							</div>
							
							<!-- Password -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 비밀번호* </h5>
								<input type="password" name="userPassword" id="userPassword" placeholder="비밀번호를 입력해주세요 (영문자, 숫자, 특수문자 조합으로 8글자 이상)">
								<h6 id="pwInfo" style="font-family: 'Gothic A1', sans-serif; color: red"></h6>
							</div>
							
							<!-- Password_Check -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 비밀번호 확인* </h5>
								<input type="password" name="userPasswordCheck" id="userPasswordCheck" placeholder="비밀번호 확인을 위해 입력해주세요">
								<h6 id="pwChkInfo" style="font-family: 'Gothic A1', sans-serif; color: red"></h6>
							</div>
							
							<!-- NickName -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 닉네임* </h5>
								<input type="text" name="userName" id="userName" placeholder="닉네임을 입력해주세요" autocomplete="off">
							</div>
							
							<!-- 알러지 타입 선택 -->
							<div class="col-12">
								<h5 style="font-family: 'Gothic A1', sans-serif;"> 가지고 있는 알러지 타입을 알고 있나요? </h5>
							</div>
							<% String[] types = {"난류","우유","메밀","땅콩","대두","밀","고등어","게","새우",
										"돼지고기","복숭아","토마토","아황산염","호두","닭고기","쇠고기","오징어","조개류(굴, 전복, 홍합 포함)"};
								
								for (int i=0; i<types.length; i++) { %>
									<div class="col-4 col-12-small">
<<<<<<< HEAD
										<input type="checkbox" id="<%=i%>" value="<%=types[i]%>" name="allergy_type">
=======
										<input type="checkbox" id="<%=i%>" value="<%=types[i]%>" name="allergyType">
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
										<label for="<%=i%>"> <%=types[i]%> </label>
									</div>
							<% } %>
							
							<!-- Break -->
							<div class="col-12">
								<button type="button" class="primary fit" onclick="joinForm_check()"> JOIN </button>
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