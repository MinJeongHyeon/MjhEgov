<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 코어 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring 게시판 웹 사이트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>\
<br />
    <h1 class="text-center">게시글 수정</h1>
<br/>
<div class="container">
		<c:if test="${user == null}">
			<script>
				alert("로그인이 필요한 기능입니다.");
				location.href="login.do";
			</script>		
		</c:if>
        <form id="form_test" action="updateTest.do" method="post"
            encType="multipart/form-data">
            <input type="hidden" name="bbsID" value="${update.bbsID}">
            <input type="hidden" name="userID" value="${user.userID}">
            <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
			<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
            
            <table class="table table-bordered">
                <tbody id="tbody">
                    <tr>
                        <th>제목</th>
                        <td><input type="text" placeholder="제목을 입력하세요."
                            name="bbsTitle" class="form-control" limitbyte="100" value="${update.bbsTitle}"/></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea placeholder="내용을 입력하세요 ." name="bbsContent"
                                class="form-control" id="bbsContent" style="height: 200px;" limitbyte="2048">${update.bbsContent}</textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button id="btn_register" type="button" class="btn_register">등록</button>
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                            <button type="button" class="fileAdd_btn">파일추가</button>
                    </tr>
						<c:forEach var="file" items="${file}" varStatus="var">
							<tr><td colspan="2">
								<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
								<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
								<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
								<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
							</td></tr>
						</c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#fileDel", function(){
			$(this).parent().remove();
		})
		
		fn_addFile();
		
		// 이전
		$("#btn_previous").on('click', function() {
	        $(location).attr('href', 'testList.do');
	 
	    });
		
		// 수정
		$("#btn_register").on('click', function() {
			$("#form_test").attr("action", "updateTest.do");
			$("#form_test").attr("method", "post");
			$("#form_test").submit();
		});
	})
   
	
    function fn_addFile(){
		var fileIndex = 1;
		$(".fileAdd_btn").on("click", function(){
			$("#tbody").append("<tr><td colspan='2'><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></td><tr>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}
</script>
</html>