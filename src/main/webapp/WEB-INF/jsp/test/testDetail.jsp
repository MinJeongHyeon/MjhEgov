<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring 게시판 웹 사이트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<style type="text/css">
a, a:hover {
	color: #000000;
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
            encType="multiplart/form-data">
            <table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
                <tbody>
                	<tr>
                        <td colspan="2" style="text-align: right;">
                            <button id="btn_previous" type="button" class="btn btn-default">목록</button>
                            <c:if test="${vo.userID eq user.userID}">
                            <button id="btn_modify" type="button" class="btn btn-default">수정</button>
                            <button id="btn_delete" type="button" class="btn btn-default">삭제</button>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">글번호</th>
                        <td colspan="2"><input name="bbsID" type="text" value="${vo.bbsID}"
                            class="form-control" style="background-color: white;" readonly /></td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">제목</th>
                        <td colspan="2"><input type="text" value="${vo.bbsTitle}"
                            name="bbsTitle" class="form-control" style="background-color: white;" readonly /></td>
                    </tr>
                    <tr>
						<th style="width: 20%;">작성자</th>
						<td colspan="2"><input type="text" value="${vo.userID}"
                            name="userID" class="form-control" style="background-color: white;" readonly /></td>
					</tr>
					<tr>
						<th style="width: 20%;">작성일자</th>
						<td colspan="2"><input type="text" value="${vo.bbsDate}"
                            name="bbsDate" class="form-control" style="background-color: white;" readonly /></td>
					</tr>
                    <tr>
                        <th style="width: 20%;">내용</th>
                        <td colspan="2"><textarea name="bbsContent" class="form-control" id="bbsContent"
                                style="resize: none; background-color: white;" readonly>${vo.bbsContent}</textarea></td>
 
                    </tr>
                </tbody>
            </table>
        </form>
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
</script>
</html>