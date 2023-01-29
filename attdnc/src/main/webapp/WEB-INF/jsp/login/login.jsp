<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>	
	<!-- <link rel="stylesheet" type="text/css" href="/login.css"></link>  -->
</head>
<style>
	.header {
		position: absolute;
		top: 1%;
		right: 1%;
		font-size: 12px;
		cursor: pointer;
	}
	.seperator::after {
		content: " | ";
	}
	.background {
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: #ffffff;
	}
	.contents {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	input {
		background: #ffffff;
		border: none;
		border-bottom: solid 1px #000000;
	}
	.btn_login {
		padding: 10px;
		cursor: pointer;
		background-color: #000000;
		color: #ffffff;
	}
	.btn_register {
		cursor: pointer;
		font-size: 12px;
	}
</style>
<body>

	<div class="background">
		<div class="header">
			<a class="seperator" onclick="reg_user()">임직원가입</a>
			<a onclick="reg_corp()">기업회원가입</a>
		</div>
	</div>
	<div class="contents" align="center">
		<form name="frm_login">
			<table>
				<tr>
					<td colspan="2" align="center">
						<img src="../image/title.png" alt="logo" width="220">
					</td>
				</tr>
				<tr>
					<td><input type="text" id="ipt_id" name="id" placeholder="아이디를 입력하세요." maxlength="20" value=""></td>
					<td class="btn_login" rowspan="2" onclick="doLogin()">로그인</td>
				</tr>
				<tr>
					<td><input type="password" id="ipt_pw" name="pw" placeholder="패스워드를 입력하세요." maxlength="20" value=""></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<script>
	
	// 로그인 버튼 클릭시 이벤트
	function doLogin() { 
		if (document.getElementById('ipt_id').value == "") { // 아이디 빈값 체크
			alert('아이디를 입력하세요.');
		} else if (document.getElementById('ipt_pw').value == "") { // 패스워드 빈값 체크
			alert('패스워드를 입력하세요.');
		} else {
			var params = {
    			USER_ID : document.getElementById('ipt_id').value,
    			USER_PW : document.getElementById('ipt_pw').value
    		};
			
			request("./reqLogin.do", params, function callback(response, status) {
				console.log("status: " + status);
				
				if("000" == response.RES_CD) {
    				location.href = "../main/mainPage.do"
    			} else {
    				alert(response.RES_MSG + "(" + response.RES_CD + ")");	
    			}
    		}, function error(request, status) {
    			alert(status);
    		});
		}
	}
	
	// 임직원가입
	function reg_user() {
		location.href = '../regUser/regUserManage.do';
	}
	
	// 기업회원가입
	function reg_corp() {
		location.href = '../regCorp/regCorpManage.do';
	}

	
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