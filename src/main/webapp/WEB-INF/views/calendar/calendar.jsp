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
    <script src='../js/member/dist/index.global.js'></script>
    <script src='../js/member/dist/index.global.min.js'></script>
    <!-- <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.11/index.global.min.js'></script> -->
    
    
    <!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar/index.global.min.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script> -->
	
    <script>


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
		      <form action="/calendar/create" method="POST">
		      <div class="modal-body">
		        <div class="mb-3">
				  <label for="title" class="form-label">일정제목</label>
				  <input type="text" class="form-control" name="title" id="title">
				</div>
				<div class="mb-3">
				  <label for="start_date" class="form-label">시작일</label>
				  <input type="datetime-local" class="form-control" name="start_date" id="start_date">
				</div>
				<div class="mb-3">
				  <label for="end_date" class="form-label">종료일</label>
				  <input type="datetime-local" class="form-control" name="end_date" id="end_date">
				</div>
				<div class="mb-3">
				  <label for="content" class="form-label">일정내용</label>
				  <textarea class="form-control" name="content" id="content" rows="3"></textarea>
				</div>
				<select class="form-select" aria-label="Default select example" name="target_object" id="target_object">
				  <option value="1">개인일정</option>
				  <option value="2">부서일정</option>
				</select>
				<!-- <input type="date" name="update_date" id="update_date" hidden/> -->
				<input type="text" name="member_id" id="member_id" value="${member.member_id}">
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button class="btn btn-primary" onclick='create()'>일정추가</button>
		      </div>
		      </form>
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
    <script type="text/javascript" src="../js/member/calendar.js"></script>
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.11/index.global.min.js"></script> -->
<!--     <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
  </body>
</html>