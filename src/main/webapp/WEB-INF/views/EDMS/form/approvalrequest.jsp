<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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