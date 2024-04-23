<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
		<c:import url="../temp/head.jsp"></c:import>
	<body>
		<c:import url="../temp/nav.jsp"></c:import>
		<c:import url="../temp/side.jsp"></c:import>
		
		
		 <div class="container bg-white w-50 mt-5 py-2 rounded-2">
			<div class=" d-flex justify-content-center mt-2 p-2">
				<img style="width:150px; height:150px;" class="rounded-circle" src="../img/profile.jpg">
			</div>
			<div class="d-flex justify-content-center">
				<span class="fs-4 py-2 d-flex justify-content-center">가나다 직급</span>
			</div>
			<div class="d-flex justify-content-center pb-3">
				<button class="btn btn-primary">출근</button>
			</div>
		</div>
 		
		<div class="d-flex justify-content-center my-5">
<%-- 			<form class="bg-white p-5 rounded-3" action="POST"> --%>
			<form:form modelAttribute="member"  class="bg-white p-5 rounded-3">
				<form:input path="phone" id="phone"/>
				<form:input path="user_id" id="user_id"/>
				<form:input path="password" id="password"/>
				
<!-- 			   <div class="d-flex justify-content-center mx-3 mb-5">
		    	<label for="exampleInputPassword1" class="mt-2 form-label fw-semibold fs-6" style="width:130px;">부서명</label>
		    	<input type="text" class="form-control mx-2" id="exampleInputPassword1" value="부서명" disabled>
			    
			    <label for="hire_date" class="mt-2 ms-5 form-label fw-semibold fs-6" style="width:140px;">입사일</label>
			    <input type="text" class="form-control mx-2" id="hire_date" disabled>
			  </div>
	
			  <div class="d-flex justify-content-center mx-3 mb-5">
		    	<label for="email" class="mt-2 form-label fw-semibold fs-6" style="width:140px;">이메일</label>
		    	<input type="text" class="form-control mx-2" id="email">
			    
			    <label for="phone" class="mt-2 ms-5 form-label fw-semibold fs-6" style="width:170px">전화번호</label>
			    <input type="text" class="form-control mx-2" id="phone">
			  </div>
			  
  			  <div class="d-flex justify-content-center mx-3 mb-5 w-50">
		    	<label for="password" class="mt-2 form-label fw-semibold fs-6" style="width:90px">비밀번호</label><br>
		    	<input type="password" class="form-control" id="password">
			    
			    <label for="exampleInputPassword1" class="mt-2 ms-5 form-label">Password</label>
			    <input type="password" class="form-control mx-2" id="exampleInputPassword1">
			  </div>

				<div class="d-flex justify-content-end">
			  		<button type="submit" class="btn btn-danger">수정</button>
			  	</div> -->
			</form:form>
			
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
