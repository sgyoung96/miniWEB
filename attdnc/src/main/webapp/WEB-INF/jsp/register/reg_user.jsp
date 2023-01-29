<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원회원가입</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>	
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
	.line {
		position: absolute;
		height: 2px;
		margin-top: -15px;
		left: 50%;
		width: 100%;
		transform: translate(-50%, -50%);
		background: #000000;
	}
	.contents {
		position: absolute;
		top: 15%;
		left: 50%;
		transform: translate(-50%, -0%);
	}
	.title {
		font-size: 16px;
	}
	input {
		width: 100%;
		background: #ffffff;
		border: none;
		border-bottom: solid 1px #000000;
	}
	.btn {
		padding: 4px;
		cursot: pointer;
		background-color: #000000;
		color: #ffffff;
		font-size: 12px;
		margin-left: -100%;
		cursor: pointer;
	}
	.warn {
		color: red;
		font-size: 9px;
		margin-top: -100%;
	}
	.btn_area {
		margin-top: 50px;
	}
	.register {
		background: #ffffff;
		color: #000000;
		font-size: 16px;
		padding: 10px;
		border: 1px solid #666666;
		cursor: pointer;
		width: 60%;
	}
	.back {
		background: #ffffff;
		color: #000000;
		font-size: 16px;
		padding: 10px;
		border: 1px solid #666666;
		cursor: pointer;
		width: 30%;
	}
</style>
<body>
	<div class="background"></div>
	<div class="contents" align="center">
		<form name="frm_reg_corp">
			<table>
				<tr>
					<td colspan="5">
						<h4>임직원가입</h4>
						<div class="line"></div>
					</td>
				</tr>
				
				<tr>
					<td>
						<br>
						<span class="title">가입자정보 |</span>
					</td>
				</tr>
			
				<tr>
					<td colspan="5">
						<input id="name" name="name" type="text" placeholder="성명" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn name">
					<td colspan="5">
						<div align="right">
							<span id="msg_name"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="id" name="id" type="text" placeholder="아이디" onkeyup="iptSensor(this)" >
					</td>
				</tr>
				<tr class="warn id">
					<td colspan="5">
						<div align="right">
							<span id="msg_id"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="pw" name="pw" type="password" placeholder="패스워드" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="pw_chk" name="pw_chk" type="password" placeholder="패스워드 확인" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn pw">
					<td colspan="5">
						<div align="right">
							<span id="msg_pw"></span>
						</div>
					</td>
				</tr>
				
				
				
				<tr>
					<td>
						<br>
						<span class="title">회사정보 |</span>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="corp_nm" name="corp_nm" type="text" placeholder="회사명" onkeyup="iptSensor(this)" value="">
					</td>
				</tr>
				<tr class="warn corp_nm">
					<td colspan="5">
						<div align="right">
							<span id="msg_corp_nm"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="corp_tel_no" name="corp_tel_no" type="text" placeholder="연락처" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn corp_tel_no">
					<td colspan="5">
						<div align="right">
							<span id="msg_corp_tel_no"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="email_id" name="corp_email_id" type="text" placeholder="이메일" onkeyup="iptSensor(this)">
					</td>
					<td>@</td>
					<td colspan="2">
						<input id="email_corp" name="corp_email_corp" type="text" placeholder="직접입력" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn corp_email"><td colspan="5"><div align="right"><span id="msg_email"></span></div></td></tr>
				
				<tr>
					<td colspan="5">
						<input id="dept" name="dept" type="text" placeholder="부서" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn admin_dept">
					<td colspan="5">
						<div align="right">
							<span id="msg_dept"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="rank" name="rank" type="text" placeholder="직급" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn rank">
					<td colspan="5">
						<div align="right">
							<span id="msg_rank"></span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						<div class="btn_area" align="center">
							<input type="button" class="back" id="btnBack" value="뒤로">	
							<input type="button" class="register" id="btnReg" value="기업회원가입신청">
						</div>
					</td>
				</tr>
				</table>
			<br><br><br><br>
		</form>
	</div>
	
	<script>
		var warns = document.getElementsByClassName('warn'); // 전체 경고 문구들	
		var warn = ''; // 개별 경고 문구
		var iptVal = ''; // 개별 인풋
		var msg = ''; // 개별 경고 문구
	
		$(document).ready(function(){
    		
			hideWarnMsg(); // 화면 첫 진입 시 전체 경고문구 숨기기
			
    		$("#btnReg").click(function() {
    			
    			var name = $("#name").val();													//이름
    			var id = $("#id").val();													//아이디
    			var pw = $("#pw").val();												//패스워드
    			var pw_chk = $("#pw_chk").val()		//패스워드 확인
    			var corp_nm = $("#corp_nm").val();												//회사명
    			var corp_tel_no = $("#corp_tel_no").val();										//회사연락처
    			var email = $("#email_id").val() + "@" + $("#email_corp").val();		//회사이메일
    			var dept = $("#dept").val();												//부서
    			var rank = $("#rank").val();												//직급
    			
    			var params = {
    					USER_NM : name,
    					USER_ID : id,
    					USER_PW : pw,
    					
    					CORP_NM : corp_nm,
    					USER_TEL_NO : corp_tel_no,
    					USER_EMAIL : email,
    					DEPT_NM : dept,
    					USER_RK : rank
    			};
    			
    			request("./regUser.do", params, function callback(response, status) {
    				console.log("status: " + status);
    				
    				if("000" == response.RES_CD) {
        				alert(response.RES_MSG);	// 가입완료
        				location.href = "../login/loginManage.do";
        			} else {
        				alert(response.RES_MSG + "(" + response.RES_CD + ")");	
        			}
        		}, function error(request, status) {
        			alert(status);
        		});
    			
    			
    			
    		});
    	});
	
		// 경고 문구 전체 숨기기
		function hideWarnMsg() {
			for (i=0; i<warns.length; i++) {
				warns[i].style.visibility = 'hidden';
			}
		}
		
		// 인풋 체크 onkeyup Event
		function iptSensor(obj) { // obj : <input ~>
			if (obj.name == 'corp_nm') {
				warn = document.getElementsByClassName('corp_nm')[0]; // 경고문구 row
				iptVal = document.getElementsByName('corp_nm')[0]; // 인풋
				msg = document.getElementById('msg_corp_nm'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '회사명을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaHangulNumeric(iptVal.value)) {
					msg.textContent = '회사명을 다시 확인해 주세요. (특수문자 제외)';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'corp_tel_no') {
				warn = document.getElementsByClassName('corp_tel_no')[0]; // 경고문구 row
				iptVal = document.getElementsByName('corp_tel_no')[0]; // 인풋
				msg = document.getElementById('msg_corp_tel_no'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '회사 연락처를 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isNumeric(iptVal.value)) {
					msg.textContent = '회사 연락처를 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'corp_email_id' || obj.name == 'corp_email_corp') {
				warn = document.getElementsByClassName('corp_email')[0]; // 경고문구 row
				var email_id_iptVal = document.getElementsByName('corp_email_id')[0]; // 인풋
				var email_corp_iptVal = document.getElementsByName('corp_email_corp')[0]; // 인풋
				msg = document.getElementById('msg_email'); // span 텍스트
				
				if (email_id_iptVal.value == '' || email_corp_iptVal.value == '') {
					msg.textContent = '이메일을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaNumericDott(email_id_iptVal.value) || !isAlphaNumericDott(email_corp_iptVal.value)) {
					msg.textContent = '이메일을 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'id') {
				warn = document.getElementsByClassName('id')[0]; // 경고문구 row
				iptVal = document.getElementsByName('id')[0]; // 인풋
				msg = document.getElementById('msg_id'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '아이디를 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaNumeric(iptVal.value)) {
					msg.textContent = '아이디를 다시 확인해 주세요. (특수문자 제외)';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'pw') {
				warn = document.getElementsByClassName('pw')[0]; // 경고문구 row
				iptVal = document.getElementsByName('pw')[0]; // 인풋
				msg = document.getElementById('msg_pw'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '패스워드를 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaNumeric(iptVal.value)) {
					msg.textContent = '패스워드를 다시 확인해 주세요. (특수문자 제외)';
					warn.style.visibility = 'visible';
				} else if (iptVal.value != document.getElementsByName('pw_chk')[0].value) {
					msg.textContent = '패스워드 확인을 해주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'pw_chk') {
				warn = document.getElementsByClassName('pw_chk')[0]; // 경고문구 row
				iptVal = document.getElementsByName('pw_chk')[0]; // 인풋
				msg = document.getElementById('msg_pw'); // span 텍스트
				
				if (iptVal.value != document.getElementsByName('pw')[0].value) {
					msg.textContent = '패스워드가 일치하지 않습니다.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'name') {
				warn = document.getElementsByClassName('name')[0]; // 경고문구 row
				iptVal = document.getElementsByName('name')[0]; // 인풋
				msg = document.getElementById('msg_name'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '성명을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaHangul(iptVal.value)) {
					msg.textContent = '성명을 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'dept') {
				warn = document.getElementsByClassName('dept')[0]; // 경고문구 row
				iptVal = document.getElementsByName('dept')[0]; // 인풋
				msg = document.getElementById('msg_dept'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '부서명을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaHangulNumeric(iptVal.value)) {
					msg.textContent = '부서명을 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'rank') {
				warn = document.getElementsByClassName('rank')[0]; // 경고문구 row
				iptVal = document.getElementsByName('rank')[0]; // 인풋
				msg = document.getElementById('msg_rank'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '직급을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaHangulNumeric(iptVal.value)) {
					msg.textContent = '직급을 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} 
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
		
		// 뒤로가기 버튼
		$("#btnBack").click(function() {
			location.href = "../login/loginManage.do";
		});
	
		// 정규식
		// 영문 + 한글 + 숫자
		function isAlphaHangulNumeric(t) {
			return /^[a-z|A-Z|가-힣|0-9]+$/.test(t);
		}
		
		// 영문 + 한글
		function isAlphaHangul(t) {
			return /^[a-z|A-Z|가-힣]+$/.test(t);
		}
		
		// 영소문자 + 숫자
		function isAlphaNumeric(t) {
			return /^[a-z0-9]+$/.test(t);
		}
		
		// 영소문자 + 숫자 + .
		function isAlphaNumericDott(t) {
			return /^[a-z0-9|.]+$/.test(t);
		}
		
		// 숫자
		function isNumeric(t) {
			return /^[0-9]+$/.test(t);
		}
		
		// 한글 + 숫자
		function isHangulWordNumeric(t) {
			return /^[가-힣0-9]+$/.test(t);
		}
		
</script>
</body>
</html>