<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring 게시판 웹 사이트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<style type='text/css'>
a, a:hover {
	color: #000000;
}
th {
	text-align: center;
}
textarea, textarea[readonly], input, input[type], .uneditable-input {
	box-shadow: none;
	border: 0;
}
textarea:focus, textarea[readonly]:focus, input:focus, input[type]:focus, .uneditable-input:focus {
    border-color: none;
    box-shadow: none;
    outline: 0 none;
}
</style>
<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
    <br />
    <br />
    <div class="container">
    <div class="row">
        <form action="update.do" id="viewForm" method="post"
            encType="multipart/form-data">
            <input type="hidden" id="FILE_NO" name="FILE_NO" value="">
            <table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
                <tbody>
                	<tr>
                        <td colspan="4" style="text-align: right;">
                            <button id="btn_previous" type="button" class="btn btn-default">목록</button>
                            <c:if test="${vo.userID eq user.userID}">
                            <button id="btn_modify" type="button" class="btn btn-default">수정</button>
                            <button id="btn_delete" type="button" class="btn btn-default">삭제</button>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 15%; vertical-align:middle;">글번호</th>
                        <td><input name="bbsID" type="text" value="${vo.bbsID}"
                            class="form-control" style="background-color: white;" readonly /></td>
                        <th style="width: 15%; vertical-align:middle;">작성자</th>
						<td><input type="text" value="${vo.userID}"
                            name="userID" class="form-control" style="background-color: white;" readonly /></td>
                    </tr>
                    <tr>
                        <th style="width: 15%; vertical-align:middle;">제목</th>
                        <td><input type="text" value="${vo.bbsTitle}"
                            name="bbsTitle" class="form-control" style="background-color: #f9f9f9;" readonly /></td>
                        <th style="width: 15%; vertical-align:middle;">작성일자</th>
						<td><input type="text" value="${vo.bbsDate}"
                            name="bbsDate" class="form-control" style="background-color: #f9f9f9;" readonly /></td>
                    </tr>
                    <c:if test="${vo.fileFound >= 1}">
                    <tr>
                        <th style="width: 15%; vertical-align:middle;">첨부파일</th>
                        <td colspan="4" style="vertical-align:middle;">
                        	<div style="border: 1px solid #dbdbdb;">
								<c:forEach var="file" items="${file}">
									<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
								</c:forEach>
							</div>
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td colspan="4"><textarea name="bbsContent" class="form-control" id="bbsContent"
                                style="resize: none; background-color: white; min-height: 200px;" readonly>${vo.bbsContent}</textarea></td>
 
                    </tr>
					</tbody>
            </table>
        </form>
        <div class="container">
        	<br>
	        <div class="row">
				<c:forEach items="${replyList}" var="replyList">
					<div id= "${replyList.rno}">
						<h5>${replyList.userID}</h5>
						<h5>${replyList.content}</h5>
						<h6 style="color:#808080;">
							<fmt:formatDate value="${replyList.regdate}" pattern="yy-MM-dd HH:mm" />
						</h6>
						<c:if test="${user.userID eq replyList.userID}">
							<div>
							  <button type="button" onclick="javascript:updateForm(${replyList.rno}, '${replyList.content}', ${vo.bbsID});"
							  class="btn btn-default">수정</button>
							  <button type="button" 
							  class="btn btn-default">삭제</button>
							</div>
						</c:if>
						<hr>
					</div>
				</c:forEach>
	        </div>
	        <br>
	        <div class="row" style="padding: 20px; border: 1px solid #808080;">
		        <form id="replyForm" name="replyForm" method="post">
					<input type="hidden" id="bbsID" name="bbsID" value="${vo.bbsID}" />
					<input type="text" id="userID" name="userID" value="${user.userID}" readonly />
					<br>
					<div>
						<input type="text" id="content" name="content" 
						style="width:100%; height:50px;" placeholder="댓글을 남겨보세요." autocomplete="off"/>
					</div>
					<div>
						<button type="button" id="replyWriteBtn" class="btn btn-default pull-right">작성</button>
					</div>
				</form>
			</div>
			<br>
			<br>
			<br>
        </div>
    </div>
    <script src="js/bootstrap.js"></script>
</body>
<script type="text/javascript">
    $(document).on('click', '#btn_modify', function(e) {
            $("#viewForm").submit();
    });
    $(document).on('click', '#btn_delete', function(e) {
        
        var bbsID = ${vo.bbsID};
        
        if (confirm("정말 삭제하시겠습니까 ?") == true) {
            $("#viewForm").attr("action", "deleteTest.do?bbsID="+bbsID);
            $("#viewForm").submit();
        } else {
            return;
        }
    });
 
    //이전 클릭 시 testList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'testList.do');
 
    });
    
    $(document).ready(function() {
    	var boardTextarea = $("#bbsContent");

    	if(boardTextarea) {
    		boardTextarea.each(function() {
    			$(this).height(this.scrollHeight);
    		});
    	}
    });
    
    // 파일 다운 클릭
    function fn_fileDown(fileNo){
			$("#FILE_NO").attr("value", fileNo);
			$("#viewForm").attr("action", "fileDown.do");
			$("#viewForm").submit();
	}
    
    // 댓글 작성
    $("#replyWriteBtn").on("click", function(){
    	  $("#replyForm").attr("action", "replyWrite.do");
    	  $("#replyForm").submit();
    	});
    
  //댓글 수정 View
	function updateForm(rno, content, bbsID){
		var htmls = "";
		htmls += '<div class="row" style="padding: 20px; border: 1px solid #808080;">';
		htmls += '<form id="replyUpdateForm" name="replyUpdateForm" method="post">';
		htmls += '<input type="hidden" id="updateRno" name="rno" value="' + rno + '" />';
		htmls += '<input type="hidden" id="updateBbsID" name="bbsID" value="' + bbsID + '" />';
		htmls += '<input type="text" id="updateUserID" name="userID" value="${user.userID}" readonly />';
		htmls += '<br>';
		htmls += '<div>';
		htmls += '<input type="text" id="updateContent" name="content"' ;
		htmls += 'style="width:100%; height:50px;" placeholder="댓글을 남겨보세요." autocomplete="off"/>';
	    htmls += '</div>';
		htmls += '<div>';
		htmls += '<button type="button" onclick="updateReply()" class="btn btn-default">수정</button>';
		htmls += '<button type="button" id="replyCancel" class="btn btn-default">취소</button>';
		htmls += '</div>';
		htmls += '</form>';
		htmls += '</div>';

		$('#' + rno).replaceWith(htmls);
		$('#updateContent').focus();
		$('#updateContent').val(content);
	};
		
	 // 댓글 수정
    function updateReply(){
    	  $("#replyUpdateForm").attr("action", "updateReply.do");
    	  $("#replyUpdateForm").submit();
    	};
</script>
</html>