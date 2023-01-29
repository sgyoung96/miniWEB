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
			<li><a href="#">가입승인</a></li>
			<li><a href="#">권한관리</a>
				<ul>
					<li><a href="#">권한상승신청</a></li>
					<li><a href="#">권한부여승인</a></li>
				</ul>
			</li>
			<li><a href="#">출퇴근기록</a></li>
			<li><a href="#">휴가관리</a>
				<ul>
					<li><a href="#">휴가생성요청</a></li>
					<li><a href="#">휴가신청승인</a></li>
				</ul>
			</li>
			<li><a href="#">내정보수정</a></li>
		</ul>
		</nav>
		</header>
		<div class="background">
			<div class="containter" align="center">
				<h2><span id="userNm"></span>님 안녕하세요.</h2>
			</div>
		</div>
		<footer>
		<div>
			<p>Copyright ⓒ All rights reserved. Code Is Content
				by License Powered by GaYeong</p>
			<p></p>
		</div>
		</footer>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		init();
		
		function init() {
			
			var params = {};
			
			// 세션 정보 뿌리기
			request("./initUserInfo.do", params, function callback(response, status) {
				console.log("response: " + response);
				
				if (response.RES_CD != "444") {
					$('#userNm').text(response.USER_NM);
				} else {
					alert("데이터를 로드하는 데 실패했습니다.");
					logout();
				}
    		}, function error(request, status) {
    			alert(status);
    		});
		}
		
		// 로그아웃
		function logout() {

			var params = {};
			
			request("./logout.do", params, function callback(response, status) {
				alert(response.RES_MSG); // ?? 안보임
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
	});

	</script>
</body>
</html>
