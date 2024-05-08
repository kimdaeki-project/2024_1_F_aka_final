<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <span id="region"></span>
                     <span id="temp"></span>
                      <span id="status"></span>
                </div>
              </div>
              <!-- /Search -->
			<sec:authorize access="isAuthenticated()">
              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
				<!-- profile side btn -->
<!--                 <li class="nav-item lh-1 me-3">
                  <a
                    class="github-button"
                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                    data-icon="octicon-star"
                    data-size="large"
                    data-show-count="true"
                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                    >Star</a
                  >
                </li> -->
                
                <li class="nav-item lh-1 me-3">
                	<!-- 사원정보 이름 직급 -->
                	<c:if test="${sessionMember.user_id ne null}">
                		<span class="fs-6">${sessionMember.username}</span>
                	</c:if>
					<c:if test="${sessionMember.position_id == 0}">
						<small style="font-size:12px;">대표</small>
					</c:if>
					<c:if test="${sessionMember.position_id == 2}">
						<small style="font-size:12px;">임원</small>
					</c:if>
					<c:if test="${sessionMember.position_id == 3}">
						<small style="font-size:12px;">사원</small>
					</c:if>
					<c:if test="${sessionMember.position_id == 4}">
						<small style="font-size:12px;">대리</small>
					</c:if>
					<c:if test="${sessionMember.position_id == 5}">
						<small style="font-size:12px;">부장</small>
					</c:if>
					<c:if test="${sessionMember.position_id == 6}">
						<small style="font-size:12px;">과장</small>
					</c:if>
                </li>

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="/img/profile.jpg" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="/img/profile.jpg" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                          	<c:if test="${sessionMember.user_id ne null}">
                            	<span class="fw-semibold d-block">${sessionMember.username}</span>
                            </c:if>
							<c:if test="${sessionMember.position_id == 0}">
								<small class="text-muted">대표</small>
							</c:if>
							<c:if test="${sessionMember.position_id == 2}">
								<small class="text-muted">임원</small>
							</c:if>
							<c:if test="${sessionMember.position_id == 3}">
								<small class="text-muted">사원</small>
							</c:if>
							<c:if test="${sessionMember.position_id == 4}">
								<small class="text-muted">대리</small>
							</c:if>
							<c:if test="${sessionMember.position_id == 5}">
								<small class="text-muted">과장</small>
							</c:if>
							<c:if test="${sessionMember.position_id == 6}">
								<small class="text-muted">부장</small>
							</c:if>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="/member/mypage">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Page</span>
                      </a>
                    </li>
                    <hr>
                    <li>
                      <a class="dropdown-item" href="/payment/mylist">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">나의 결제 목록</span>
                      </a>
                    </li>
                    <hr>
                    <li>
                      <a class="dropdown-item" href="/member/logout">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
              </sec:authorize>
            </div>
          </nav>
          
       <div class="buy-now">
      <a
        href="https://github.com/dirokim/aka_final.git"
        target="_blank"
        class="btn btn-primary btn-buy-now"
        >git-hub</a
      >
    </div>
    <script src="/js/temp/nav.js"></script>