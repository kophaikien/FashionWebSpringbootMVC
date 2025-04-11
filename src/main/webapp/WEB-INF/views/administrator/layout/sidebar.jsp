<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- [ Sidebar Menu ] start -->
<nav class="pc-sidebar">
  <div class="navbar-wrapper">
    <div class="m-header">
      <a href="./dashboard/index.html" class="b-brand text-primary">
        <!-- ========   Change your logo from here   ============ -->
        <img src="./assets/images/logo-dark.svg" class="img-fluid logo-lg" alt="logo">
      </a>
    </div>
    <div class="navbar-content">
      <ul class="pc-navbar">
        <li class="pc-item">
          <a href="./dashboard/index.html" class="pc-link">
            <span class="pc-micon"><i class="ti ti-dashboard"></i></span>
            <span class="pc-mtext">Dashboard</span>
          </a>
        </li>

        <li class="pc-item pc-caption">
          <label>admin</label>
          <i class="ti ti-dashboard"></i>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/category/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-list"></i></span>
            <span class="pc-mtext">Category</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/product/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-box-archive"></i></span>
            <span class="pc-mtext">Product</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/user/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-users"></i></span>
            <span class="pc-mtext">Users</span>
          </a>
        </li>
           <li class="pc-item">
          <a href="${path }/admin/role/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-user"></i></span>
            <span class="pc-mtext">Roles</span>
          </a>
        </li>
           <li class="pc-item">
          <a href="${path }/admin/order/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-file-invoice"></i></span>
            <span class="pc-mtext">Orders</span>
          </a>
        </li>
           <li class="pc-item">
          <a href="${path }/admin/contact/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-address-book"></i></span>
            <span class="pc-mtext">Customer contact</span>
          </a>
        </li>
        <li class="pc-item pc-caption">
          <label>Pages</label>
          <i class="ti ti-news"></i>
        </li>
        <li class="pc-item">
          <a href="./pages/login.html" class="pc-link">
            <span class="pc-micon"><i class="ti ti-lock"></i></span>
            <span class="pc-mtext">Login</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="./pages/register.html" class="pc-link">
            <span class="pc-micon"><i class="ti ti-user-plus"></i></span>
            <span class="pc-mtext">Register</span>
          </a>
        </li>

        <li class="pc-item pc-caption">
          <label>Other</label>
          <i class="ti ti-brand-chrome"></i>
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link"><span class="pc-micon"><i class="ti ti-menu"></i></span><span class="pc-mtext">Menu
              levels</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="#!">Level 2.1</a></li>
            <li class="pc-item pc-hasmenu">
              <a href="#!" class="pc-link">Level 2.2<span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
              <ul class="pc-submenu">
                <li class="pc-item"><a class="pc-link" href="#!">Level 3.1</a></li>
                <li class="pc-item"><a class="pc-link" href="#!">Level 3.2</a></li>
                <li class="pc-item pc-hasmenu">
                  <a href="#!" class="pc-link">Level 3.3<span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
                  <ul class="pc-submenu">
                    <li class="pc-item"><a class="pc-link" href="#!">Level 4.1</a></li>
                    <li class="pc-item"><a class="pc-link" href="#!">Level 4.2</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="pc-item pc-hasmenu">
              <a href="#!" class="pc-link">Level 2.3<span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
              <ul class="pc-submenu">
                <li class="pc-item"><a class="pc-link" href="#!">Level 3.1</a></li>
                <li class="pc-item"><a class="pc-link" href="#!">Level 3.2</a></li>
                <li class="pc-item pc-hasmenu">
                  <a href="#!" class="pc-link">Level 3.3<span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
                  <ul class="pc-submenu">
                    <li class="pc-item"><a class="pc-link" href="#!">Level 4.1</a></li>
                    <li class="pc-item"><a class="pc-link" href="#!">Level 4.2</a></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="pc-item">
          <a href="../other/sample-page.html" class="pc-link">
            <span class="pc-micon"><i class="ti ti-brand-chrome"></i></span>
            <span class="pc-mtext">Sample page</span>
          </a>
        </li>
      </ul>
     
    </div>
  </div>
</nav>
<!-- [ Sidebar Menu ] end -->