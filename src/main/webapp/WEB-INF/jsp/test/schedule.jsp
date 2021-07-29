<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "egovframework.example.test.vo.ScheduleDTO" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>

<%
	List<ScheduleDTO> list = (ArrayList<ScheduleDTO>)request.getAttribute("showSchedule");
%>
<!DOCTYPE html>
<html>
<head>
<title>Spring 게시판 웹 사이트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<link href='packages/timegrid/main.css' rel='stylesheet' />
<link href='packages/list/main.css' rel='stylesheet' />
<link href="css/schedule.css" rel="stylesheet" />	
<script src="js/schedule.js?v=1" type="text/javascript"></script>
<script src='packages/core/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script src='packages/timegrid/main.js'></script>
<script src='packages/list/main.js'></script>
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	 
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      locale : "ko",
      //defaultDate: "2019-08-22",
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
<% 
  	  for (int i = 0; i < list.size(); i++) {
  	  	ScheduleDTO dto = (ScheduleDTO)list.get(i);
%>	
  	  {
  	   title : '<%= dto.getSubject() %>',
  	   start : '<%= dto.getStartDate() %>',
  	   end : '<%= dto.getEndDate() %>'
  	   },
<%
	}
%>
		{
		   title : 'defult',
		   start : "2021-01-01",
		   end : "2021-01-01"
		  }
      ]
    });

    calendar.render();
});
</script>
<style>

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.add-button {
	top: 1px;
	right: 230px;
	background: #2C3E50;
	border: 0;
	color: white;
	height: 35px;
	border-radius: 3px;
	width: 157px;
}
</style>
</head>
<body>

	<jsp:include page="top.jsp" flush="false"/>
	    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header" style="padding: 0 0 10px 20px;">
            		스케줄러
            </h3>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <div class="panel-body">
              <!-- schedule start -->
                 <div id='calendar' style="position : relative;">
                 		<div>
                 			<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
                 		</div>
                 </div>

              </div>
            </section>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                	일정 목록
              </header>
              <div class="panel-body">
                <table>
<%
	for(int i = 0; i < list.size(); i++) {
		ScheduleDTO dto = (ScheduleDTO)list.get(i);
%>
                    <tr class="form-group">
                      <td class="control-label col-lg-2">
                      		<%= dto.getSubject() %> 
                      </td>
                      <td class="col-lg-7">
                       	<label><%= dto.getMemo() %></label>
                      </td>
<%
	if (dto.getStartDate().equals(dto.getEndDate())) {
%>
						<td class="col-lg-2">
                        <%= dto.getStartDate() %>
                     </td>
<%
	} else{ 
%>
						<td class="col-lg-2">
                        <%= dto.getStartDate() %> ~ <%= dto.getEndDate() %>
                     </td>
<%
		}
%>    
                    </tr>
<%
	}
%>                   
                </table>
              </div>
            </section>
          </div>
        </div>
        <!-- page end-->
      </section>
    </section>
    <!--main content end-->
	<script src="js/bootstrap.js"></script>
</body>
</html>
