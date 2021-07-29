<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>

  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- datepicker -->
	<link href="css/jquery.datetimepicker.css" rel="stylesheet" />	
	<script src="js/jquery.datetimepicker.full.min.js" type="text/javascript"></script>
	<!-- custom -->
	<link href="css/schedule.css" rel="stylesheet" />	
	<script src="js/schedule.js?v=1" type="text/javascript"></script>

	

</head>
<body>
<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 일정 추가 </h1>
	</div>
	<div class = "group-body">
	<form id = "scheduleData">
		<input type="hidden" class="id" id="id" name="id" value="${user.userID}">
		<div class = "top">
			<input class = "subject" id = "subject" type = "text" name = "subject" placeholder="제목을 입력해주세요">
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 시작 </h3>
		</div>
		<div class = "domain">
			<input class = "date" id = "startDate" type = "text" name = "startDate" id = "startDate" autocomplete="off">
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 종료 </h3>
		</div>
		<div class = "domain">
			<input class = "date" id = "endDate" type = "text" name = "endDate" id = "endDate" autocomplete="off">
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 메모 </h3>
		</div>
		<div class = "domain">
			<textarea class = "memo" id = "memo" name = "memo" rows = "5" cols = "20" placeholder="100글자까지 입력 가능합니다"></textarea> 
		</div>
	</form>
		<button class = "ok-button" type= "button" onclick="javascript:click_ok()">확인</button>
	</div>	
	
	
</div>
<script>
jQuery.datetimepicker.setLocale('kr'); 
$('#startDate').datetimepicker({
	format:'y.m.d H:i'
	
});
$('#endDate').datetimepicker({
	format:'y.m.d H:i'
});
</script>
</body>
</html>
</html>