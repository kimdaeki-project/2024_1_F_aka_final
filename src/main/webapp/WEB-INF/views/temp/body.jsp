<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                     <c:forEach begin="1" end="${pCount}" var="i">                     
                      <li data-bs-target="#carouselExample-cf" data-bs-slide-to="${i}"></li>
                     </c:forEach>
                    </ol>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img class="d-block w-100" src="../assets/img/elements/18.jpg" alt="/" />
                        <div class="carousel-caption d-none d-md-block">
                          <h3>상품 리스트</h3>
                        </div>
                      </div>
                      
                      <c:forEach items="${plist}"  var="vo">
                      <div class="carousel-item">
                      	<c:set var="str" value="assets"/>
                 		<c:if test="${fn:contains(vo.product_photos,'assets')}">
                    	 <a href="/product/detail?product_num=${vo.product_num}"><img class="d-block w-100" src="${vo.product_photos}" alt="${vo.product_name}"/></a>                	
                 		</c:if>
                        <c:if test="${!fn:contains(vo.product_photos,'assets')}">
                      	<a href="/product/detail?product_num=${vo.product_num}"><img class="d-block w-100" src="/files/product/${vo.product_photos}" alt="${vo.product_name}"/></a>
                        </c:if>
                        <div class="carousel-caption d-none d-md-block">
                          <h3>${vo.product_name}</h3>
                        </div>
                      </div>
                    </c:forEach>
                   
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
              
            