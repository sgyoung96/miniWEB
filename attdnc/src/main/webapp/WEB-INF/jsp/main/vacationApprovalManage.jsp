<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리 > 휴가관리 > 휴가신청승인</title>
<link href="../css/main_css.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<!-- 
<style>

.tbl_type2 {width:100%;border-top:2px solid #3d3d3d;}
.tbl_type2 th,.tbl_type2 td {padding:9px 10px;border-bottom:1px solid #d2d2d2;}
.tbl_type2 th {background:#eaeaea;border-right:1px solid #d2d2d2;border-left:1px solid #d2d2d2;vertical-align:middle;}
.tbl_type2 th.last {border-right:none;}

</style>
 -->
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
				<div style="clear: both; height: 5px;"></div>
				
	<!--			<table class="tbl_type2">
	 					<colgroup>
							<col align="center" width="33%" />
							<col align="center" width="33%" />
							<col align="center" width="34%" />
						</colgroup>
						<thead>
							<tr>
								<th align="center">회원명</th>
								<th align="center">휴가일자</th>
								<th align="center">회사명</th>
							</tr>
						</thead>
						<c:if test="${!empty approvalList}">
							<c:forEach items="${approvalList}" var="list">
								<tr id="approval_tr" onclick="trOnClick('${list.USER_NO}')">
									<td align="center">${list.USER_NM}</td>
									<td align="center">${list.ATT_DT}</td>
									<td align="center">${list.CORP_NM}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty approvalList }">
							<td colspan="5" align="center">휴가 이력이 없습니다.</td>
						</c:if>
					</table>
			 -->
				
				
					<table id="tb_user_list" border="1">
						<tr>
							<th width="20%">
								이름
							</th>
							<th width="20%">
								휴가일자
							</th>
							<th width="20%">
								부서
							</th>
							<th width="20%">
								직급
							</th>
							<th width="20%">
								휴가승인
							</th>
						</tr>
					</table>
				
				<div style="padding-top: 30px;">
					<input type="button" style="width: 80px; height: 30px;" id="btnMain" value="메인">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnMain").click(function() {
			location.href = "../main/mainPage.do";
		});
	});
	
	init();
	
	function init () {
		var params = {};
		
		request("./getVacationList.do", params, function callback(response, status) {
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
			html += '		<span id="id">' + userList[i].ATT_DT + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<span id="dept">' + userList[i].DEPT_NM + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<span id="rank">' + userList[i].USER_RK + '</span>';
			html += '	</td>';
						
			html += '	<td>';
			html += '		<input type="button" value="승인" onclick="btnAcpt('+ userList[i].ATT_NO +');">';
			html += '	</td>';

			html += '</tr>';
		}
		$('#tb_user_list').append(html); 
	}
	
	function btnAcpt(attNo) {
		
		var params = {
				ATT_NO : attNo
		};
		
		request("./acptVacation.do", params, function callback(response, status) {
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
