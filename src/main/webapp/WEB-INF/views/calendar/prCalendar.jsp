<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
    <title>Personal Calendar</title>
    <style>
    	  #calendar {
		   max-width: 1250px;
		   max-height: 700px;
		   margin: 0px auto;
		 }
    </style>
    <meta name="description" content="" />
    <script src="/assets/vendor/js/helpers.js"></script>
    <script src="/assets/js/config.js"></script>
   <!--link import  -->
    <c:import url="../temp/head.jsp"></c:import>

  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
		<c:import url="../temp/side.jsp"></c:import>
      
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <c:import url="../temp/nav.jsp"></c:import>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
             <div class="container-xxl flex-grow-1 container-p-y">
				<div class="card ">
                <h5 class="card-header">개인 캘린더</h5>
                
                	<div class="col-md-12">
    				<div id='calendar' class="col-md-11 mx-auto">
                	</div>

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
				<input type="text" name="member_id" id="member_id" value="${member.member_id}" hidden>
		      </div>
		      <div class="modal-footer mx-3">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button class="btn btn-primary" onclick='create()'>일정추가</button>
		      </div>
		      
		      </form>
		    </div>
		  </div>
		</div>


			
              </div>
            <!-- / Content -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <div class="buy-now">
      <a
        href="https://github.com/dirokim/aka_final.git"
        target="_blank"
        class="btn btn-primary btn-buy-now"
        >git-hub</a
      >
    </div>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="/assets/vendor/libs/popper/popper.js"></script>
    <script src="/assets/vendor/js/bootstrap.js"></script>
    <script src="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
     <script type="text/javascript" src="../js/member/prCalendar.js"></script>
    
    <script src='https://fastly.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.11/index.global.min.js'></script>
  </body>
</html>