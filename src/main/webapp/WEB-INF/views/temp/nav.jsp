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
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                  />
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
                	<span class="fs-6">${member.username}</span>
					<c:if test="${member.position_id == 1}">
						<small style="font-size:12px;">사원</small>
					</c:if>
					<c:if test="${member.position_id == 2}">
						<small style="font-size:12px;"></small>
					</c:if>
					<c:if test="${member.position_id == 3}">
						<small style="font-size:12px;"></small>
					</c:if>
					<c:if test="${member.position_id == 4}">
						<small style="font-size:12px;"></small>
					</c:if>
					<c:if test="${member.position_id == 5}">
						<small style="font-size:12px;"></small>
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
                            <span class="fw-semibold d-block">${member.username}</span>
							<c:if test="${member.position_id == 1}">
								<small class="text-muted">사원</small>
							</c:if>
							<c:if test="${member.position_id == 2}">
								<small class="text-muted"></small>
							</c:if>
							<c:if test="${member.position_id == 3}">
								<small class="text-muted"></small>
							</c:if>
							<c:if test="${member.position_id == 4}">
								<small class="text-muted"></small>
							</c:if>
							<c:if test="${member.position_id == 5}">
								<span class="fs-4 py-2 d-flex justify-content-center"></span>
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