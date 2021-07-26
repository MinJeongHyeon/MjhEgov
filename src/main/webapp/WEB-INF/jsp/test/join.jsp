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
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbtron" style="padding-top: 20px;">
				<form method="post" action="register.do" method="post"
            encType="multiplart/form-data" id="regForm" onsubmit="return check()">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" id="userID" maxlength="50">
						<button class="checkID" type="button" id="checkID" onclick="fn_checkID();" value="N">중복확인</button>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" id="userPassword" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" id="userName" maxlength="50">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="userGender" autocomplete="off" value="남자"
								checked>남자
							</label> <label class="btn btn-primary"> <input type="radio"
								name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"
							name="userEmail" id="userEmail" maxlength="50">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
			
			function check(){
				if($("#userID").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userID").focus();
					return false;
				}
				if($("#userPassword").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPassword").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				if($("#checkID").val() == "N"){
					alert("아이디 중복 확인을 해주세요");
					return false;
				}
				document.getElementById('userID').disabled = false;
				return true;
			}
		
		function fn_checkID(){
			$.ajax({
				url : "/checkID.do",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else{
						$('#checkID').val("Y");
						alert("사용 가능한 아이디입니다.");
						document.getElementById('userID').disabled = true;
					}
				}
			})
		}
		
	</script>
</body>
</html>