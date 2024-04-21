<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
		
		<div>마이페이지</div>
		<div class="bg-black d-flex justify-content-center mt-5 pt-5">
			<img style="width:150px; height:150px;" class=" z-1 rounded-circle" src="../img/profile.jpg">
		
		</div>
		<span class="fs-4 py-2 bg-black d-flex justify-content-center">가나다</span>			
		
 	
		<div class="bg-black d-flex justify-content-center m-5 py-5 h-100">
			<form class=" bg-white p-3">

			  <div class="d-flex justify-content-center mx-3 mb-4">
			    <label for="exampleInputPassword1" class="mx-3 form-label">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1">
			    <label for="exampleInputPassword1" class="mx-3 form-label">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1">
			  </div>

			  <div class="mb-3 d-flex justify-content-center mx-3">
			  	<label for="exampleInputPassword1" class="mx-3 form-label">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1">
			    	
			  	<label for="exampleInputPassword1" class="mx-3 form-label">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1">
			  </div>

				<div class="d-flex justify-content-end">
			  		<button type="submit" class="btn btn-primary">Submit</button>
			  	</div>
			</form>
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
