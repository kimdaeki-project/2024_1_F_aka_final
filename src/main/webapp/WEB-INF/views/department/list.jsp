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
   <!--link import  -->
    <c:import url="../temp/head.jsp"></c:import>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
    <script src="/assets/js/config.js"></script>
   <!-- jQuery CDN -->


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
          <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4">부서 관리 목록</h4>

              <!-- Accordion -->
              <h5 class="mt-4">부서 관리 조직도</h5>
              <div class="row">
                <div class="col-md mb-4 mb-md-0">
                  <div class="accordion mt-3" id="accordionExample">


								<div id="tree"></div>
					
								<%-- <c:forEach items="${list}" var="li" >      
                    <c:if test="${li.department_super_id eq 1}">
                    	<div class="card accordion-item"> 
                   			 <h2 class="accordion-header" id="headingTwo">
                       		 	<button type="button"  data-department_id="${li.department_id}" data-department_super_id="${li.department_super_id}" class="accordion-button collapsed departmentBtn">
                         		 ${li.department_name}
                       	 		</button>
                     	 	</h2>
                    	 </div>                                   		                    
                    </c:if>
                    <c:if test="${li.department_super_id ne 1}">
                    	<div class="card accordion-item"> 
                   			 <h2 class="accordion-header" id="headingTwo">
                       		 	<button type="button"  data-department_id="${li.department_id}"  data-department_name="${li.department_name}" data-department_super_id="${li.department_super_id}" class="accordion-button collapsed departmentBtn ${li.department_name}" data-bs-toggle="modal" data-bs-target="#modalScrollable">
                         		 ${li.department_name}
                       	 		</button>
                     	 	</h2>
                    	 </div>                                   		                    
                    </c:if>
                        		
                    </c:forEach> --%>
                    
                 <button style="display: none" id="modalButton"  type="button" class="btn btn-primary"  data-bs-toggle="modal"  data-bs-target="#modalScrollable" >
                          Option 2
                  </button>
                    
                  
                   
                  </div>
                </div>
                <div class="col-md">
                  
                </div>
              </div>
              <!--/ Accordion -->
              <div class="modal fade" id="modalScrollable" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="modalScrollableTitle">사원 목록</h5>
                            	<div class="modal-body" id="modalResult">
                              </div>
                           
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                             
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              
                            </div>
                          </div>
                        </div>
                      </div>
              
              
              
		
              <!--/ Advance Styling Options -->
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
    <script src="/js/department/departmentEvent.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

  </body>
</html>
