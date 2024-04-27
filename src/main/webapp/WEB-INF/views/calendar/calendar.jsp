<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
  	
    <meta charset='utf-8' />
    <title>Calendar</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
      	  expandRows: true,		 /* 크기조절 */
          initialDate: '2024-04-01',		/* 초기시간설정 => 처음보여줄 달력 */
          editable: true,
          selectable: true,
          businessHours: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [							/* 날짜만 적어주면 하루종일 */
            {								
				title: 'All Day Event',
				start: '2024-04-01'
            },
            {
				title: 'Long Event',
				start: '2024-04-07',
				end: '2024-04-10'
            },
            {
				title: 'Date tile',
				start: '2024-04-07T20:00:00'
            }

          ]
        });

        calendar.render();
      });

    </script>
    <style>
    	  #calendar {
		   max-width: 1250px;
		   max-height: 850px;
		   margin: 0 auto;
		 }
    </style>
	<c:import url="../temp/head.jsp"></c:import>
	</head>
	<body>
  		<c:import url="../temp/nav.jsp"></c:import>
  		<c:import url="../temp/side.jsp"></c:import>
  	
  	
  	
    	<div id='calendar'>
    		<span class="d-flex justify-content-end">
   				<button class="mt-3 btn btn-danger" data-bs-toggle="modal" data-bs-target="#addSchedule" style="width:120px;">일정추가</button>
   			</span>
    	</div>	
    
		<!-- Modal -->
		<div class="modal fade" id="addSchedule" tabindex="-1" aria-labelledby="addScheduleLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="addScheduleLabel">일정추가</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="mb-3">
				  <label for="title" class="form-label">일정제목</label>
				  <input type="text" class="form-control" name="title" id="title">
				</div>
				<div class="mb-3">
				  <label for="start_date" class="form-label">시작일</label>
				  <input type="date" class="form-control" name="start_date" id="start_date">
				</div>
				<div class="mb-3">
				  <label for="end_date" class="form-label">종료일</label>
				  <input type="date" class="form-control" name="end_date" id="end_date">
				</div>
				<div class="mb-3">
				  <label for="content" class="form-label">일정내용</label>
				  <textarea class="form-control" name="content" id="content" rows="3"></textarea>
				</div>
				<select class="form-select" aria-label="Default select example">
				  <option value="1">개인일정</option>
				  <option value="2">부서일정</option>
				</select>
				<input>
				<input type="date" name="update_date" id="update_date">
				<input type="text" name="member_id" id="member_id">
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
    
    
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>