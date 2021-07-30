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
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	<input type="hidden" id="userPassword" name="userPassword" value="${user.userPassword}">
	<form id="userVo" action="deleteUser.do" method="post"
            encType="multipart/form-data">
			<input type="hidden" id="userID" name="userID" value="${user.userID}">
	</form>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
			사용하고 계신 아이디&#40;${user.userID}&#41;는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
			탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
			</div>
			<br>
			<div class="row">
			<span class="glyphicon glyphicon-ok"></span> 
			탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
			</div>
			<br>
			<div class="row">
			보안을 위해 회원님의 비밀번호를 확인 합니다.<br><br>
			<input type="password" class="form-control" placeholder="비밀번호 확인"
							name="currentPassword" id="currentPassword" maxlength="50"><br>
			<button type="button" id="wdBtn" class="btn btn-default">회원탈퇴</button>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
<script type="text/javascript">
$("#wdBtn").on("click", function(){
	var shaPw = CryptoJS.SHA256($('#currentPassword').val()).toString(); 
	if($("#userPassword").val() != shaPw) {
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
   	if (confirm("탈퇴하시겠습니까 ?") == true) {
   		$("#userVo").submit();
   		alert("탈퇴가 완료되었습니다.");
    } else {
    	return;
    }
});
</script>
</html>