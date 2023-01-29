<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리 > 내정보수정</title>
<link href="../css/adminPage.css" rel="stylesheet" type="text/css">
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
					<li><a href="../vaction/vactionManage.do">휴가생성요청</a></li>
					<li><a href="../vaction/vactionApprovalManage.do">휴가신청승인</a></li>
				</ul>
			</li>
			<li><a href="../admin/adminPage.do">관리자페이지</a></li>
		</ul>
		</nav>
		</header>
		<div class="background">
			<div class="containter" align="center">
				<div class="tb_user_list">
					<table id="tb_user_list" border="1">
						<tr>
							<th width="14%">
								이름
							</th>
							<th width="14%">
								아이디
							</th>
							<th width="14%">
								부서
							</th>
							<th width="14%">
								직급
							</th>
							<th width="34%">
								회사명
							</th>
							<th width="10%">
								부서장
							</th>
						</tr>
					</table>
				</div>
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
		
	});
	
	init();
	
	function init() {
		var params = {};
		
		// 권한별로 가입 승인 대기 상태인 목록 뿌리기
		request("./getAllUserByCorp.do", params, function callback(response, status) {
			if (response.RES_CD == "000") {
				drawUserList(response.userList)
			} else if (response.RES_CD == "001") { // 접근권한
				alert(response.RES_MSG + "(" + response.RES_CD + ")");
				location.href = "../main/mainPage.do";
			} else if (response.RES_CD == "002") { // 승인가능인원없음
				alert(response.RES_MSG + "(" + response.RES_CD + ")");
				location.href = "../main/mainPage.do";
			} else {
				alert(response.RES_MSG + "(" + response.RES_CD + ")");
			}
		}, function error(request, status) {
			alert(status);
		});
	}
	
	// 테이블 목록 그리기
	function drawUserList(userList) {
		var html = '';
		
		for (i = 0; i < userList.length; i++) {
			html += '<tr align="center">';
			html += '	<td>';
			html += '		<span id="name">' + userList[i].USER_NM + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<span id="id">' + userList[i].USER_ID + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<span id="dept">' + userList[i].DEPT_NM + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<span id="rank">' + userList[i].USER_RK + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<span id="corp">' + userList[i].CORP_NM + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<input type="button" value="권한상승" onclick="btnAcpt('+ userList[i].USER_NO +');">';
			html += '	</td>';

			html += '</tr>';
		}
		$('#tb_user_list').append(html); 
	}
	
	// 부서장 권한상승 클릭
	function btnAcpt(userNo) {
		var params = {
				USER_NO : userNo,
		};
	
		request("./updateUserAuthType.do", params, function callback(response, status) {
			if (response.RES_CD == "000") {
				alert(response.RES_MSG);
				location.reload();
			} else {
				alert(response.RES_MSG + "(" + response.RES_CD + ")");
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
