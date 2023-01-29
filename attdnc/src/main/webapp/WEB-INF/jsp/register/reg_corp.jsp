<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기업회원가입</title>
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
	<div class="background">
		<div class="header">
		</div>
	</div>
	<div class="contents" align="center">
		<form name="frm_reg_corp">
			<table>
				<tr>
					<td colspan="5">
						<h4>기업회원가입</h4>
						<div class="line"></div>
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
						<input id="corp_nm" name="corp_nm" type="text" placeholder="회사명" onkeyup="iptSensor(this)">
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
						<input id="corp_no" name="corp_no" type="text" placeholder="사업자등록번호" onkeyup="iptSensor(this)">
					</td>
					<td colspan="1">
						<a class="btn" onclick="chkDataExists('corp_no')">중복확인</a>
					</td>
				</tr>
				<tr class="warn corp_no">
					<td colspan="5">
						<div align="right">
							<span id="msg_corp_no"></span>
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
						<input id="corp_email_id" name="corp_email_id" type="text" placeholder="이메일" onkeyup="iptSensor(this)">
					</td>
					<td>@</td>
					<td colspan="2">
						<input id="corp_email_corp" name="corp_email_corp" type="text" placeholder="직접입력" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn corp_email"><td colspan="5"><div align="right"><span id="msg_email"></span></div></td></tr>
				
				<tr>
					<td>
						<br>
						<span class="title">대표자정보 |</span>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="ceo_nm" name="ceo_nm" type="text" placeholder="대표자명" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn ceo_nm">
					<td colspan="5">
						<div align="right">
							<span id="msg_ceo_nm"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="ceo_phone_no" name="ceo_phone_no" type="text" placeholder="대표자 연락처" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn ceo_phone_no">
					<td colspan="5">
						<div align="right">
							<span id="msg_ceo_phone_no"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="ceo_email_id" name="ceo_email_id" type="text" placeholder="대표자 이메일" onkeyup="iptSensor(this)">
					</td>
					<td>@</td>
					<td colspan="2">
						<input id="ceo_email_corp" name="ceo_email_corp" type="text" placeholder="직접입력" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn ceo_email"><td colspan="5"><div align="right"><span id="msg_ceo_email"></span></div></td></tr>
				
				<tr>
					<td>
						<br>
						<span class="title">관리자정보 |</span>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="admin_id" name="admin_id" type="text" placeholder="아이디" onkeyup="iptSensor(this)" >
					</td>
					<td>
						<a class="btn" onclick="chkDataExists('admin_id')">중복확인</a>
					</td>
				</tr>
				<tr class="warn admin_id">
					<td colspan="5">
						<div align="right">
							<span id="msg_admin_id"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="admin_pw" name="admin_pw" type="password" placeholder="패스워드" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="admin_pw_chk" name="admin_pw_chk" type="password" placeholder="패스워드 확인" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn admin_pw">
					<td colspan="5">
						<div align="right">
							<span id="msg_admin_pw"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="admin_nm" name="admin_nm" type="text" placeholder="관리자명" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn admin_nm">
					<td colspan="5">
						<div align="right">
							<span id="msg_admin_nm"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="admin_dept" name="admin_dept" type="text" placeholder="부서" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn admin_dept">
					<td colspan="5">
						<div align="right">
							<span id="msg_admin_dept"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input id="admin_rank" name="admin_rank" type="text" placeholder="직급" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn admin_rank">
					<td colspan="5">
						<div align="right">
							<span id="msg_admin_rank"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="admin_email_id" name="admin_email_id" type="text" placeholder="이메일" onkeyup="iptSensor(this)">
					</td>
					<td>@</td>
					<td colspan="2">
						<input id="admin_email_corp" name="admin_email_corp" type="text" placeholder="직접입력" onkeyup="iptSensor(this)">
					</td>
				</tr>
				<tr class="warn admin_email">
					<td colspan="5">
						<div align="right">
							<span id="admin_email"></span>
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
	
	<script type="text/javascript">
		var warns = document.getElementsByClassName('warn'); // 전체 경고 문구들	
		var warn = ''; // 개별 경고 문구
		var iptVal = ''; // 개별 인풋
		var msg = ''; // 개별 경고 문구
		
		var corpNoDupChk = false;
		var adminIdDupChk = false;
	
		$(document).ready(function(){
    		
			hideWarnMsg(); // 화면 첫 진입 시 전체 경고문구 숨기기
			
    		$("#btnReg").click(function() {
    			
    			if (corpNoDupChk != true) {
    				alert("사업자등록번호 중복확인 해주세요.");
    				return;
    			} else if (adminIdDupChk != true) {
    				alert("관리자 아이디 중복확인 해주세요.");
    				return;
    			}
    			
    			var corp_nm = $("#corp_nm").val();													//회사명
    			var corp_reg_no = $("#corp_no").val();													//사업자등록번호
    			var corp_tel_no = $("#corp_tel_no").val();											//연락처
    			var corp_email = $("#corp_email_id").val() + "@" + $("#ceo_email_corp").val();		//이메일
    			var ceo_nm = $("#ceo_nm").val();													//대표자명
    			var ceo_phone_no = $("#ceo_phone_no").val();										//대표자연락처
    			var ceo_email = $("#ceo_email_id").val() + "@" + $("#ceo_email_corp").val();		//대표자이메일
    			var admin_id = $("#admin_id").val();												//관리자아이디
    			var admin_pw = $("#admin_pw").val();												//관리자패스워드
    			var admin_nm = $("#admin_nm").val();												//관리자이름
    			var admin_dept = $("#admin_dept").val();												//관리자부서
    			var admin_rank = $("#admin_rank").val();												//관리자직급
    			var admin_email = $("#admin_email_id").val() + "@" + $("#admin_email_corp").val();	//관리자이메일
    			
    			var params = {
    					CORP_NM : corp_nm,
    					CORP_REG_NO : corp_reg_no,
    					CORP_TEL_NO : corp_tel_no,
    					CORP_EMAIL : corp_email,
    					
    					CORP_CEO_NM : ceo_nm,
    					CORP_CEO_PHONE_NO : ceo_phone_no,
    					CORP_CEO_EMAIL : ceo_email,
    					
    					USER_ID : admin_id,
    					USER_PW : admin_pw,
    					USER_NM : admin_nm,
    					DEPT_NM : admin_dept,
    					USER_RK : admin_rank,
    					USER_EMAIL : admin_email
    			};
    			
    			request("./regCorp.do", params, function callback(response, status) {
    				console.log("status: " + status);
    				if("000" != response.RES_CD) {
        				alert(response.RES_MSG + "(" + response.RES_CD + ")");
        			} else { // 관리자 정보 등록
        				params.CORP_NO = response.CORP_NO;
        				
        				request("./regAdmin.do", params, function callback(response, status) {
        					if("000" != response.RES_CD) {
                				alert(response.RES_MSG + "(" + response.RES_CD + ")");
        					} else { // 성공
        						alert(response.RES_MSG);
        						location.href = "../login/loginManage.do";
        					}
        					
        				}, function error(request, status) {
        					alert(status);
        				});
        			}
        		}, function error(request, status) {
        			alert(status);
        		});
    			
    			
    			
    		});
    	});
		
	
		/*
		*	경고 문구 전체 숨기기
		*/
		function hideWarnMsg() {
			for (i=0; i<warns.length; i++) {
				warns[i].style.visibility = 'hidden';
			}
		}
		
		/*
		*	onkeyup Event
		*/
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
			} else if (obj.name == 'corp_no') {
				warn = document.getElementsByClassName('corp_no')[0]; // 경고문구 row
				iptVal = document.getElementsByName('corp_no')[0]; // 인풋
				msg = document.getElementById('msg_corp_no'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '사업자등록번호를 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isNumeric(iptVal.value)) {
					msg.textContent = '사업자 등록번호를 다시 확인해 주세요.';
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
				if (obj.name == 'corp_email_id') {
					warn = document.getElementsByClassName('corp_email')[0]; // 경고문구 row
					iptVal = document.getElementsByName('corp_email_id')[0]; // 인풋
					msg = document.getElementById('msg_email'); // span 텍스트
					
					if (iptVal.value == '') {
						msg.textContent = '이메일을 입력해 주세요.';
						warn.style.visibility = 'visible';
					} else if (!isAlphaNumeric(iptVal.value)) {
						msg.textContent = '이메일을 다시 확인해 주세요.';
						warn.style.visibility = 'visible';
					} else {
						msg.textContent = '';
						warn.style.visibility = 'hidden';
					}
				}
				if (obj.name == 'corp_email_corp') {
					warn = document.getElementsByClassName('corp_email')[0]; // 경고문구 row
					iptVal = document.getElementsByName('corp_email_corp')[0]; // 인풋
					msg = document.getElementById('msg_email'); // span 텍스트
					
					if (iptVal.value == '') {
						msg.textContent = '이메일을 입력해 주세요.';
						warn.style.visibility = 'visible';
					} else if (!isAlphaNumericDott(iptVal.value)) {
						msg.textContent = '이메일을 다시 확인해 주세요.';
						warn.style.visibility = 'visible';
					} else {
						msg.textContent = '';
						warn.style.visibility = 'hidden';
					}
				}
			} else if (obj.name == 'ceo_nm') {
				warn = document.getElementsByClassName('ceo_nm')[0]; // 경고문구 row
				iptVal = document.getElementsByName('ceo_nm')[0]; // 인풋
				msg = document.getElementById('msg_ceo_nm'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '대표자명을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaHangul(iptVal.value)) {
					msg.textContent = '대표자명을 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'ceo_phone_no') {
				warn = document.getElementsByClassName('ceo_phone_no')[0]; // 경고문구 row
				iptVal = document.getElementsByName('ceo_phone_no')[0]; // 인풋
				msg = document.getElementById('msg_ceo_phone_no'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '대표자 연락처를 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isNumeric(iptVal.value)) {
					msg.textContent = '대표자 연락처를 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'ceo_email_id' || obj.name == 'ceo_email_corp') {
				if (obj.name == 'ceo_email_id') {
					warn = document.getElementsByClassName('ceo_email')[0]; // 경고문구 row
					iptVal = document.getElementsByName('ceo_email_id')[0]; // 인풋
					msg = document.getElementById('msg_ceo_email'); // span 텍스트
					
					if (iptVal.value == '') {
						msg.textContent = '이메일을 입력해 주세요.';
						warn.style.visibility = 'visible';
					} else if (!isAlphaNumeric(iptVal.value)) {
						msg.textContent = '이메일을 다시 확인해 주세요.';
						warn.style.visibility = 'visible';
					} else {
						msg.textContent = '';
						warn.style.visibility = 'hidden';
					}
				}
				if (obj.name == 'ceo_email_corp') {
					warn = document.getElementsByClassName('ceo_email')[0]; // 경고문구 row
					iptVal = document.getElementsByName('ceo_email_corp')[0]; // 인풋
					msg = document.getElementById('msg_ceo_email'); // span 텍스트
					
					if (iptVal.value == '') {
						msg.textContent = '이메일을 입력해 주세요.';
						warn.style.visibility = 'visible';
					} else if (!isAlphaNumericDott(iptVal.value)) {
						msg.textContent = '이메일을 다시 확인해 주세요.';
						warn.style.visibility = 'visible';
					} else {
						msg.textContent = '';
						warn.style.visibility = 'hidden';
					}
				}
			} else if (obj.name == 'admin_id') {
				warn = document.getElementsByClassName('admin_id')[0]; // 경고문구 row
				iptVal = document.getElementsByName('admin_id')[0]; // 인풋
				msg = document.getElementById('msg_admin_id'); // span 텍스트
				
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
			} else if (obj.name == 'admin_pw') {
				warn = document.getElementsByClassName('admin_pw')[0]; // 경고문구 row
				iptVal = document.getElementsByName('admin_pw')[0]; // 인풋
				msg = document.getElementById('msg_admin_pw'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '패스워드를 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaNumeric(iptVal.value)) {
					msg.textContent = '패스워드를 다시 확인해 주세요. (특수문자 제외)';
					warn.style.visibility = 'visible';
				} else if (iptVal.value != document.getElementsByName('admin_pw_chk')[0].value) {
					msg.textContent = '패스워드 확인을 해주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'admin_pw_chk') {
				warn = document.getElementsByClassName('admin_pw_chk')[0]; // 경고문구 row
				iptVal = document.getElementsByName('admin_pw_chk')[0]; // 인풋
				msg = document.getElementById('msg_admin_pw'); // span 텍스트
				
				if (iptVal.value != document.getElementsByName('admin_pw')[0].value) {
					msg.textContent = '패스워드가 일치하지 않습니다.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'admin_nm') {
				warn = document.getElementsByClassName('admin_nm')[0]; // 경고문구 row
				iptVal = document.getElementsByName('admin_nm')[0]; // 인풋
				msg = document.getElementById('msg_admin_nm'); // span 텍스트
				
				if (iptVal.value == '') {
					msg.textContent = '관리자명을 입력해 주세요.';
					warn.style.visibility = 'visible';
				} else if (!isAlphaHangul(iptVal.value)) {
					msg.textContent = '관리자명을 다시 확인해 주세요.';
					warn.style.visibility = 'visible';
				} else {
					msg.textContent = '';
					warn.style.visibility = 'hidden';
				}
			} else if (obj.name == 'admin_dept') {
				warn = document.getElementsByClassName('admin_dept')[0]; // 경고문구 row
				iptVal = document.getElementsByName('admin_dept')[0]; // 인풋
				msg = document.getElementById('msg_admin_dept'); // span 텍스트
				
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
			} else if (obj.name == 'admin_rank') {
				warn = document.getElementsByClassName('admin_rank')[0]; // 경고문구 row
				iptVal = document.getElementsByName('admin_rank')[0]; // 인풋
				msg = document.getElementById('msg_admin_rank'); // span 텍스트
				
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
			} else if (obj.name == 'admin_email_id' || obj.name == 'admin_email_corp') {
				
				warn = document.getElementsByClassName('admin_email')[0]; // 경고문구 row
				var email_id_iptVal = document.getElementsByName('admin_email_id')[0]; // 인풋
				var email_corp_iptVal = document.getElementsByName('admin_email_corp')[0]; // 인풋
				msg = document.getElementById('admin_email'); // span 텍스트
				
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
			}
		}
		
		/*
		*	중복확인
		*/
		function chkDataExists(obj) {
			
			var url = "";
			var params = {};
			
			if (obj == 'corp_no') { // 사업자등록번호
				
				var corp_no = $("#corp_no").val();
				
				if (corp_no == "") {
					alert("사업자등록번호를 입력해 주세요.");
					return;
				}
				
				url = "./chkCorpNo.do";
				
				params = {
					CORP_NO : corp_no
				};
			} else {
				
				var admin_id = $("#admin_id").val();
				
				if (admin_id == "") {
					alert("아이디를 입력해 주세요.");
					return;
				}
				
				url = "./chkAdminUserId.do";
				
				params = {
	    			USER_ID : admin_id
	    		};
			}
			
			request(url, params, function callback(response, status) {
				console.log("status: " + status);
				
				if("000" == response.RES_CD) {
    				alert(response.RES_MSG);	// 사용할 수 있는 사업자번호입니다.
    				
    				if (obj == 'corp_no') { // 사업자등록번호
    					corpNoDupChk = true;
    				} else {
    					adminIdDupChk = true;
    				}
    			} else {
    				
    				if (obj == 'corp_no') { // 사업자등록번호
    					corpNoDupChk = false;
    				} else {
    					adminIdDupChk = false;
    				}
    				
    				alert(response.RES_MSG + "(" + response.RES_CD + ")");	
    			}
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