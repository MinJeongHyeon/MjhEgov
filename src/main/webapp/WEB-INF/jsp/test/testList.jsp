<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 코어 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 함수 라이브러리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring 게시판 웹 사이트</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
a, a:hover {
	color: #000000;
}
</style>
</head>
<body>
	<!-- 네비게이션 바 -->
	<jsp:include page="top.jsp" flush="false" />
	<br />
	<br />
	<div class="container">
	
		<!-- 검색 DIV 시작 -->
		<div class="navbar-form pull-right">
			<table>
				<tr>
					<!-- 검색 타입  -->
					<th> 
						<div class="w100" style="padding-right: 10px">
							<select class="form-control form-control-sm" name="searchType"
								id="searchType">
								<option value="bbsTitle">제목</option>
								<option value="bbsContent">내용</option>
								<option value="userID">작성자</option>
							</select>
						</div>
					</th>
					
					<!-- 검색 창 -->
					<th>
						<div class="input-group">
							<div class="w300" style="padding-right: 10px">
								<input type="text" class="form-control" name="keyword"
									id="keyword">
							</div>
							<div class="input-group-btn">
								<button class="btn btn-default" name="btnSearch" id="btnSearch">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
					</th>
					
					<!-- n개씩 보기 -->
					<th>
						<div class="btn-group">
							<a class="btn btn-default dropdown-toggle btn-select" href="#"
								data-toggle="dropdown">${pagination.listSize}개씩<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#"
									onClick="fn_pagination('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '10'
                     ,'${search.searchType}', '${search.keyword}')">10개씩</a></li>
								<li><a href="#"
									onClick="fn_pagination('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '15'
                     ,'${search.searchType}', '${search.keyword}')">15개씩</a></li>
								<li><a href="#"
									onClick="fn_pagination('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '20'
                     ,'${search.searchType}', '${search.keyword}')">20개씩</a></li>
							</ul>
						</div>
					</th>
					
				</tr>
			</table>
		</div>
		<!-- 검색 DIV 끝 -->
		
		<!-- 게시글 목록 시작 -->
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 60px;">번호</th>
					<th style="background-color: #eeeeee; text-align: center; width: 400px">제목</th>
					<th style="background-color: #eeeeee; text-align: left; width: 100px;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width: 200px;">등록일자</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list }" var="result">
					<tr>
						<td>${result.bbsID}</td>
						<td style="text-align: left; padding-left:30px;"><a href="testDetail.do?bbsID=${result.bbsID}">${fn:escapeXml(result.bbsTitle)}</a></td>
						<td style="text-align: left;">${result.userID}</td>
						<td>${result.bbsDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 게시글 목록 끝 -->

		<!-- 페이징 시작 -->
		<div id="paginationBox" class="pagination1">
			<ul class="pagination" style="justify-content: center;">

				<!-- 처음 버튼 -->
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_pagination('1', '1', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">&lt;&lt;</a></li>
				</c:if>
				
				<!-- 이전 버튼 -->
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">&lt;</a></li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="number">
					<li class="page-item <c:out value="${pagination.page == number ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${number}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                     ,'${search.searchType}', '${search.keyword}')">
							${number} </a>
					</li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">다음</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 -->
		<hr />

		<!-- 글쓰기 버튼 -->
		<a class="btn btn-primary pull-right" style="float: right"
			href="testRegister.do">글쓰기</a>



	</div>


	<br>

</body>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-datepicker.ko.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
    //이전 버튼 이벤트
    //5개의 인자값을 가지고 이동 testList.do
    //무조건 이전페이지 범위의 가장 앞 페이지로 이동
    function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
            
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;
            
        var url = "/testList.do";
        url += "?page=" + page;
        url += "&range=" + range;
        url += "&listSize=" + listSize;
        url += "&searchType=" + searchType;
        url += "&keyword=" + keyword;
        location.href = url;
        }
 
 
    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {
 
        var url = "/testList.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword; 
 
            location.href = url;    
        }
 
    //다음 버튼 이벤트
    //다음 페이지 범위의 가장 앞 페이지로 이동
    function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;            
        var url = "/testList.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword;
            location.href = url;
        }
        
    // 검색
    $(document).on('click', '#btnSearch', function search(e){
        e.preventDefault();
        var url = "/testList.do";
        url += "?searchType=" + $('#searchType').val();
        url += "&keyword=" + $('#keyword').val();
        location.href = url;
        console.log(url);
 
    });    
    
    $("#keyword").keypress(function(e) { 
        if (e.keyCode == 13){
        	e.preventDefault();
            var url = "/testList.do";
            url += "?searchType=" + $('#searchType').val();
            url += "&keyword=" + $('#keyword').val();
            location.href = url;
            console.log(url);
        }    
    });

 
    
    </script>

</html>