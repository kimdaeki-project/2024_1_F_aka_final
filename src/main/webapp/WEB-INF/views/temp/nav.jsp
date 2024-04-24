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
                  <span>${region}</span>
                     <span>${temp}  :</span>
                    
                     <c:if test="${status == 0}">
                     <span>
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M6.993 12c0 2.761 2.246 5.007 5.007 5.007s5.007-2.246 5.007-5.007S14.761 6.993 12 6.993 6.993 9.239 6.993 12zM12 8.993c1.658 0 3.007 1.349 3.007 3.007S13.658 15.007 12 15.007 8.993 13.658 8.993 12 10.342 8.993 12 8.993zM10.998 19h2v3h-2zm0-17h2v3h-2zm-9 9h3v2h-3zm17 0h3v2h-3zM4.219 18.363l2.12-2.122 1.415 1.414-2.12 2.122zM16.24 6.344l2.122-2.122 1.414 1.414-2.122 2.122zM6.342 7.759 4.22 5.637l1.415-1.414 2.12 2.122zm13.434 10.605-1.414 1.414-2.122-2.122 1.414-1.414z"/></svg>
                     </span>
                     </c:if>
                     
                     <c:if test="${status ==1}">
                     <span>
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M8 13h2v7H8zm3 2h2v7h-2zm3-2h2v7h-2z"/><path d="M18.944 10.113C18.507 6.671 15.56 4.001 12 4.001c-2.756 0-5.15 1.611-6.243 4.15C3.609 8.793 2 10.82 2 13.001c0 2.757 2.243 5 5 5v-2c-1.654 0-3-1.346-3-3 0-1.403 1.199-2.756 2.673-3.015l.581-.103.192-.559C8.149 7.274 9.895 6.001 12 6.001c2.757 0 5 2.243 5 5v1h1c1.103 0 2 .897 2 2s-.897 2-2 2h-1v2h1c2.206 0 4-1.794 4-4a4.008 4.008 0 0 0-3.056-3.888z"/></svg>
                     </span>
                     </c:if>
                    
                     <c:if test="${status ==2}">
                     <span>
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M8 13h2v7H8zm3 2h2v7h-2zm3-2h2v7h-2z"/><path d="M18.944 10.113C18.507 6.671 15.56 4.001 12 4.001c-2.756 0-5.15 1.611-6.243 4.15C3.609 8.793 2 10.82 2 13.001c0 2.757 2.243 5 5 5v-2c-1.654 0-3-1.346-3-3 0-1.403 1.199-2.756 2.673-3.015l.581-.103.192-.559C8.149 7.274 9.895 6.001 12 6.001c2.757 0 5 2.243 5 5v1h1c1.103 0 2 .897 2 2s-.897 2-2 2h-1v2h1c2.206 0 4-1.794 4-4a4.008 4.008 0 0 0-3.056-3.888z"/></svg>
                     </span>
                     </c:if>
                   
                     <c:if test="${status >3}">
                     <span>
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M18.944 10.112C18.507 6.67 15.56 4 12 4 9.244 4 6.85 5.611 5.757 8.15 3.609 8.792 2 10.819 2 13c0 2.757 2.243 5 5 5v-2c-1.654 0-3-1.346-3-3 0-1.403 1.199-2.756 2.673-3.015l.581-.103.192-.559C8.149 7.273 9.895 6 12 6c2.757 0 5 2.243 5 5v1h1c1.103 0 2 .897 2 2s-.897 2-2 2h-1v2h1c2.206 0 4-1.794 4-4a4.008 4.008 0 0 0-3.056-3.888z"/><circle cx="15" cy="16" r="1"/><circle cx="15" cy="19" r="1"/><circle cx="12" cy="18" r="1"/><circle cx="12" cy="21" r="1"/><circle cx="9" cy="19" r="1"/><circle cx="9" cy="16" r="1"/></svg>
                     </span>
                     </c:if>
                     
                     <c:if test="${status ==5}">
                     <span>
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M8 13h2v7H8zm3 2h2v7h-2zm3-2h2v7h-2z"/><path d="M18.944 10.113C18.507 6.671 15.56 4.001 12 4.001c-2.756 0-5.15 1.611-6.243 4.15C3.609 8.793 2 10.82 2 13.001c0 2.757 2.243 5 5 5v-2c-1.654 0-3-1.346-3-3 0-1.403 1.199-2.756 2.673-3.015l.581-.103.192-.559C8.149 7.274 9.895 6.001 12 6.001c2.757 0 5 2.243 5 5v1h1c1.103 0 2 .897 2 2s-.897 2-2 2h-1v2h1c2.206 0 4-1.794 4-4a4.008 4.008 0 0 0-3.056-3.888z"/></svg>
                     </span>
                     </c:if>
                     
                     <c:if test="${status ==6}">
                     <span> 
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M18.944 10.112C18.507 6.67 15.56 4 12 4 9.244 4 6.85 5.611 5.757 8.15 3.609 8.792 2 10.819 2 13c0 2.757 2.243 5 5 5v-2c-1.654 0-3-1.346-3-3 0-1.403 1.199-2.756 2.673-3.015l.581-.103.192-.559C8.149 7.273 9.895 6 12 6c2.757 0 5 2.243 5 5v1h1c1.103 0 2 .897 2 2s-.897 2-2 2h-1v2h1c2.206 0 4-1.794 4-4a4.008 4.008 0 0 0-3.056-3.888z"/><circle cx="15" cy="16" r="1"/><circle cx="15" cy="19" r="1"/><circle cx="12" cy="18" r="1"/><circle cx="12" cy="21" r="1"/><circle cx="9" cy="19" r="1"/><circle cx="9" cy="16" r="1"/></svg>
                     </span>
                     </c:if>
                     
                     <c:if test="${status ==7}">
                     <span> 
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M18.944 10.112C18.507 6.67 15.56 4 12 4 9.244 4 6.85 5.611 5.757 8.15 3.609 8.792 2 10.819 2 13c0 2.757 2.243 5 5 5v-2c-1.654 0-3-1.346-3-3 0-1.403 1.199-2.756 2.673-3.015l.581-.103.192-.559C8.149 7.273 9.895 6 12 6c2.757 0 5 2.243 5 5v1h1c1.103 0 2 .897 2 2s-.897 2-2 2h-1v2h1c2.206 0 4-1.794 4-4a4.008 4.008 0 0 0-3.056-3.888z"/><circle cx="15" cy="16" r="1"/><circle cx="15" cy="19" r="1"/><circle cx="12" cy="18" r="1"/><circle cx="12" cy="21" r="1"/><circle cx="9" cy="19" r="1"/><circle cx="9" cy="16" r="1"/></svg>
                     </span>
                     </c:if>
                
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
          
       <div class="buy-now">
      <a
        href="https://github.com/dirokim/aka_final.git"
        target="_blank"
        class="btn btn-primary btn-buy-now"
        >git-hub</a
      >
    </div>