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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">ProductList /</span>상품 리스트</h4>

              <!-- Examples -->
              <div class="row mb-5">
               
                
                
                <c:forEach items="${list}"  var="vo">
                
                <div class="col-md-6 col-lg-4 mb-4">
                  <div class="card h-100">
                    <c:set var="str" value="assets"/>
                 		<c:if test="${fn:contains(vo.product_photos,'assets')}">
                    		<img class="card-img-top" src="${vo.product_photos}" alt="Card image cap" />                 	
                 		</c:if>
                         
                        <c:if test="${!fn:contains(vo.product_photos,'assets')}">
                 			<img class="card-img-top" src="/files/product/${vo.product_photos}" alt="image" />
                        </c:if>
       
                    <div class="card-body">
                      <h5 class="card-title">${vo.product_name}</h5>
                    	  <p class="card-text"> 상품 가격 : ${vo.product_price} 원</p>
                      <p class="card-text">상품 개월수 : ${vo.product_date}</p>
                      <a href="/product/detail?product_num=${vo.product_num}" class="btn btn-outline-primary">상품 상세 보기</a>
                      <%-- <a href="/payment/checkout?product_num=${vo.product_num}" class="btn btn-outline-primary">상품 결제 하기</a> --%>
                    </div>
                  </div>
                </div>
                
                </c:forEach>
                
                
                
                
                
                
                
                
              
                <nav aria-label="Page navigation">
                <a class=" btn btn-primary" href="/product/create">상품 추가</a>
                </nav>
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
