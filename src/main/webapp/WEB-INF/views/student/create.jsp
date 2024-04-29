<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"></span>수강생 추가</h4>

              <!-- Basic Layout & Basic with Icons -->
              <div class="row">
                <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">수강생 추가</h5>
                      <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                      <form action="/student/create" modelAttribute="memberVO" method="post" >
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">수강생 이름</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" id="basic-default-name" placeholder="이름을 입력하세요" />
                          </div>
                        </div>
                      
                      	<div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">전화 번호</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="phone" id="basic-default-name" placeholder="전화 번호를 입력하세요" />
                          </div>
                        </div>
                        
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">아이디</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_id" id="basic-default-name" placeholder="재고 수량을 입력하세요" />
                          </div>
                        </div>
                        
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">패스워드</label>
                          <div class="col-sm-10">
                            <input type="password" class="form-control" name="password" id="basic-default-name" placeholder="재고 수량을 입력하세요" />                        
                          </div>
                        </div>
                        
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">이메일</label>
                          <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="basic-default-name" placeholder="재고 수량을 입력하세요" />                         
                          </div>
                        </div>
                        
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">주소</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="address" id="basic-default-name" placeholder="재고 수량을 입력하세요" />                            
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