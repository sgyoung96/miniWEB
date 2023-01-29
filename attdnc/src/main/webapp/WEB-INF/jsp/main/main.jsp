<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리</title>
<link href="../css/main_css.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div id=wrapper>
		<header>
		<div class="title">
			<a href="#"><img class="img_logo" src="../image/title.png"></a>
		</div>
		<div class="loginmenu">
		<br>
			<a href="../login/loginManage.do" onclick="logout()"><input type="button" value="로그아웃"></a>
		</div>

		<nav class="mainmenu">
		<ul>
			<li><a href="../acpt/acptUser.do">가입승인</a></li>
			<li><a href="../main/mainPage.do">출퇴근기록</a></li>
			<li><a href="#">휴가관리</a>
				<ul>
					<li><a href="../vacation/vacationManage.do">휴가생성요청</a></li>
					<li><a href="../vacation/vacationApprovalManage.do">휴가신청승인</a></li>
				</ul>
			</li>
			<li><a href="../admin/adminPage.do">관리자페이지</a></li>
		</ul>
		</nav>
		</header>
		<div class="background">
			<div class="containter" align="center">
				<h2><span id="userNm"></span>님 안녕하세요.</h2>
			</div>
			
			
			<div style="padding-top: 30px;" align="center">
				<input type="button" style="width: 80px; height: 30px;" id="btnGt" value="출근">
				<input type="button" style="width: 80px; height: 30px;" id="btnOw" value="퇴근">
			</div>
		</div>
		<!-- <footer>
		<div>
			<p>Copyright ⓒ All rights reserved. Code Is Content
				by License Powered by GaYeong</p>
			<p></p>
		</div>
		</footer> -->
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		init();

		//출근
		$("#btnGt").click(function() {
			if (confirm("출근 하시겠습니까?")) {
				
				var params = {
						ATT_STAT_CD : '1'
				}
		        
				request("./insertWork.do", params, function callback(response, status) {
					console.log("response: " + response);
					
					if (response.RES_CD == "000") {
						alert(response.RES_MSG);
					} else {
						alert(response.RES_MSG);
					}
				}, function error(request, status) {
					alert(status);
				});
		    }
		});
		
		//퇴근
		$("#btnOw").click(function() {
			if (confirm("퇴근 하시겠습니까?")) {
				var params = {
						ATT_STAT_CD : '2'
				}
		        
				request("./insertWork.do", params, function callback(response, status) {
					console.log("response: " + response);
					
					if (response.RES_CD == "000") {
						alert(response.RES_MSG);
					} else {
						alert(response.RES_MSG);
					}
				}, function error(request, status) {
					alert(status);
				});
		    }
		});
		
	});
	
	function init() {
		
		var params = {};
		
		// 세션 정보 뿌리기
		request("./initUserInfo.do", params, function callback(response, status) {
			if("000" != response.RES_CD) {
				alert(response.RES_MSG + "(" + response.RES_CD + ")");
			} else {
				$("#userNm").text(response.USER_NM);
			}
		}, function error(request, status) {
			alert(status);
		});
	}
	
	// 로그아웃
	function logout() {

		var params = {};
		
		request("./logout.do", params, function callback(response, status) {
			alert(response.RES_MSG); 
			location.href = "../login/loginManage.do"; // 로그인 페이지로 이동
		}, function error(request, status) {
			alert(status);
		});
	}
	
	// 통신
	function request(url, params, callback, error) {
		if(params == null) {
			params = {};
		}
		console.log("request:"+JSON.stringify(params));
		$.ajax({
			url:url,
			data:JSON.stringify(params),
			dataType:"json",
			contentType : "application/json; charset=utf-8",
			method:"post", 
			success:function(response, status){
				console.log("RESPONSE : " + JSON.stringify(response));
				callback(response, status);
			},
			error:function(request, status) {
				console.log("error:"+request);
				error(request, status);
			}
		});
	}

	</script>
</body>
</html>
