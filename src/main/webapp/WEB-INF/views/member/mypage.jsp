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
		
		
		<div class="bg-black d-flex justify-content-center m-5 py-5">
			<img style="width:150px; height:150px;" class=" z-1 rounded-circle" src="../img/profile.jpg">
		</div>
 	
		<div class="bg-black d-flex justify-content-center m-5 py-5 h-100">
			<label class="d-flex justify-content">아이디</label>
			<input>
			<label>아이디</label><br>
			<input>
			<label>아이디</label>
			<input>
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
