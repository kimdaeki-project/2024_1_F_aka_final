<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <h4 class="fw-bold py-3 mb-4">${vo.board_head} 상세</h4>
              <div class="row">
			                <!-- Paragraph -->
			                
                <div class="col-lg">
                  <div class="card mb-4">			             
                    <h5 class="card-header">공지사항 번호 : ${vo.board_num}</h5>
                    <input type="hidden"  id="board_num"  value="${vo.board_num}" >
                    <table class="table table-borderless">
                      <tbody>
                        <tr>
                          <td class="align-middle"><small class="text-light fw-semibold">작성자</small></td>
                          <td class="py-3">
                            <p class="mb-0">${vo.board_writer}</p>
                          </td>
                          
                          <td class="align-middle"><small class="text-light fw-semibold">제목</small></td>
                          <td class="py-4">
                            <p class="lead mb-0">${vo.board_head}</p>
                          </td>
                          
                          <td class="align-middle"><small class="text-light fw-semibold">날짜</small></td>
                          <td class="py-4">
                            <p class="lead mb-0">${vo.board_date}</p>
                          </td>
                          </tr>
                          <c:forEach items="${vo.boardFileVO}" var="fi">
                          <tr>
                    		<td><a href="/board/filedown?boardfile_num=${fi.boardfile_num}">첨부 파일 다운</a></td>
                    		<td>파일명 : ${fi.orifilename}</td>
                          </tr>
                          </c:forEach>
                        <tr>
                          <td class="align-middle"><small class="text-light fw-semibold">공지사항 내용</small></td>
                          <td class="py-4">
                          </td>
                        </tr>   
                        <tr>                    
                       	
                          <td>
                            <p class="lead mb-0">${vo.board_contents}</p>
                          </td>
                        </tr>
                                                                     
                      </tbody>
                    </table>
                  </div>
                </div>	
	            </div>
					<div class="demo-inline-spacing ml-6">	
						<a class=" btn btn-primary" href="/board/update?board_num=${vo.board_num}">수정</a>
						<form action="/board/delete" method="post">
						<input type="hidden" name="board_num" value="${vo.board_num}">
						<button class="btn btn-danger" id="deleteProductBtn">삭제</button>									
						</form>
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
