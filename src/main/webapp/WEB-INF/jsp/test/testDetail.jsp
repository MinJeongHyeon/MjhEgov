<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <br />
    <h1 class="text-center">게시글 보기</h1>
    <br />
    <br />
    <div class="container">
    <div class="row">
        <form action="updateTest.do" id="viewForm" method="post"
            encType="multiplart/form-data">
            <table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
                <tbody>
                    <tr>
                        <th style="width: 20%;">글번호</th>
                        <td colspan="2"><input name="bbsID" type="text" value="${vo.bbsID}"
                            class="form-control" readonly /></td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">제목</th>
                        <td colspan="2"><input type="text" value="${vo.bbsTitle}"
                            name="bbsTitle" class="form-control" /></td>
                    </tr>
                    <tr>
						<th style="width: 20%;">작성자</th>
						<td colspan="2"><input type="text" value="${vo.userID}"
                            name="userID" class="form-control" /></td>
					</tr>
					<tr>
						<th style="width: 20%;">작성일자</th>
						<td colspan="2"><input type="text" value="${vo.bbsDate}"
                            name="bbsDate" class="form-control" /></td>
					</tr>
                    <tr>
                        <th style="width: 20%;">내용</th>
                        <td colspan="2"><textarea name="bbsContent" class="form-control"
                                style="height: 200px;">${vo.bbsContent}</textarea></td>
 
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right;">
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                            <button id="btn_modify" type="button" class="btn_register">수정</button>
                            <button id="btn_delete" type="button" class="btn_delete">삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(document).on('click', '#btn_modify', function(e) {
        if (confirm("정말 수정하시겠습니까 ?") == true) {
            $("#viewForm").submit();
        } else {
            return;
        }
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
</script>
</html>