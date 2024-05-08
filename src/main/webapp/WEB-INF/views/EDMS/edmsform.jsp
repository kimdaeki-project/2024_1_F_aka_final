<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 




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

	 <div class="col-6 text-center align-self-center" id="formTitle">
		<c:choose>
			<c:when test="${checkType=='create' and dtype!=4}">
			<div>
				<h1>
					<select id="formType" name="edms_From_No" class="form-select color-dropdown" style="height: auto;" onchange="formChange()">
			                        <option value="1" selected >기안서</option>
			                        <option value="2">품의서</option>                     
                      </select>
                 </h1>
			</div>
						
			</c:when>
			<c:when test="${checkType =='get'}">
				<h1>${edms.EDMS_FORM_NAME}</h1>
			</c:when>
			<c:when test="${checkType=='create' and dtype==4}">
				<h1>${edms.EDMS_FORM_NAME}</h1>
			</c:when>
		
		</c:choose>
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
					<c:choose>
						<c:when test="${list.APRROVAL_RESULT==3}">							
							<div class="applineW" style="position: relative;">						
								<span style="position: absolute;" >${list.USERNAME}</span>														
								<img src="${list.stampVO.stamp_Img}" style="z-index: 1; height: 130%; width: 120%">								
							</div>						
						</c:when>
						<c:when test="${list.APRROVAL_RESULT==5}">							
							<div class="applineW" style="position: relative;">						
								<span style="position: absolute;" >${list.USERNAME}</span>														
								<img src="/img/reject.png" style="z-index: 1; height: 130%; width: 120%">								
							</div>						
						</c:when>
						<c:otherwise>
							<div class="applineW">${list.USERNAME}</div>
						</c:otherwise>
					
					</c:choose>
					
					<div class="applineG">${list.APPROVAL_DATE }</div>
					<input type="hidden" value="${list.APPROVAL_RANK}">
					<c:if test="${list.APPROVAL_RANK==1}">					
						<input type="hidden" name="EDMS_NO" value="${list.EDMS_NO}">
						<input type="hidden" name="APPROVAL_NO" value="${list.APPROVAL_NO}">
					</c:if>
				</div> 
			
			</c:forEach> 
 		</c:if>
		<c:if test="${dtype==4 && not empty appline}">
		
			<c:forEach items="${appline}" var="list">		
				
				<div class="col-auto ps-0 pe-0">
					<div class="applineG">${list.POSITION_NAME}</div>						
					<div class="applineW">${list.USERNAME}</div>				
					<div class="applineG">${list.APPROVAL_DATE }</div>
					<input type="hidden" class="appForm" value="${list.MEMBER_ID}">
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
    <c:if test="${checkType=='create' and dtype!=4}">
	<tbody>
		<tr>
			<td class="userTdG" >				
				문서종류
				
			</td>
			<td class="userTdW" id="munser">				
				기안서
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
				<span>${member.member_id}</span>
				<input type="hidden" name="edms_Creator" value="${member.member_id}">
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
   
   
   
   
   <c:if test="${checkType=='create' and dtype==4}">
	<tbody>
		<tr>
			<td class="userTdG">				
				문서번호  
				<input type="hidden" value=" ${edms.EDMS_STATUS}" name="edms_Status">
			</td>
			<td class="userTdW">	
				<span>${edms.EDMS_NO}</span>
				<input type="hidden" id="edms_No" name="edms_No" value="${edms.EDMS_NO}">
				<input type="hidden" name="edms_From_No" value="${edms.EDMS_FORM_NO}">
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
				<input type="hidden" name="edms_Creator" value="${edms.EDMS_CREATOR}"> 
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
   <c:if test="${checkType=='get'}">
	<tbody>
		<tr>
			<td class="userTdG">				
				문서번호 
			</td>
			<td class="userTdW">	
				<span>${edms.EDMS_NO}</span>
				<input type="hidden" name="edms_No" value="${edms.EDMS_NO}">
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
 
 
<div id="formImport">
</div>
 
<c:if test="${checkType=='get'}">
 <c:if test="${ edms.EDMS_FORM_NO==2}">
 	
 	<c:import url="form/approvalrequest.jsp"></c:import>
 	
 </c:if>
</c:if> 
 
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
					 
					<c:when test="${checkType=='create' and dtype!=4}">
						<input name="edms_Title">						
					</c:when>
					<c:when test="${checkType=='get'}">
						<span>${edms.EDMS_TITLE}</span>	
					</c:when>
					<c:when test="${checkType=='create' and dtype==4}">
						<input name="edms_Title" value="${edms.EDMS_TITLE}">
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
					 
					<c:when test="${checkType=='create'and dtype!=4}">
						 <textarea id="summernote" name="edms_Content">
						 </textarea>
					</c:when>
					<c:when test="${checkType=='get'}">
						${edms.EDMS_CONTENT}
					</c:when>
					<c:when test="${checkType=='create' and dtype==4}">
						<textarea id="summernote" name="edms_Content">
						
						 ${edms.EDMS_CONTENT}
						
						 </textarea>
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
			<c:choose>					 
					<c:when test="${checkType=='create'and dtype!=4}">
										
						<div id="fileUploadList" style="float: left;">						
						</div>
					 <input type="file" id="file" name="file" multiple="multiple">	 
				 	
					</c:when>
					<c:when test="${checkType=='get' and not empty fileVOs}">
						 <div>
							<c:forEach items="${fileVOs}" var="file">
								<a href="/edms/fileDown?edms_Attechfile_No=${file.edms_Attechfile_No}">${file.edms_Attechfile_Ori_Name}</a>
							</c:forEach>
					</div>
					</c:when>
					<c:when test="${checkType=='create' and dtype==4}">
						<div id="fileUploadList" style="float: left;">
						</div>
						 <input type="file" id="file" name="file" multiple="multiple">
				
						
						 <div>
							<c:forEach items="${fileVOs}" var="file">				 		
								<a href="/edms/fileDown?edms_Attechfile_No=${file.edms_Attechfile_No}">${file.edms_Attechfile_Ori_Name}</a>
								<input type="hidden" value="${file.edms_Attechfile_No}"/>					
							</c:forEach>
						</div>
					</c:when>
					
					
					
					
				</c:choose> 
				
				
				 
				 
			</td>
		</tr>
	
	</tbody>

</table>

<c:choose>
<c:when test="${document =='recive'}">
	<colgroup> 
		<col width="116"> 
		<col width="660"> 
	</colgroup> 
		
		
		
		<div class=" col-auto">		
		
		<c:forEach items="${appline}" var="list">	
	
			<c:if test="${not empty list.APRROVAL_COMENT }">			
				<div>
					<div class="userTdG" style="height: 30px;">	
						<P> ${list.USERNAME} &nbsp;&nbsp;  ${list.POSITION_NAME}</P>
					</div>
					<div class="userTdW" style="height: auto;" name="APRROVAL_COMENT">	
	
						<textarea style="width:100%;">
								${list.APRROVAL_COMENT}
	
						</textarea>
						
					</div>
				</div>
			</c:if>
		</c:forEach> 		
		
			<div class="col-12" style="background: rgb(221, 221, 221); zz
				padding: 5px; 
				border: 1px solid black; 
				height: 25px; 
				text-align: center; 
				color: rgb(0, 0, 0); 
				font-size: 12px; 
				font-weight: bold; 
				vertical-align: middle">
				추&nbsp;&nbsp;&nbsp;&nbsp;신
			</div>			
	
			
			<div class="userTdW" style="height: auto;">
				<textarea  id="summernote"  name="APRROVAL_COMENT">
					
					
				</textarea>
				
			</div>			
		</div>		
		
		
	</c:when>


<c:when test="${document !='recive' && checkComent==1}">
		
				<div class="userTdG"  style="height: 30px;">	
					<p>추신</p>
				</div>
<c:forEach items="${appline}" var="list">	
	
		<c:if test="${not empty list.APRROVAL_COMENT }">			
			<div>
				<div class="userTdG" style="height: 30px;">	
					<P> ${list.USERNAME} &nbsp;&nbsp;  ${list.POSITION_NAME}</P>
				</div>
				<div class="userTdW" style="height: auto;" name="APRROVAL_COMENT">	

					<textarea style="width:100%;">
							${list.APRROVAL_COMENT}

					</textarea>
					
				</div>
			</div>
		</c:if>
		
		


</c:forEach> 
</c:when>
</c:choose>


<br>
<c:if test="${document == 'recive'}">
	<div style="float: right;">
		<button type="button" class="btn btn-success" id="submitEdms"> 결재</button>
		<button type="button" class="btn btn-warning" id="rejectEdms">반려</button>
	</div>
	<input type="hidden" name="edms_Creator" value="${member.member_id}">
	<input type="hidden" name="MEMBER_ID" value="${edms.EDMS_CREATOR}" >
	<script>
		const submitEdms = document.getElementById("submitEdms");
		const rejectEdms = document.getElementById("rejectEdms");


		submitEdms.addEventListener("click",function(){

			if(confirm("결재하시겠습니까?")){
				
				submitForm(1);
			}

		})

		rejectEdms.addEventListener("click", function(){

			if(confirm("반려하시겠습니까??")){
				
				submitForm(5);
			}else{
				alert("취소하니다.")
			}

		})

		// check
		// tipo = 1 승인 5 = 반려
	function submitForm(tipo){		

			let formData = new FormData(formelem);
			formData.append('tipo', tipo);
			// formData.append('check', check);
			//배열생성후 formdata에 값 추가
		
			for(const key of formData.keys()){

				console.log(key);
			}

			fetch("submit",{
				method: "POST",						
				body: formData				
				}).then(response => response.json())
				.then(data=>{
					console.log(data.path)
					if(data.result==1 || data.result==3){
						alert(data.msg);
						window.location.href=data.path;
						
					}else if(data.result==5){
						
						alert(data.msg);
						window.location.href=data.path;
						
					}
					else{
						
						alert("실패하였습니다.")
					}
					
				})	   


	}


	</script>

</c:if>

<c:if test="${checkType == 'create'}">
	<div style="float: right;">
	<button type="button" class="btn btn-success" id="applyBtn">제출</button>
	<button type="button" class="btn btn-warning" id="tempApplyBtn">임시저장</button>
	<c:if test="${dtype==4}">
	
	<button type="button" class="btn btn-danger" id="deleteEdms">삭제</button>
	<script type="text/javascript">
	//삭제
	deleteEdms.addEventListener('click', function(){
		
		if(confirm('삭제하시겠습니까??')){
		let formData = new FormData(formelem);
		fetch('deleteTempEdms',{
			
			 method: "POST",						
	            body: formData				
	            }).then(response => response.json())
	            .then(data=>{
	                console.log(data.path)
	                if(data.result==1){
	                    alert(data.msg);
	                    window.location.href=data.path;
	                    
	                }else{
	                    
	                    alert("실패하였습니다.")
	                }
	                
	            })					
			
		}
		})</script>
	</c:if>
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
				placeholder: '내용을 입력하세요',
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







