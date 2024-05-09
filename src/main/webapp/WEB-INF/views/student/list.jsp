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
              <h4 class="fw-bold py-3 mb-4">Student<span class="text-muted fw-light">/list</span></h4>
				<div class="card">
                <h5 class="card-header">수강생 목록</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th>수강생 번호</th>
                        <th>수강생 이름</th>
                        <th>전화 번호</th>
                        <th>이메일</th>
                        <th>아이디</th>
                        <th>주소</th>
                        <th>수정</th>
                        <th>삭제</th>
                        
                        
                      
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                     <c:forEach items="${list}" var="vo">
                      <tr>
                        <td>${vo.member_id}</td>
                        <td>${vo.username}</td>
                        <td>${vo.phone}</td>
                        <td>${vo.email}</td>
                        <td>${vo.user_id}</td>
                        <td>${vo.address}</td>
                        <td>
                        	<form action="/student/update" method="get">
                        	<input type="hidden" name="member_id" value="${vo.member_id}">
                        <button class="btn btn-primary">수정</button>
                      	  	</form>
                        </td>
                        <td>
                        	<form action="/student/delete" method="post">
                        	<input type="hidden" name="member_id" value="${vo.member_id}">
                        <button class="btn btn-danger">삭제</button>
                      	  	</form>
                        </td>
                      </tr>
                      
                     </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>

                


            <div class="demo-inline-spacing ml-6">

              <nav aria-label="Page navigation">
                <ul class="pagination">

                <c:if test="${!pager.start}">
                  <li class="page-item first">
                    <a class="page-link" href="/student/list?page=1&kind=${kind}$search=${search}" ><i class="tf-icon bx bx-chevrons-left"></i></a>
                  </li>
                </c:if> 
				<c:if test="${!pager.before}">
                  <li class="page-item prev"> <a class="page-link" href="/student/list?page=${pager.startNum-1}&kind=${kind}$search=${search}"><i class="tf-icon bx bx-chevron-left"></i></a> </li>
				</c:if>                  
                  
                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
                  <li class="page-item"><a class="page-link" href="/student/list?page=${p}&kind=${kind}$search=${search}">${p}</a></li>
                  </c:forEach>
  
  				
                 <c:if test="${!pager.after}">
                  <li class="page-item next">
                    <a class="page-link" href="/student/list?page=${pager.lastNum+1}&kind=${kind}$search=${search}"><i class="tf-icon bx bx-chevron-right"></i></a>
                  </li>
                 </c:if>
                 
 				<c:if test="${!pager.last}">
                  <li class="page-item last">
                    <a class="page-link" href="/student/list?page=${pager.totalPage}&kind=${kind}$search=${search}"><i class="tf-icon bx bx-chevrons-right"></i></a>
                  </li>
  					</c:if>		
  		
                </ul>
                    
              </nav>
              
               <div class="demo-inline-spacing ml-6">
              <nav aria-label="Page navigation">
                <ul class="pagination">
                <li class="page-item first">
                
  					 <form class="d-flex" action="/student/list"  method="get">
  				    <div class="col-md-3">
                      <select id="selectTypeOpt" name="kind" class="form-select color-dropdown">
                        <option value="kind1" selected>수강생 이름</option>
                        <option value="kind2">수강생 번호</option>
                        <option value="kind3">수강생 전화 번호</option>
                        <option value="kind4">수강생 이메일</option>
                        <option value="kind5">수강생 아이디</option>
                        <option value="kind6">수강생 주소</option>       
                      </select>
                    </div>
                      <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search" />
                      <button class="btn btn-outline-primary" type="submit">Search</button>
                    </form>
					</li>
				</ul>
					<a class=" btn btn-primary" href="/student/create">추가</a>
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
