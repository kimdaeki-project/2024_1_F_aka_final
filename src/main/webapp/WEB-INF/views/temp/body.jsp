<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                    
                    
                <!-- 공지사항 시작 -->
	                      <div class="col-sm-13">
                       			<div class="card">
           						     <h5 class="card-header">공지사항</h5>
               							 <div class="table-responsive text-nowrap">
                							  <table class="table table-hover">
                 							   <thead class="table-light">
                 							     <tr>
                 							       <th>공지사항 번호</th>
                 							       <th>제목</th>
                  							       <th>작성일</th>                      
              						 	        </tr>
                    							</thead>
                  
                  							  <tbody class="table-border-bottom-0">
                     						  <c:forEach items="${list}" var="vo">
                    
                    						   <tr>
                       							 <td class="w-25">${vo.board_num}</td>
                       							 <td><i class="fab fa-angular fa-lg text-danger me-3"></i><a href="/board/detail?board_num=${vo.board_num}"><strong>${vo.board_head}</strong></a></td>
                       							 <td class="w-25">${vo.board_date}</td>                       
                     						   </tr>
                      
                   							  </c:forEach>
                   							 </tbody>
                 							 </table>
              								  </div>
            							 </div>
                    			</div>
            			<!-- 공지사항 끝 -->					  
                    						  
                    						  
                    						  
                    						 
                    </div>
                  </div>
                </div>
                
                
                <!-- 사진 시작 -->
                <div class="col-lg-4 col-md-4 order-1">
                  <div class="row">
                    <div class="">
                      <div class="card">
                        <div class="card-body">
                           <div  id="carouselExample-cf"  class="carousel carousel-dark slide carousel-fade"   data-bs-ride="carousel"  >
                    <ol class="carousel-indicators">
                      <li data-bs-target="#carouselExample-cf" data-bs-slide-to="0" class="active"></li>
                      <li data-bs-target="#carouselExample-cf" data-bs-slide-to="1"></li>
                      <li data-bs-target="#carouselExample-cf" data-bs-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img class="d-block w-100" src="../assets/img/elements/18.jpg" alt="First slide" />
                        <div class="carousel-caption d-none d-md-block">
                          <h3>First slide</h3>
                          <p>Eos.</p>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../assets/img/elements/13.jpg" alt="Second slide" />
                        <div class="carousel-caption d-none d-md-block">
                          <h3>Second slide</h3>
                          <p>In numquam </p>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../assets/img/elements/2.jpg" alt="Third slide" />
                        <div class="carousel-caption d-none d-md-block">
                          <h3>Third slide</h3>
                          <p>Lorem ipsum</p>
                        </div>
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExample-cf" role="button" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExample-cf" role="button" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </a>
                  </div>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                </div>
				<!-- 사진 끝 -->
                
                <!-- Total Revenue -->
                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-8">
                        <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                        <div id="totalRevenueChart" class="px-2"></div>
                      </div>
                      <div class="col-md-4">
                        <div class="card-body">
                          <div class="text-center">
                            <div class="dropdown">
                              <button  class="btn btn-sm btn-outline-primary dropdown-toggle"  type="button"  id="growthReportId"  data-bs-toggle="dropdown"  aria-haspopup="true"  aria-expanded="false"  >
                                2024
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                                <a class="dropdown-item" href="javascript:void(0);">2022</a>
                                <a class="dropdown-item" href="javascript:void(0);">2023</a>
                                <a class="dropdown-item" href="javascript:void(0);">2024</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="growthChart"></div>
                        <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                        <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2024</small>
                              <h6 class="mb-0">$32.5k</h6>
                            </div>
                          </div>
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2023</small>
                              <h6 class="mb-0">$41.2k</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Total Revenue -->
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="row">
                    <div class="col-6 mb-4">
                      <div class="card">
                       		
                        </div>
                      </div>
                    </div>
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-12 mb-4">
                      <div class="card">
                        <div class="card-body">
                          
                        </div>
                      </div>
                    </div>
                  </div>
             <!-- Calender --> 
            	<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-2">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-10">          
            			 <div class="card-header m-0 me-2 pb-3" id='calendar'></div>
             
          	        </div>  
             	  </div>
                </div>
              </div>
             <!-- Calender End-->
                  
                  
                  
                </div>
              </div>
              
            