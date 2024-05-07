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
				<img style="width:8rem; height:8rem;" class="rounded-circle" src="../img/profile.jpg">
			</div>
<!-- 			<div class="my-3 mx-auto" style="width:5.8rem;">
			  <input class="form-control"  type="file" id="formFile" accept="image/jpg, image/jpeg, image/png"/>
			</div> -->
			<!-- <input type="file" class="btn btn-primary pb-1 mx-auto d-flex" style="width:7rem;">사진변경</input> -->
			<div class="d-flex justify-content-center">
				<span class="fs-4 py-2 d-flex justify-content-center">${member.username}</span>&nbsp;
				<c:if test="${member.position_id == 1}">
					<span class="fs-4 py-2 d-flex justify-content-center">사원</span>
				</c:if>
				<c:if test="${member.position_id == 2}">
					<span class="fs-4 py-2 d-flex justify-content-center">관리자</span>
				</c:if>
				<c:if test="${member.position_id == 3}">
					<span class="fs-4 py-2 d-flex justify-content-center"></span>
				</c:if>
				<c:if test="${member.position_id == 4}">
					<span class="fs-4 py-2 d-flex justify-content-center"></span>
				</c:if>
				<c:if test="${member.position_id == 5}">
					<span class="fs-4 py-2 d-flex justify-content-center"></span>
				</c:if>
			</div>
			<div class="d-flex justify-content-center pb-3">
				<!-- 출근/퇴근 시간 -->
			</div>
			<div class="d-flex justify-content-center pb-3">
				<span>
					<c:if test="${schedule.start_date ne null}">
						출근 : ${schedule.start_date}<br>
					</c:if>
					<c:if test="${schedule.end_date ne null}">
						퇴근 : ${schedule.end_date} 
					</c:if>
					
					<%-- <br><fmt:parseDate value="${schedule.end_date}" pattern="HH:mm:ss"></fmt:parseDate> --%>
				</span>
			</div>
			<div class="d-flex justify-content-center pb-3">
				<!-- 숨기기 class="visually-hidden" -->
				<form action="/member/mypage/schedule" method="POST">
					<input type="text" id="schedule_id" name="schedule_id" value="${schedule.schedule_id}" hidden>
					<input type="text" id="member_id" name="member_id" value="${member.member_id}" hidden>
					<c:if test="${schedule.start_date eq null}">	
						<button id="check" class="btn btn-primary">출근</button>
					</c:if>
				</form>
				<form action="/member/mypage/scheduleout" method="POST">
					<input type="text" id="schedule_id" name="schedule_id" value="${schedule.schedule_id}" hidden>
					<input type="text" id="member_id" name="member_id" value="${member.member_id}" hidden>
					<c:if test="${schedule.end_date eq null and schedule.start_date ne null}">
						<button id="checkout" class="btn btn-danger" >퇴근</button>
					</c:if>
				</form>
			</div>
		</div>
 		
		<div class="d-flex justify-content-center my-5">
			<form:form modelAttribute="member" id="updateMypage" class="bg-white p-5 rounded-3">
			<%-- <form class="bg-white p-5 rounded-3" action="POST"> --%>
				<input type="text" id="member_id" name="member_id" value=${member.member_id} hidden>
				<input type="text" id="user_id" name="user_id" value=${member.user_id} hidden>
			   <div class="d-flex justify-content-center mx-3 mb-5">
		    	<label for="exampleInputPassword1" class="mt-2 form-label fw-semibold fs-6" style="width:130px;">부서명</label>
		    	<input type="text" class="form-control mx-2" id="exampleInputPassword1" value="부서명" disabled>
			    
			    <label for="hire_date" class="mt-2 ms-5 form-label fw-semibold fs-6" style="width:140px;">입사일</label>
			    <input type="text" class="form-control mx-2" id="hire_date" value="${member.hire_date}" disabled>
			  </div>
	
			  <div class="d-flex justify-content-center mx-3 mb-5">
		    	<label for="email" class="mt-2 form-label fw-semibold fs-6" style="width:140px;">이메일</label>
		    	<form:input path="email" cssClass="form-control mx-2" name="email" id="email"/>
			    
			    <label for="phone" class="mt-2 ms-5 form-label fw-semibold fs-6" style="width:170px">전화번호</label>
			    <form:input path="phone" cssClass="form-control mx-2" name="phone" id="phone"/>
			  </div>
			  
  			  <div class="d-flex justify-content-center mx-3 mb-5 w-50">
		    	<label for="password" class="mt-2 form-label fw-semibold fs-6" style="width:90px">비밀번호</label><br>
		    	<!-- password 보이도록 --><!-- showPassword="true" -->
		    	<input type="password" name="password" class="form-control" id="password"/>
			    <input type="password" name="passwordCheck" class="form-control" value=${member.password} id="passwordCheck" hidden>
			    <!-- <label for="exampleInputPassword1" class="mt-2 ms-5 form-label">Password</label>
			    <input type="password" class="form-control mx-2" id="exampleInputPassword1"> -->
			  </div>

				<div class="d-flex justify-content-end">
			  		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
			  	</div>
			  	<%-- </form> --%>
			</form:form>
			<div>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">확인</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<span>정말 수정하시겠습니까?</span>
				      </div>
				      <div class="modal-footer">
				        <button type="button" id="updateBtn" class="btn btn-primary" onclick="update()">수정</button>
				        <button type="button" id="modalClose" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				      </div>
				    </div>
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
	    
	    <script type="text/javascript" src="../js/member/mypage.js"></script>
	</body>
</html>
