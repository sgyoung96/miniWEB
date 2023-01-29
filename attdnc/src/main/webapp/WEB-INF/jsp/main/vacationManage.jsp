<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리 > 휴가관리 > 휴가생성요청</title>
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
					<li><a href="../vaction/vacationManage.do">휴가생성요청</a></li>
					<li><a href="../vaction/vacationApprovalManage.do">휴가신청승인</a></li>
				</ul>
			</li>
			<li><a href="../admin/adminPage.do">관리자페이지</a></li>
		</ul>
		</nav>
		</header>
		<div class="background">
			<div class="containter" align="center">
				<div class="tb_user_list" style="padding-top: 30px;">
					<table id="tb_user_list" border="1">
						<tr>
							<th>휴가일자</th>
							<td>
								<select name="month" id="month" style="width : 70px;">
									<option value="">-선택-</option>
									<c:forEach items="${monthList}" var="list">
										<option value="${list}">${list}</option> 
									</c:forEach>
								</select>
								월
								<select name="day" id="day" style="width : 70px;">
									<option value="">-선택-</option>
									<c:forEach items="${dayList}" var="list">
										<option value="${list}">${list}</option>
									</c:forEach>
								</select>
								일
							</td>
						</tr>
					</table>
				</div>
				
				<div style="padding-top: 30px;">
					<input type="button" style="width: 80px; height: 30px;" id="btnMain" value="메인">
					<input type="button" style="width: 80px; height: 30px;" id="btnReg" value="신청">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	$(document).ready(function(){

		$("#btnReg").click(function() {
			
			var month = $("#month").val();
			var day = $("#day").val();
			
			if (month == "" || day == "") {
				alert("휴가일자를 선택해 주세요.");
				return;
			}
			
			var date = "2023"+month+day;

			params = {
					ATT_DT : date
			};
			
			request("./regVaction.do", params, function callback(response, status) {
				console.log("status: " + status);
				if("000" != response.RES_CD) {
    				alert(response.RES_MSG + "(" + response.RES_CD + ")");
    			} else { 
    				alert(response.RES_MSG);
					location.href = "../main/mainPage.do";
    			}
    		}, function error(request, status) {
    			alert(status);
    		});
		});
		
		$("#btnMain").click(function() {
			location.href = "../main/mainPage.do";
		});
	});
		
		
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
