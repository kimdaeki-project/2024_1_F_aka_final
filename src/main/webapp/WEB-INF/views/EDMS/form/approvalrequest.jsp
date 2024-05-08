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
				 품&nbsp;&nbsp;명
			</td>
			<td class="userTdW">	
				<input type="text" name="edms_Extra_Content">
			</td>
			<td class="userTdG">				
 				사용금액
			</td>
			<td class="userTdW">	
				<input type="text" name="edms_Extra_Number" >
			</td>
		</tr>
		
		
	</tbody>
   </c:if>