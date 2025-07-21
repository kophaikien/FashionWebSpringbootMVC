<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- [ Sidebar Menu ] start -->
<nav class="pc-sidebar">
  <div class="navbar-wrapper">
    <div class="m-header">
 
        <!-- ========   Change your logo from here   ============ -->
        <div class="logo_container">
							<a href=""${path}/admin/home/view">colo<span>shop</span></a>
			</div>
    
    </div>
    <div class="navbar-content">
      <ul class="pc-navbar">
        <li class="pc-item">
          <a href="./dashboard/index.html" class="pc-link">
            <span class="pc-micon"><i class="ti ti-dashboard"></i></span>
            <span class="pc-mtext">Tổng Quan</span>
          </a>
        </li>

        <li class="pc-item pc-caption">
          <label>admin</label>
          <i class="ti ti-dashboard"></i>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/revenue/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-chart-line"></i></i></span>
            <span class="pc-mtext">Thống Kê Doanh Thu</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/profit/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-dollar-sign"></i></span>
            <span class="pc-mtext">Thống Kê Lợi Nhuận</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/category/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-list"></i></span>
            <span class="pc-mtext">Quản Lý Danh Mục</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/product/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-box-open"></i> </span>
            <span class="pc-mtext">Quản Lý Sản Phẩm </span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/user/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-users"></i></span>
            <span class="pc-mtext">Quản Lý Tài Khoản</span>
          </a>
        </li>
           <li class="pc-item">
          <a href="${path }/admin/role/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-user"></i></span>
            <span class="pc-mtext">Phân Quyền</span>
          </a>
        </li>
           <li class="pc-item">
          <a href="${path }/admin/saleOrder/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-file-invoice"></i></span>
            <span class="pc-mtext">Quản Lý Đơn Hàng</span>
          </a>
        </li>
           <li class="pc-item">
          <a href="${path }/admin/contact/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-address-book"></i></span>
            <span class="pc-mtext">Phản Hồi Khách hàng</span>
          </a>
        </li>
        <li class="pc-item">
          <a href="${path }/admin/saleValue/view" class="pc-link">
            <span class="pc-micon"><i class="fas fa-ticket-alt"></i></span>
            <span class="pc-mtext">Quản lý giảm giá</span>
          </a>
        </li>
        <li class="pc-item pc-caption">
          <label>Pages</label>
          <i class="ti ti-news"></i>
        </li>
        <li class="pc-item">
          <a href="${path}/logout" class="pc-link">
            <span class="pc-micon"><i class="ti ti-lock"></i></span>
            <span class="pc-mtext">Đăng xuất</span>
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