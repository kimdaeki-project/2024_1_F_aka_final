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




    
	

<style>

.display-flex {
	display: flex;
}


#department-box {
	height: 430px;
	width: 200px;
	border: 1px solid #D9D9D9;
	margin-right: 20px;
}

#department-box>button {
	justify-content: center;
	background-color: white;
}

/*--main-color-lt:#BDDFFF;  밝은 하늘색 버튼 
  --main-color-bl:#96C1E8;  하늘색 버튼 
  --main-color-dk:#5F90CB;  어두운 하늘색 버튼 */
#department-box>button:hover {
	color: #96C1E8;
}

#people-box {
	height: 430px;
	width: 350px;
	border: 1px solid #D9D9D9;
}


/*	        .modalBox button {
          display: block;
          width: 80px;
          margin: 0 auto;
        }
*/


#first-arrow,
#second-arrow,
#three-arrow,
#four-arrow {
	height: 10px;
	width: 10px;
	background-color: white;
	margin-right: 30px;
	margin-left: 10px;
}

#first-arrow {
	margin-top: 60px;
	margin-bottom: 30px;
}

#second-arrow {
	margin-bottom: 170px;
}

#three-arrow {
	margin-bottom: 30px;
}

#line-box {
	height: 200px;
	width: 350px;
	border: 1px solid #D9D9D9;
	margin-bottom: 30px;
}

#refer-box {
	height: 200px;
	width: 350px;
	border: 1px solid #D9D9D9;
}

#add-remove {
	display: flex;
	flex-direction: column;
	vertical-align: middle;
}

#add-remove button {
	padding: 0px;
}


#line-box-text {
	/* 결재선 글씨 */
	margin: 10px;
	font-weight: bold;
	font-size: 20px;
}

#refer-box-text {
	/* 참조선 글씨 */
	margin: 10px;
	font-weight: bold;
	font-size: 20px;
}

#close-button {
	margin-top: 20px;
	margin-left: 750px;
	width: 100px;
	height: 40px;
	background-color: #D9D9D9;
}

#regist-button {
	margin-top: 20px;
	margin-left: 10px;
	width: 100px;
	height: 40px;

}


#people-box {
	font-size: 15px;
}


#approveAssign{
	margin-left: 30px;
}

#fileClickId{
	border: 1px solid  #D9D9D9;
	background-color: white;
}

#fileClickId:hover{
	color:  #D9D9D9;
}

#cStyle{
	width: 500px;
	line-height: 100px;
	font-size: 30px;
	text-align: center;
	color: green;
}

#rStyle{
	width: 500px;
	line-height: 100px;
	font-size: 30px;
	text-align: center;
	color: red;
}

#wStyle{
	width: 500px;
	line-height: 100px;
	font-size: 30px;
	text-align: center;
	color: var(--main-color-lt);
}

#pStyle{
	width: 500px;
	line-height: 100px;
	font-size: 30px;
	text-align: center;
	color: aqua;
}

#pencil{
	width: 30px;
	height: 30px;
	margin-left: 630px;
}

#pencilFont{
	font-size: 15px;
	
}


</style>


<form id="formelem">


<div style="position: absolute; left: 30%">

<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">

<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
  
<div class="row">

	 <div class="col-6 text-center align-self-center">
		<h1>기안서</h1>
	</div>
	
	<div class="col-6">
	 
	
	   <button class="addLineBtn" type="button" data-bs-toggle="modal" data-bs-target="#largeModal" data-bs-whatever="@mdo"  id="addLineBtn">
 				결제선 <br> 추가 
 		</button>
 

		<div id="appLine" class="appTable" style=" float: right;">
			
			
			<!-- <div class="col-auto ps-0 pe-0">
				<div class="applineG">직급</div>
				<div class="applineW">1</div>
				<div class="applineG">날짜</div>
			</div>			
			 <div class="col-auto ps-0 pe-0">
				<div class="applineG">직급</div>
				<div class="applineW">2</div>
				<div class="applineG">날짜</div>
			</div>			
			 <div class="col-auto ps-0 pe-0">
				<div class="applineG">직급</div>
				<div class="applineW">3</div>
				<div class="applineG">날짜</div>
			</div>			 -->
		
		 
			
		<%-- 	<c:set var="listLength" value="${fn:length(list)}" />
			<c:forEach items="${list}" var="list" begin="0" end="${listLength -1}">		
				
				<div class="col-auto ps-0 pe-0">
					<div class="applineG">${list.POSITION_NAME}</div>
					<div class="applineW">${list.USERNAME}</div>
					<div class="applineG"></div>
				</div> 
			
			</c:forEach> --%>
 			
			
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
      
	<tbody>
		<tr>
			<td class="userTdG">				
				문서종류 
			</td>
			<td class="userTdW">	
				<input type="text" name="edmsFromNo" value="1">
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
				<input type="hidden" name="edmsCreator" value="${member.member_id}">
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
				<input type="hidden" name="edmsCreatorPosition" value="${deptName.POSITION_NAME}">
				<span>${deptName.POSITION_NAME}</span>
			</td>
		</tr>		
	</tbody>
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
				<input name="edmsTitle">
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
				 <textarea id="summernote" name="edmsContent"></textarea>
			
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
<div style="float: right;">
<button type="submit" class="btn btn-success" id="applyBtn">제출</button>
<button type="button" class="btn btn-warning" id="tempApplyBtn">임시저장</button>
</div>


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
 <!-- JSTREE -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>


<script>
	
	const addLineBtn = document.getElementById("addLineBtn"); //모달 여는 버튼
	const addBtn = document.getElementById("addBtn"); //모달 확인버튼
	const myModal = document.getElementById('myModal');
	const largeModal = new bootstrap.Modal(document.getElementById('largeModal'));
	const myInput = document.getElementById('myInput');
	const applyBtn = document.getElementById('applyBtn');
	const formelem = document.getElementById('formelem');	
	const applyList = document.getElementById('applyList');
	const applyOn = document.getElementById('applyOn');
	const closeBtn = document.getElementById('closeBtn');
	const delBtn = document.getElementById('delBtn');//결제선에서 제거하는 버튼
	const tempApplyBtn = document.getElementById('tempApplyBtn');
	let today = document.getElementById('today');
	let appLine = document.getElementById('appLine');
	//모달 불러오는 함수

	// addLineBtn.addEventListener('click', e=>{
	// 	console.log("1qewqeq");
	// 	fSch();
		
	// })
	
	today.valueAsDate = new Date();

	addLineBtn.addEventListener('shown.bs.modal',function(){		
		myInput.focus()				
	});
	
	//모달 확인 버튼
	addBtn.addEventListener('click',function(){
		
		//결제선 DIV 생성
		addApplyLine(appLine);

	})
	




	//파일 업로드
	
	// const dataTranster = new DataTransfer()
	
	
	
	// let files= [];
	
	// inputFile.onchange=()=>{			
	// 	// files.push(inputFile.files); 
	// 	// fileUploadList.innerText =+ files[0].name; 
			
	// 	Array.from(files)
	//     .filter(file => file.lastModified != removeTargetId)
	//     .forEach(file => {
	//         dataTranster.items.add(file);
	//     });

	// 	document.querySelector('#file-input').files = dataTranster.files;
	// 	console.log( dataTranster.files);
		
	// }
		
	
	//전자문서 저장 
	applyBtn.addEventListener('click',function(e){			
		applyFrom(1);
	})

	//전자문서 임시저장
	tempApplyBtn.addEventListener('click',function(){

		applyFrom(2);

	})
	
	
	//폼 저장 함수(1=저장, 2=임시저장)
	function applyFrom(check, status){
		//결재선 배열 생성
		let appAr = document.querySelectorAll('.appForm');
		//결재선 확인
		if(appAr.length<2){
			
			alert("결재선을 추가하세요");
			return;
		}
				
		if(confirm('제출하시겠습니까??')){			
			let formData = new FormData(formelem);
			formData.append('check', check);
			//배열생성후 formdata에 값 추가
			for(let ar of appAr){
				let apAr =ar.getAttribute('value');				
				console.log("apAR   "+apAr)
				formData.append('appAr',apAr);			
			}
			for(const key of formData.keys()){

				console.log(key);
			}

			fetch("apply",{
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


	}



		//summit
		// applyBtn.addEventListener('click', function(e){
		// 	e.preventDefault;
		// 	formelem.setAttribute("action","apply");
		// 	formelem.setAttribute("method","post");
		// 	formelem.setAttribute("enctype","multipart/form-data");
		// 	formelem.submit();

		// })


	function check(result){

		console.log(result.edmsTitle)
		console.log(result);
		alert(result.result);

	}

	



// jstree 초기화 함수


	function fSch() {
            console.log("껌색할께영");
            $('#jstree').jstree(true).search($("#schName").val());
		}

        //중요 속성, original, icon, state
        // root node는 parent를 #       
        $.jstree.defaults.core.themes.variant = "large";      

        //일반적으로 요렇게만 사용해도 충분!
        $("#jstree").jstree({
            "plugins": ["search","wholerow","types" ],
			"check_callback": true,  // 요거이 없으면, create_node 안먹음
            'core': {
                'data':{
                    "url": 'api/chart',
					'dataType':'json' // ajax로 요청할 URL
                    } 				
				},
			"types":{
				"member" :{
					"icon" : "bx bx-user" 
				},
				"dept" : {
					"icon" : "bx bxs-building"
				}

			}                        
            
        });    



        //이벤트
        $('#jstree').on("changed.jstree", function (e, data) {
            console.log(data.selected);
        });

        // Node 열렸을 땡
        let isAdded = false;     
        // Node 선택했을 땡
		//member임시 저장 변수
			let temp;
			let tempAr=[];

        $('#jstree').on("select_node.jstree", function (e, data) {
            temp=null;
			console.log("select했을땡", data.node.type);
			if(data.node.type=="member"){
				temp = data.node;
			}
			console.log(temp);
        });

		// 결제선 추가 이동버튼
		applyOn.addEventListener("click", function(){
			//결제선 추가
			applyAdd(temp,applyList)
		});


		//결제선 저장 및 오른쪽 이동
		function applyAdd(data, divId){
			
			console.log(tempAr);
			
			for(let t of tempAr){
				if(data.original.id==t.id){
					return;
				}
			}

			if(data==null){
				alert('결재자를 선택해 주세요');
				return;
			}
			if(tempAr.length>4 ){
				alert('결재자는 최대 5인까지 가능합니다.')
				return;
			}
			let json = JSON.stringify(data.original);
			let list = document.createElement('div'); 			
			list.setAttribute('class','draggable');
			list.setAttribute('draggable', 'true');
			let icoDrag= document.createElement('span');
			icoDrag.setAttribute('class', 'ico-drag');
			list.appendChild(icoDrag);
			let elDiv = document.createElement('div');
			elDiv.setAttribute('class', 'appline');
			elDiv.setAttribute('data-person',json);
			elDiv.innerText =  data.original.dept+" "+data.text;
			icoDrag.appendChild(elDiv)
			divId.appendChild(list);
			console.log('메홀ㅇ'+data.original.dept);
			tempAr.push(data.original);
			data=null;

		}
		
		//결재선 추가명단에서 제거할 사람 선택
			let target;
			
			applyList.addEventListener('click',function(e){
				target = e.target;
				console.log(target);
				
			})	
			// 제거버튼
			delBtn.addEventListener('click', e=>{	
				let ancester = target.closest('.draggable');	
				ancester.remove(); //element 제거
				let index = tempAr.indexOf(target.getAttribute('data-person'));
				console.log(index+"  "+target.getAttribute('data-person'));
				tempAr.splice(index,1);
				console.log(tempAr);

				target=null;
				

			})




		//결제선 div생성
		function addApplyLine(divId){
			
			let dataPeple = document.querySelectorAll('.appline');
			console.log(dataPeple)
			if(dataPeple.length<2){

				alert("결제자는 최소 2인 입니다.")
				return;
			}
			
			let dataAr = []; 
			for(let p of dataPeple){
				let dataPerson = JSON.parse(p.getAttribute('data-person'))
				dataAr.push(dataPerson);
				console.log(dataAr)

			}
			
			
			divId.innerHTML="";
			console.log(dataAr)

			for(let data of dataAr){
				console.log(data)
				let divForm=document.createElement('div');
				divForm.setAttribute('class',"col-auto ps-0 pe-0 ");
				let divPsis=document.createElement('div');
				divPsis.setAttribute('class',"applineG ");
				divPsis.innerText = data.POSITION_NAME;
				divForm.appendChild(divPsis);
				let divName=document.createElement('div');
				divName.setAttribute('class',"applineW ");
				divName.innerText = data.USERNAME;
				divForm.appendChild(divName);
				let divDate=document.createElement('div');
				divDate.setAttribute('class',"applineG ");
				divForm.appendChild(divDate);
				let dataInput = document.createElement('input');
				dataInput.setAttribute('type', 'hidden');
				dataInput.setAttribute('class','appForm');
				dataInput.setAttribute('value',data.MEMBER_ID);
				divForm.appendChild(dataInput);
				
				divId.appendChild(divForm);

				
			}
				
			alert("결제선이 추가 되었습니다.");
			console.log(largeModal);
			largeModal.hide();
			
		}

    





</script>







