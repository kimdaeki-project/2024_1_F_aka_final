<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- 차트 Js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>






			
			<!-- Content -->
			<!-- order 0 -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-13">
                        <div class="card-body">
                          <canvas id="myChart" width="300" height="124"></canvas>
                          
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                        
                        </div>
                      </div>
                    </div>
                  </div>
                </div>



				<!-- order 1 -->
                <div class="col-lg-4 col-md-4 order-1">
                  <div class="row">
                    <div class="mb-4">
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
                        <a href="/product/list"> <img class="d-block w-100" src="../assets/img/elements/8.jpg" alt="/"/></a>                
                        <div class="carousel-caption d-none d-md-block">
                          <h5>상품 리스트</h5>
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
                          <h6>${vo.product_name}</h6>
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

                
               	<!-- order 2 -->
                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-13">
                        <div class="card-body">
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
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i><a
													href="/board/detail?board_num=${vo.board_num}"><strong>${vo.board_head}</strong></a></td>
												<td class="w-25">${vo.board_date}</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
                      </div>
                    </div>
                  </div>
                </div>
                
                
                <!-- order 3 -->
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="row">
                    <div class="mb-4">
                      <div class="card">
                         <div class="card-body">
               
              <h2 class="mt-4">프로젝트 소개</h2>
              <div class="row">
                <div class="col-md mb-4 mb-md-0">
                  <small class="text-light fw-semibold">프로젝트 설명</small>
                  <h6>오프라인 학원에서 사용하는 사내 그룹웨어</h6>
                  <small class="text-light fw-semibold">구디아카데미</small>
                  <h6>클라우드 활용 자바 개발자 양성과정 (팀 프로젝트)</h6>                  
                  <small class="text-light fw-semibold">프로젝트 기간</small>
                  <h6>2024.3 ~ 2024.5</h6>
                  <small class="text-light fw-semibold">사용 기술</small>
                  <h6>Java,SpringBoot,JSP,MariaDB,AWS EC2</h6>
                  <div class="accordion mt-3" id="accordionExample">
                    <div class="card accordion-item">
                      <h2 class="accordion-header" id="headingOne">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionOne"
                          aria-expanded="false"
                          aria-controls="accordionOne"
                        >
                          팀장.조민우
                        </button>
                      </h2>
                      <div
                        id="accordionOne"
                        class="accordion-collapse collapse"
                        aria-labelledby="headingOne"
                        data-bs-parent="#accordionExample"
                      >
                        <div class="accordion-body">
                     	   <div>
                      		    1.전자 결재 시스템 구현
                     	   </div>
                      </div>
                      </div>
                    </div>
                    <div class="card accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionTwo"
                          aria-expanded="false"
                          aria-controls="accordionTwo"
                        >
                          팀원.김승균
                        </button>
                      </h2>
                      <div
                        id="accordionTwo"
                        class="accordion-collapse collapse"
                        aria-labelledby="headingTwo"
                        data-bs-parent="#accordionExample"
                      >
                        <div class="accordion-body">
                    	    <div>
                     		     1.학원비 결제 시스템(tosspayment)
                   	       </div>
                    	  
                    	    <div>
                   		       2.학생,비품,상품 관리
                   	       </div>
                     	  
                     	   <div>
                      		    3.공지사항
                     	   </div>
                     	   
                     	   <div>
                      		    4.메인페이지(기상청api데이터 출력)
                     	   </div>
                      </div>
                      </div>
                    </div>
                    <div class="card accordion-item">
                      <h2 class="accordion-header" id="headingThree">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionThree"
                          aria-expanded="false"
                          aria-controls="accordionThree"
                        >
                          팀원.고민효
                        </button>
                      </h2>
                      <div
                        id="accordionThree"
                        class="accordion-collapse collapse"
                        aria-labelledby="headingFour"
                        data-bs-parent="#accordionExample"
                      >
                        <div class="accordion-body">
                          <div>
                          1.스프링 시큐리티 구현
                          </div>
                          <div>
                          2.로그인,로그아웃,회원가입,마이페이지 구현
                          </div>
                          <div>
                          3.스케쥴 관리 구현(Full Calendar)
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card accordion-item">
                      <h2 class="accordion-header" id="headingFour">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionFour"
                          aria-expanded="false"
                          aria-controls="accordionFour"
                        >
                          팀원.안인권 /중도 취업
                        </button>
                      </h2>
                      <div
                        id="accordionFour"
                        class="accordion-collapse collapse"
                        aria-labelledby="headingFour"
                        data-bs-parent="#accordionExample"
                      >
                        <div class="accordion-body">
                          <div>인사관리 구현</div>
                          <div>수업관리</div>
                          <div>강의실 관리</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
    
                        
                        </div>
                      </div>
                    </div>
                   </div>
                  </div>
                  
                  
                  <!-- order 4 -->
                <div class="col-12 col-lg-8 order-4 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-13">
                        <div class="card-body">
                          <div class="card-header m-0 me-2 pb-3" id='calendar'></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
				<!-- order 5 -->
                <!-- <div class="col-12 col-md-8 col-lg-4 order-5 order-md-2">
                  <div class="row">
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                         order 5
                        </div>
                      </div>
                    </div>
                   </div>
                  </div> -->
                  
                  
                  
                  
                  
                  
               </div>
             </div>
              
              
            <!-- / Content -->

                  
                
              
              <script>
              let myCt = document.getElementById('myChart');
              let arrlabels = [];
              let arrdata = [];
              fetch("/payment/total",{
          		method: "GET",
          		headers: {
          			"Content-Type": "application/json"
          		}
          		})
          		.then(res => res.json())
          		.then(dataArray => {
          			dataArray.forEach((data) =>{
                  arrlabels.push(data.month);
          				arrdata.push(data.totalSales);
          			})
                let myChart = new Chart(myCt, {
                  type: 'bar',
                  data: {
                    labels: arrlabels,
                    datasets: [
                      {
                        label: '월 매출',
                        data: arrdata
                      }
                    ]
                  },
                });
              });
             
              
              </script>
            