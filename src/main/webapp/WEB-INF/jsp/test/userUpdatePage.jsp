<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Spring 게시판 웹 사이트</title>
<script type="text/javascript" src='js/core.min.js'></script>
<script type="text/javascript" src='js/sha256.min.js'></script>

  <style>
    .row { margin-bottom: 10px; }
    [class|="col"] {
      background: #fafafa;
      border: 1px solid #ededed;
      height: 150px;
      font-size: 13px;
      color: black;
      font-weight: 700;
      padding-left: 20px;
    }
    th {
   		background: #EFF5FB;
    	width:200px;
    }
  </style>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	<div class="container">
		<h1>회원정보 수정</h1>
		<form id="userVo" action="updateUser.do" method="post"
            encType="multipart/form-data">
			<input type="hidden" id="userID" name="userID" value="${user.userID}">
			<input type="hidden" id="userName" name="userName" value="${user.userName}">
			<input type="hidden" id="userPassword" name="userPassword" value="${user.userPassword}">
			<input type="hidden" id="userEmail" name="userEmail" value="${user.userEmail}">
			<input type="hidden" id="userGender" name="userGender" value="${user.userGender}">
		</form>

		<table class="table table-bordered"
			style="border: 1px solid #6E6E6E;">
			<tr>
				<th colspan="2">${user.userID}님의 정보입니다.</th>
			</tr>
			<tr>
				<th>이름</th>
				<td>
				${user.userName}
					<div class="input-group" style="width:30%; margin-top:10px; min-width:200px;">
						<div><input type="text" id="newName" class="form-control"
								name="newName" placeholder="이름 변경">
						</div>
						<div class="input-group-btn">
								<button id="nameBtn" class="btn btn-default">변경</button>
						</div>
					</div>			
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${user.userGender}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<div style="width:50%; min-width:200px;">
					<input type="password" class="form-control" placeholder="현재 비밀번호"
							name="currentPassword" id="currentPassword" maxlength="50"><br>
					<input type="password" class="form-control" placeholder="새 비밀번호"
							name="newPassword" id="newPassword" maxlength="50"><br>
					<input type="password" class="form-control" placeholder="비밀번호 확인"
							name="checkPassword" id="checkPassword" maxlength="50"><br>
					<button type="button" id="pwBtn" class="btn btn-default">비밀번호 수정</button>
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${user.userEmail}
					<div class="input-group" style="width:30%; margin-top:10px; min-width:200px;">
						<div><input type="text" id="newEmail" class="form-control"
								name="newEmail" placeholder="이메일 변경">
						</div>
						<div class="input-group-btn">
								<button class="btn btn-default" id="emailBtn">변경</button>
						</div>
					</div>		
				</td>
			</tr>
		</table>
		<button type="button" onclick="location.href='withdrawPage.do'" style="color: white; background-color: #cccccc; border: 1px solid #aaaaaa;" class="btn pull-right">회원탈퇴</button>
		<p class="pull-right" style="color: #aaaaaa; margin: 6px 5px 0 0;">탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.</p>
	</div>
	<br>
	<br>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
<script type="text/javascript">
$("#nameBtn").on("click", function(){
	  $("#userName").val($("#newName").val());
	  $("#userVo").submit();
	  alert("변경이 완료되었습니다.");
});
$("#pwBtn").on("click", function(){
	var shaPw = CryptoJS.SHA256($('#currentPassword').val()).toString(); 
	if($("#userPassword").val() != shaPw) {
		alert("현재 비밀번호가 일치하지 않습니다.");
		return;
	}
	
	if ($("#newPassword").val() == null || $("#newPassword").val() == "") {
		alert("새 비밀번호를 입력해주세요.");
		return;
	}
	if ($("#newPassword").val() != $("#checkPassword").val()) {
		alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		return;
	}
	$("#userPassword").val($("#newPassword").val());
	$("#userVo").submit();
	alert("변경이 완료되었습니다.");
});
$("#emailBtn").on("click", function(){
	$("#userEmail").val($("#newEmail").val());
	$("#userVo").submit();
	alert("변경이 완료되었습니다.");
});
</script>
</html>