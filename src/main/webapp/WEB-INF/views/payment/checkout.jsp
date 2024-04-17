<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
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
                 		 <div>
                 		 	<input type="hidden" name="orderName" value="${orderName}" id="orderName" readonly="readonly">
                        	<input type="hidden" name="orderId" value="${odrdeid}" id="odrdeid" readonly="readonly">
                        	<input type="hidden" name="amount" value="${amount}" id="amount" readonly="readonly">
                        	<input type="hidden" name="customerkey" value="${customerkey}" id="customerkey" readonly="readonly">
                        	<input type="hidden" name="clientkey" value="${clientkey}" id="clientkey" readonly="readonly">
                       		<input type="hidden" name="customerEmail" value="${customerEmail}" id="customerEmail" readonly="readonly">
                       		<input type="hidden" name="customerName" value="${customerName}" id="customerName" readonly="readonly">
                       		<input type="hidden" name="customerMobilePhone" value="${customerMobilePhone}" id="customerMobilePhone" readonly="readonly">
                        </div>
					
					<div>
						<div id="main">

							<div class="box_section"
								style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px;">
								<!-- 결제 UI -->
								<div id="payment-method"></div>
								<!-- 이용약관 UI -->
								<div id="agreement"></div>
								<!-- 쿠폰 체크박스 -->
								<div style="padding-left: 25px">
									<div class="checkable typography--p">
										<label for="coupon-box"
											class="checkable__label typography--regular"> <input
											id="coupon-box" class="checkable__input" type="checkbox"
											aria-checked="true" /> <span class="checkable__label-text">5,000원
												쿠폰 적용</span></label>
									</div>
								</div>
								<!-- 결제하기 버튼 -->
								<div class="result wrapper">
									<button class="button" id="payment-button"
										style="margin-top: 30px">결제하기</button>
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
     <!-- 토스페이먼츠 -->
        <script src="/js/payment/checkout.js"></script>
  </body>
</html>
