<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Modals - UI elements | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                  width="25"
                  viewBox="0 0 25 42"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                >
                  <defs>
                    <path
                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                      id="path-1"
                    ></path>
                    <path
                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                      id="path-3"
                    ></path>
                    <path
                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                      id="path-4"
                    ></path>
                    <path
                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                      id="path-5"
                    ></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#696cff" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                          id="Triangle"
                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                        >
                          <use fill="#696cff" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
              <span class="app-brand-text demo menu-text fw-bolder ms-2">Sneat</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item">
              <a href="index.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
              </a>
            </li>

            <!-- Layouts -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                <div data-i18n="Layouts">Layouts</div>
              </a>

              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="layouts-without-menu.html" class="menu-link">
                    <div data-i18n="Without menu">Without menu</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="layouts-without-navbar.html" class="menu-link">
                    <div data-i18n="Without navbar">Without navbar</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="layouts-container.html" class="menu-link">
                    <div data-i18n="Container">Container</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="layouts-fluid.html" class="menu-link">
                    <div data-i18n="Fluid">Fluid</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="layouts-blank.html" class="menu-link">
                    <div data-i18n="Blank">Blank</div>
                  </a>
                </li>
              </ul>
            </li>

            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">Pages</span>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Account Settings</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="pages-account-settings-account.html" class="menu-link">
                    <div data-i18n="Account">Account</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="pages-account-settings-notifications.html" class="menu-link">
                    <div data-i18n="Notifications">Notifications</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="pages-account-settings-connections.html" class="menu-link">
                    <div data-i18n="Connections">Connections</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                <div data-i18n="Authentications">Authentications</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="auth-login-basic.html" class="menu-link" target="_blank">
                    <div data-i18n="Basic">Login</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="auth-register-basic.html" class="menu-link" target="_blank">
                    <div data-i18n="Basic">Register</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="auth-forgot-password-basic.html" class="menu-link" target="_blank">
                    <div data-i18n="Basic">Forgot Password</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div data-i18n="Misc">Misc</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="pages-misc-error.html" class="menu-link">
                    <div data-i18n="Error">Error</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="pages-misc-under-maintenance.html" class="menu-link">
                    <div data-i18n="Under Maintenance">Under Maintenance</div>
                  </a>
                </li>
              </ul>
            </li>
            <!-- Components -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Components</span></li>
            <!-- Cards -->
            <li class="menu-item">
              <a href="cards-basic.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Cards</div>
              </a>
            </li>
            <!-- User interface -->
            <li class="menu-item active open">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-box"></i>
                <div data-i18n="User interface">User interface</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="ui-accordion.html" class="menu-link">
                    <div data-i18n="Accordion">Accordion</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-alerts.html" class="menu-link">
                    <div data-i18n="Alerts">Alerts</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-badges.html" class="menu-link">
                    <div data-i18n="Badges">Badges</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-buttons.html" class="menu-link">
                    <div data-i18n="Buttons">Buttons</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-carousel.html" class="menu-link">
                    <div data-i18n="Carousel">Carousel</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-collapse.html" class="menu-link">
                    <div data-i18n="Collapse">Collapse</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-dropdowns.html" class="menu-link">
                    <div data-i18n="Dropdowns">Dropdowns</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-footer.html" class="menu-link">
                    <div data-i18n="Footer">Footer</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-list-groups.html" class="menu-link">
                    <div data-i18n="List Groups">List groups</div>
                  </a>
                </li>
                <li class="menu-item active">
                  <a href="ui-modals.html" class="menu-link">
                    <div data-i18n="Modals">Modals</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-navbar.html" class="menu-link">
                    <div data-i18n="Navbar">Navbar</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-offcanvas.html" class="menu-link">
                    <div data-i18n="Offcanvas">Offcanvas</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-pagination-breadcrumbs.html" class="menu-link">
                    <div data-i18n="Pagination &amp; Breadcrumbs">Pagination &amp; Breadcrumbs</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-progress.html" class="menu-link">
                    <div data-i18n="Progress">Progress</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-spinners.html" class="menu-link">
                    <div data-i18n="Spinners">Spinners</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-tabs-pills.html" class="menu-link">
                    <div data-i18n="Tabs &amp; Pills">Tabs &amp; Pills</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-toasts.html" class="menu-link">
                    <div data-i18n="Toasts">Toasts</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-tooltips-popovers.html" class="menu-link">
                    <div data-i18n="Tooltips & Popovers">Tooltips &amp; popovers</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ui-typography.html" class="menu-link">
                    <div data-i18n="Typography">Typography</div>
                  </a>
                </li>
              </ul>
            </li>

            <!-- Extended components -->
            <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-copy"></i>
                <div data-i18n="Extended UI">Extended UI</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="extended-ui-perfect-scrollbar.html" class="menu-link">
                    <div data-i18n="Perfect Scrollbar">Perfect scrollbar</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="extended-ui-text-divider.html" class="menu-link">
                    <div data-i18n="Text Divider">Text Divider</div>
                  </a>
                </li>
              </ul>
            </li>

            <li class="menu-item">
              <a href="icons-boxicons.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div data-i18n="Boxicons">Boxicons</div>
              </a>
            </li>

            <!-- Forms & Tables -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Forms &amp; Tables</span></li>
            <!-- Forms -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">Form Elements</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="forms-basic-inputs.html" class="menu-link">
                    <div data-i18n="Basic Inputs">Basic Inputs</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="forms-input-groups.html" class="menu-link">
                    <div data-i18n="Input groups">Input groups</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Form Layouts</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="form-layouts-vertical.html" class="menu-link">
                    <div data-i18n="Vertical Form">Vertical Form</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="form-layouts-horizontal.html" class="menu-link">
                    <div data-i18n="Horizontal Form">Horizontal Form</div>
                  </a>
                </li>
              </ul>
            </li>
            <!-- Tables -->
            <li class="menu-item">
              <a href="tables-basic.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">Tables</div>
              </a>
            </li>
            <!-- Misc -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Misc</span></li>
            <li class="menu-item">
              <a
                href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                target="_blank"
                class="menu-link"
              >
                <i class="menu-icon tf-icons bx bx-support"></i>
                <div data-i18n="Support">Support</div>
              </a>
            </li>
            <li class="menu-item">
              <a
                href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                target="_blank"
                class="menu-link"
              >
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div data-i18n="Documentation">Documentation</div>
              </a>
            </li>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

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

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <li class="nav-item lh-1 me-3">
                  <a
                    class="github-button"
                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                    data-icon="octicon-star"
                    data-size="large"
                    data-show-count="true"
                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                    >Star</a
                  >
                </li>

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block">John Doe</span>
                            <small class="text-muted">Admin</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-cog me-2"></i>
                        <span class="align-middle">Settings</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">UI elements /</span> Modals</h4>

              <!-- Bootstrap modals -->
              <div class="card mb-4">
                <h5 class="card-header">Bootstrap modals</h5>
                <div class="card-body">
                  <div class="row gy-3">
                    <!-- Default Modal -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Default</small>
                      <div class="mt-3">
                        <!-- Button trigger modal -->
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#basicModal"
                        >
                          Launch modal
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel1">Modal title</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="nameBasic" class="form-label">Name</label>
                                    <input type="text" id="nameBasic" class="form-control" placeholder="Enter Name" />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="emailBasic" class="form-label">Email</label>
                                    <input type="text" id="emailBasic" class="form-control" placeholder="xxxx@xxx.xx" />
                                  </div>
                                  <div class="col mb-0">
                                    <label for="dobBasic" class="form-label">DOB</label>
                                    <input type="text" id="dobBasic" class="form-control" placeholder="DD / MM / YY" />
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Vertically Centered Modal -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Vertically centered</small>
                      <div class="mt-3">
                        <!-- Button trigger modal -->
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#modalCenter"
                        >
                          Launch modal
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">Modal title</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="nameWithTitle" class="form-label">Name</label>
                                    <input
                                      type="text"
                                      id="nameWithTitle"
                                      class="form-control"
                                      placeholder="Enter Name"
                                    />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="emailWithTitle" class="form-label">Email</label>
                                    <input
                                      type="text"
                                      id="emailWithTitle"
                                      class="form-control"
                                      placeholder="xxxx@xxx.xx"
                                    />
                                  </div>
                                  <div class="col mb-0">
                                    <label for="dobWithTitle" class="form-label">DOB</label>
                                    <input
                                      type="text"
                                      id="dobWithTitle"
                                      class="form-control"
                                      placeholder="DD / MM / YY"
                                    />
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Slide from Top Modal -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Slide from Top</small>
                      <div class="mt-3">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalTop">
                          Launch modal
                        </button>

                        <!-- Modal -->
                        <div class="modal modal-top fade" id="modalTop" tabindex="-1">
                          <div class="modal-dialog">
                            <form class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalTopTitle">Modal title</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="nameSlideTop" class="form-label">Name</label>
                                    <input
                                      type="text"
                                      id="nameSlideTop"
                                      class="form-control"
                                      placeholder="Enter Name"
                                    />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="emailSlideTop" class="form-label">Email</label>
                                    <input
                                      type="text"
                                      id="emailSlideTop"
                                      class="form-control"
                                      placeholder="xxxx@xxx.xx"
                                    />
                                  </div>
                                  <div class="col mb-0">
                                    <label for="dobSlideTop" class="form-label">DOB</label>
                                    <input
                                      type="text"
                                      id="dobSlideTop"
                                      class="form-control"
                                      placeholder="DD / MM / YY"
                                    />
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="button" class="btn btn-primary">Save</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="m-0" />
                <div class="card-body">
                  <div class="row gy-3">
                    <!-- Modal with YouTube Video -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">YouTube Video</small>
                      <div class="mt-3">
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#youTubeModal"
                          data-theVideo="https://www.youtube.com/embed/EngW7tLk6R8"
                        >
                          Launch modal
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="youTubeModal" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <iframe height="350" src="https://www.youtube.com/embed/EngW7tLk6R8"></iframe>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Toggle Between Modals -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Toggle Between Modals</small>
                      <div class="mt-3">
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#modalToggle"
                        >
                          Launch modal
                        </button>

                        <!-- Modal 1-->
                        <div
                          class="modal fade"
                          id="modalToggle"
                          aria-labelledby="modalToggleLabel"
                          tabindex="-1"
                          style="display: none"
                          aria-hidden="true"
                        >
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalToggleLabel">Modal 1</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">Show a second modal and hide this one with the button below.</div>
                              <div class="modal-footer">
                                <button
                                  class="btn btn-primary"
                                  data-bs-target="#modalToggle2"
                                  data-bs-toggle="modal"
                                  data-bs-dismiss="modal"
                                >
                                  Open second modal
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Modal 2-->
                        <div
                          class="modal fade"
                          id="modalToggle2"
                          aria-hidden="true"
                          aria-labelledby="modalToggleLabel2"
                          tabindex="-1"
                        >
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalToggleLabel2">Modal 2</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">Hide this modal and show the first with the button below.</div>
                              <div class="modal-footer">
                                <button
                                  class="btn btn-primary"
                                  data-bs-target="#modalToggle"
                                  data-bs-toggle="modal"
                                  data-bs-dismiss="modal"
                                >
                                  Back to first
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Fullscreen Modal -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Fullscreen</small>
                      <div class="mt-3">
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#fullscreenModal"
                        >
                          Launch modal
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="fullscreenModal" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-fullscreen" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalFullTitle">Modal title</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">
                                <p>
                                  Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                  facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum
                                  at eros.
                                </p>
                                <p>
                                  Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                  lacus vel augue laoreet rutrum faucibus dolor auctor.
                                </p>
                                <p>
                                  Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                  scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                  auctor fringilla.
                                </p>
                                <p>
                                  Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                  facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum
                                  at eros.
                                </p>
                                <p>
                                  Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                  lacus vel augue laoreet rutrum faucibus dolor auctor.
                                </p>
                                <p>
                                  Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                  scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                  auctor fringilla.
                                </p>
                                <p>
                                  Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                  facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum
                                  at eros.
                                </p>
                                <p>
                                  Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                  lacus vel augue laoreet rutrum faucibus dolor auctor.
                                </p>
                                <p>
                                  Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                  scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                  auctor fringilla.
                                </p>
                                <p>
                                  Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                  facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum
                                  at eros.
                                </p>
                                <p>
                                  Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                  lacus vel augue laoreet rutrum faucibus dolor auctor.
                                </p>
                                <p>
                                  Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                  scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                  auctor fringilla.
                                </p>
                                <p>
                                  Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                  facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum
                                  at eros.
                                </p>
                                <p>
                                  Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                  lacus vel augue laoreet rutrum faucibus dolor auctor.
                                </p>
                                <p>
                                  Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                  scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                  auctor fringilla.
                                </p>
                                <p>
                                  Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                  facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum
                                  at eros.
                                </p>
                                <p>
                                  Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                  lacus vel augue laoreet rutrum faucibus dolor auctor.
                                </p>
                                <p>
                                  Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                  scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                  auctor fringilla.
                                </p>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="m-0" />
                <div class="card-body">
                  <div class="row gy-3">
                    <!-- Modal Sizes -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Sizes</small>
                      <!-- Small Modal -->
                      <div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-sm" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col mb-3">
                                  <label for="nameSmall" class="form-label">Name</label>
                                  <input type="text" id="nameSmall" class="form-control" placeholder="Enter Name" />
                                </div>
                              </div>
                              <div class="row g-2">
                                <div class="col mb-0">
                                  <label class="form-label" for="emailSmall">Email</label>
                                  <input type="text" class="form-control" id="emailSmall" placeholder="xxxx@xxx.xx" />
                                </div>
                                <div class="col mb-0">
                                  <label for="dobSmall" class="form-label">DOB</label>
                                  <input id="dobSmall" type="text" class="form-control" placeholder="DD / MM / YY" />
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Large Modal -->
                      <div class="modal fade" id="largeModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel3">Modal title</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col mb-3">
                                  <label for="nameLarge" class="form-label">Name</label>
                                  <input type="text" id="nameLarge" class="form-control" placeholder="Enter Name" />
                                </div>
                              </div>
                              <div class="row g-2">
                                <div class="col mb-0">
                                  <label for="emailLarge" class="form-label">Email</label>
                                  <input type="text" id="emailLarge" class="form-control" placeholder="xxxx@xxx.xx" />
                                </div>
                                <div class="col mb-0">
                                  <label for="dobLarge" class="form-label">DOB</label>
                                  <input type="text" id="dobLarge" class="form-control" placeholder="DD / MM / YY" />
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Extra Large Modal -->
                      <div class="modal fade" id="exLargeModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-xl" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel4">Modal title</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col mb-3">
                                  <label for="nameExLarge" class="form-label">Name</label>
                                  <input type="text" id="nameExLarge" class="form-control" placeholder="Enter Name" />
                                </div>
                              </div>
                              <div class="row g-2">
                                <div class="col mb-0">
                                  <label for="emailExLarge" class="form-label">Email</label>
                                  <input type="text" id="emailExLarge" class="form-control" placeholder="xxxx@xxx.xx" />
                                </div>
                                <div class="col mb-0">
                                  <label for="dobExLarge" class="form-label">DOB</label>
                                  <input type="text" id="dobExLarge" class="form-control" placeholder="DD / MM / YY" />
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="demo-inline-spacing">
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#smallModal"
                        >
                          Small
                        </button>

                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#largeModal"
                        >
                          Large
                        </button>

                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#exLargeModal"
                        >
                          Extra Large
                        </button>
                      </div>
                    </div>

                    <!-- Modal Scroll long content -->
                    <div class="col-lg-4 col-md-3">
                      <small class="text-light fw-semibold">Scrolling long content</small>
                      <!-- Modal -->
                      <div class="modal fade" id="modalLong" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="modalLongTitle">Modal title</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Modal -->
                      <div class="modal fade" id="modalScrollable" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="modalScrollableTitle">Modal title</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="demo-inline-spacing">
                        <!-- Button trigger modal -->
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#modalLong"
                        >
                          Option 1
                        </button>

                        <!-- Button ModalScrollable -->
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#modalScrollable"
                        >
                          Option 2
                        </button>
                      </div>
                    </div>

                    <!-- Modal Backdrop -->
                    <div class="col-lg-4 col-md-3">
                      <small class="text-light fw-semibold">Backdrop</small>
                      <div class="mt-3">
                        <!-- Button trigger modal -->
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#backDropModal"
                        >
                          Launch modal
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1">
                          <div class="modal-dialog">
                            <form class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="backDropModalTitle">Modal title</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="nameBackdrop" class="form-label">Name</label>
                                    <input
                                      type="text"
                                      id="nameBackdrop"
                                      class="form-control"
                                      placeholder="Enter Name"
                                    />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="emailBackdrop" class="form-label">Email</label>
                                    <input
                                      type="text"
                                      id="emailBackdrop"
                                      class="form-control"
                                      placeholder="xxxx@xxx.xx"
                                    />
                                  </div>
                                  <div class="col mb-0">
                                    <label for="dobBackdrop" class="form-label">DOB</label>
                                    <input
                                      type="text"
                                      id="dobBackdrop"
                                      class="form-control"
                                      placeholder="DD / MM / YY"
                                    />
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="button" class="btn btn-primary">Save</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--/ Bootstrap modals -->
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  Â©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with â¤ï¸ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                </div>
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
                </div>
              </div>
            </footer>
            <!-- / Footer -->

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
        href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/"
        target="_blank"
        class="btn btn-danger btn-buy-now"
        >Upgrade to Pro</a
      >
    </div>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../assets/js/ui-modals.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
