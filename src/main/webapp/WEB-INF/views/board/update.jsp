<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>
    <meta name="description" content="" />

    <script src="/assets/vendor/js/helpers.js"></script>
    <script src="/assets/js/config.js"></script>
   <!--link import  -->
    <c:import url="../temp/head.jsp"></c:import>

   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> 	
    <link href="https://fastly.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://fastly.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"></span>공지사항</h4>

              <!-- Basic Layout & Basic with Icons -->
              <div class="row">
                <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">공지사항 수정</h5>
                      <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                      <form action="/board/update"  method="post" enctype="multipart/form-data" >
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">공지사항 제목</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="board_head" id="basic-default-name" value="${vo.board_head}" placeholder="제목을 입력하세요" />
                          </div>
                        </div>
                      	
                      	 <input type="hidden" name="board_num" value="${vo.board_num}">
                      	 <input type="hidden" name="member_id" value="${vo.member_id}">
                          
                          <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">상세 설명</label>
                          <div class="col-sm-10">
                            <textarea  class="form-control" name="board_contents" id="summerBoard" placeholder="상세 설명을 입력하세요">${vo.board_contents}</textarea>         	
                          </div>
                                                                                                                       
                        </div>
                       
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">첨부 파일</label>
                          <div class="col-sm-10" id="fileResult"> 
                          
                 		   <c:forEach items="${vo.boardFileVO}" var="fi" varStatus="status">
                 		   <div class="mb-2">
                 		   <a href="/board/filedown?boardfile_num=${fi.boardfile_num}">${fi.orifilename}</a>
                    	  	<button type="button" data-file-num="${fi.boardfile_num}" class="btn btn-danger fileDelete">x</button>                 		   
                 		   </div>                 		   
                 		   </c:forEach>
                 		   <c:set var="size" value="${fn:length(vo.boardFileVO)}"/>	
                            <button class="btn btn-primary mb-2" type="button" data-file-size="${size}" id="fileAdd">파일추가</button>
                          </div>
                        </div>
                        
                        
                        
                        <div class="row justify-content-end">
                          <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
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
    
    <script>
      //섬머노트
      $('#summerBoard').summernote({
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
  //파일추가 버튼 
  const fileAdd = document.getElementById("fileAdd");
  //파일 추가될위치 div
  const fileResult = document.getElementById("fileResult");
  //출력된 파일 개수
  let fileTotal = fileAdd.dataset.fileSize;
  //파일 최대 저장 갯수
  let count = 5;
  //저장된 파일들 옆 삭제버튼
  let fileDelete = document.getElementsByClassName("fileDelete");
  //버튼 안보이기
  if(fileTotal==count){
      fileAdd.style.display="none";  
    }

    //파일추가
    fileAdd.addEventListener('click',()=>{ 
      //파일 개수 최대 5
      if(fileTotal==count){
        alert("첨부파일은 5개까지 가능합니다");
        fileAdd.style.display="none";
        return;
      }
      //파일 요소 생성
      let formFileinput = document.createElement('input');
      let sum; 
      sum = document.createAttribute("type");
      sum.value = "file";
      formFileinput.setAttributeNode(sum);
      sum = document.createAttribute("class");
      sum.value = "form-control";
      formFileinput.setAttributeNode(sum);
      sum = document.createAttribute("name");
      sum.value = "attach";
      formFileinput.setAttributeNode(sum);
      sum = document.createAttribute("id");
      sum.value = "basic-default-name";
      formFileinput.setAttributeNode(sum);
      fileResult.appendChild(formFileinput);
      fileTotal++;
    });
  
  //파일 삭제
  for(let a of fileDelete){
    let fileNum = a.dataset.fileNum;
    a.addEventListener('click',()=>{
     if(confirm("파일 삭제 하시겠습니까? (복구 불가능)")){
            fileAjax(fileNum);
            a.parentElement.remove();
            fileTotal--;
            fileAdd.style.display="block";
	     }else{
            
          }
        })
      }


  //파일 삭제 비동기 요청
  function fileAjax(Num){
    fetch("/board/fileDelete?boardfile_num="+Num,{
      method:"get"        
    }).then(res=>{return res.text()})
    .then(res=>{
      let result = res.trim();
      if(result==1){
        alert("삭제 성공");
      }else{
        alert("삭제 실패");
      }
    })
  }
  
  
  
    </script>
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
  </body>
</html>
