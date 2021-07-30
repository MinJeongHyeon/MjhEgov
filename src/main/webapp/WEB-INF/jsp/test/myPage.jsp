<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
	rel="stylesheet">
<title>Spring 게시판 웹 사이트</title>
  <style>
    [class|="col-sm-12"] {
      background: #fafafa;
      border: 1px solid #ededed;
      height: 150px;
      font-size: 13px;
      color: black;
      font-weight: 700;
      padding-left: 20px;
      margin-bottom: 30px;
    }
  </style>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
			<h1>마이페이지</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="col-sm-12">
					<h3>회원 정보 수정</h3>
					<br>
					<br>
					<button type="button" class="btn btn-default pull-right"
					onclick="javascript:location.href='userUpdatePage.do'">수정</button>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="col-sm-12">
					<h3>미구현</h3>
					<br>
					<br>
					<button type="button" class="btn btn-default pull-right">미구현</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="col-sm-12">
					<h3>미구현</h3>
					<br>
					<br>
					<button type="button" class="btn btn-default pull-right">미구현</button>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="col-sm-12">
					<h3>미구현</h3>
					<br>
					<br>
					<button type="button" class="btn btn-default pull-right">미구현</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>