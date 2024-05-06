<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE html>

<head>
	<link rel="stylesheet" href="/assets/vendor/fonts/boxicons.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> 	
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	

</head>


 <c:import url="../temp/head.jsp"></c:import>
 <c:import url="/js/edms/form.css"></c:import>



<c:if test="${checkType=='get'}">

	<style>

		input{
			display: none;
		}
		
	</style>

</c:if>
    
	


<form id="formelem">


<div style="position: absolute; left: 30%">

<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">

<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
  
<div class="row">

	 <div class="col-6 text-center align-self-center">
		<h1>기안서</h1>
	</div>
	
	<div class="col-6">
	 
	   <c:if test="${checkType=='create'}">
	   <button class="addLineBtn" type="button" data-bs-toggle="modal" data-bs-target="#largeModal" data-bs-whatever="@mdo"  id="addLineBtn">
 				결제선 <br> 추가 
 		</button>
	   </c:if>
 

		<div id="appLine" class="appTable" style=" float: right;">			
		
		<c:if test="${checkType =='get' && not empty appline}">
		
			<c:forEach items="${appline}" var="list">		
				
				<div class="col-auto ps-0 pe-0">
					<div class="applineG">${list.POSITION_NAME}</div>
					<div class="applineW">${list.USERNAME}</div>
					<div class="applineG">${list.APPROVAL_DATE }</div>
				</div> 
			
			</c:forEach> 
 		</c:if>
			
		</div>
		
		
	</div>
</div>





				
<table class="userTable" ><!-- User --> 
      <colgroup> 
       <col width="60"> 
       <col width="140">       
       <col width="60"> 
       <col width="140"> 
      </colgroup> 
    <c:if test="${checkType=='create'}">
	<tbody>
		<tr>
			<td class="userTdG">				
				문서종류 
			</td>
			<td class="userTdW">	
				<input type="text" name="edms_From_No" value="1">
			</td>
			<td class="userTdG">				
 				기&nbsp;안&nbsp;일
			</td>
			<td class="userTdW">	
				<input type="date" id="today"  readonly >
			</td>
		</tr>
		<tr style="height: 32px;">
			<td class="userTdG">
				
 				작&nbsp;성&nbsp;자
			</td>
			<td class="userTdW">	
				<!-- <input type="hidden" name="edmsCreator" value="${member.username}"> -->
				<span>${member.username}</span>
			</td>
				<td class="userTdG">
				사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번
			</td>
			<td class="userTdW">	
				<input type="hidden" name="edms_Creator" value="${member.member_id}">
				<span>${member.member_id}</span>
			</td>
		</tr>
		<tr>
			<td class="userTdG">	
				부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
			</td>
			<td class="userTdW">
				<span>${deptName.DEPARTMENT_NAME}</span>
			</td>
			<td class="userTdG">
				직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급
			</td>
			<td class="userTdW">	
				<input type="hidden" name="edms_Creator_Position" value="${deptName.POSITION_NAME}">
				<span>${deptName.POSITION_NAME}</span>
			</td>
		</tr>		
	</tbody>
   </c:if>
   
   
   
   
   <c:if test="${checkType=='get'}">
	<tbody>
		<tr>
			<td class="userTdG">				
				문서종류 
			</td>
			<td class="userTdW">	
				<input type="text" name="edms_From_No" value="1">
			</td>
			<td class="userTdG">				
 				기&nbsp;안&nbsp;일
			</td>
			<td class="userTdW">	
				<span>${edms.EDMS_CREATE_DATE}</span>
			</td>
		</tr>
		<tr style="height: 32px;">
			<td class="userTdG">
				
 				작&nbsp;성&nbsp;자
			</td>
			<td class="userTdW">	
				<!-- <input type="hidden" name="edmsCreator" value="${member.username}"> -->
				<span>${edms.USERNAME}</span>
			</td>
				<td class="userTdG">
				사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번
			</td>
			<td class="userTdW">					
				<span>${edms.EDMS_CREATOR}</span>
			</td>
		</tr>
		<tr>
			<td class="userTdG">	
				부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
			</td>
			<td class="userTdW">
				<span>${edms.DEPARTMENT_NAME}</span>
			</td>
			<td class="userTdG">
				직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급
			</td>
			<td class="userTdW">					
				<span>${edms.EDMS_CREATOR_POSITION}</span>
			</td>
		</tr>		
	</tbody>
   </c:if>      
</table>
 
 
<table class="contentsTable" >
	<colgroup> 
   <col width="116"> 
   <col width="660"> 
  </colgroup> 
  
	<tbody>
		<!-- <tr>
			<td class="userTdG">	
				참&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조
			</td>
			<td class="userTdW">		
				<input>
			</td>
		</tr> -->
		<tr>
			<td class="userTdG">		
				제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
			</td>
			<td class="userTdW">
				<c:choose>
					 
					<c:when test="${checkType=='create'}">
						<input name="edms_Title">						
					</c:when>
					<c:when test="${checkType=='get'}">
						<span>${edms.EDMS_TITLE}</span>	
					</c:when>
				</c:choose> 
				
			</td>
		</tr>
		<tr>
			<td class="userTdG" colspan="2">
				상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용
			</td>
		</tr>
		<tr>
			<td class="userTdW" colspan="2">			
				<span  style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
				<c:choose>
					 
					<c:when test="${checkType=='create'}">
						 <textarea id="summernote" name="edms_Content"></textarea>
					</c:when>
					<c:when test="${checkType=='get'}">
						${edms.EDMS_CONTENT}
					</c:when>
				</c:choose> 
				</span> 
			<br>			
			
			    
			</td>
		</tr>
	</tbody>
</table>
</table>
			    

<table class="contentsTable" >
	<colgroup> 
	   <col width="116"> 
	   <col width="660"> 
	 </colgroup> 
  
	<tbody>
		<tr>
			<td class="userTdG" style="height: auto;">	
				첨&nbsp;&nbsp;부&nbsp;&nbsp;파&nbsp;&nbsp;일
			</td>
			<td class="userTdW" style="height: auto;">		
				<div id="fileUploadList" style="float: left;">
				</div>
				 <input type="file" id="file" name="file" multiple="multiple">
			</td>
		</tr>
	
	</tbody>

</table>

<br>
<c:if test="${document == 'recive'}">
	<div style="float: right;">
		<button type="button" class="btn btn-success" id="applyEdms"> 결재</button>
		<button type="button" class="btn btn-warning" id="rejectEdms">반려</button>
	</div>
	<script>
		const applyEdms = document.getElementById("applyEdms");
		const rejectEdms = document.getElementById("rejectEdms");

		applyEdms.addEventListener("click",function(){

				alert("ㅇㅇ")		

		})
		rejectEdms.addEventListener("click", function(){

				alert("리잭")

		})



	</script>

</c:if>

<c:if test="${checkType == 'create'}">
	<div style="float: right;">
	<button type="button" class="btn btn-success" id="applyBtn">제출</button>
	<button type="button" class="btn btn-warning" id="tempApplyBtn">임시저장</button>
	</div>
</c:if>

</span></span>
<p style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p>

</div>

</form>




<!-- modal  -->
	<div class="modal fade" id="largeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
		<div class="modal-header">
			<h5 class="modal-title" id="Modal">New message</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body" style="display: flex;">			
 			
			<div id="people-box" style="overflow:scroll;">
				<div style="display: flex;">
					<input id="schName" value=""><button type="button" class="btn btn-primary" onclick="fSch()">검색</button>
				</div>
			  <div id="jstree" style="height: 100vh;">				
			  </div>
		    </div>
		    
			<div id="add-remove">
				<span id="first-arrow">
				    <button type="button" style="width: 30px; height: 30px; background-color:white; border:0;" id="applyOn">
			  			<img src="/img/arrow/right.svg" height="30px" width="30px">
					</button>
				</span>
			
				<span id="second-arrow">
						<button type="button" style="width: 30px; height: 30px; background-color:white; border:0;" id="delBtn">
						    <img src="/img/arrow/left.svg" height="30px" width="30px" >
						</button>
				</span>			
				
			</div>
		    
		    <div id="line-refer-box">
		    		<div id="line-box">
		    			<p id="line-box-text">결재선</p>
						<div id="applyList">

						</div>

		    		</div>		    		
		    		
		    </div>
		</div>
		
		<div class="modal-footer">
			<button id="addBtn"  type="button" class="btn btn-primary">추가 및 변경</button>
			<button type="button" id="closeBtn" class="btn btn-secondary" data-bs-dismiss="modal">종료</button>
		</div>
		</div>
	</div>
	</div>




<script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
<!-- include libraries(jQuery, bootstrap) -->
<script src="/assets/vendor/js/bootstrap.js"></script>
<script src="/assets/vendor/libs/jquery/jquery.js"></script>   

<c:if test="${checkType =='create'}">

 <!-- JSTREE -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="/js/edms/form.js"></script>

</c:if>




