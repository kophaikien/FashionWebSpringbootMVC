<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Home | ColoShop dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
</head>

<body data-pc-preset="preset-1" data-pc-direction="ltr" data-pc-theme="light">
  <!-- [ Pre-loader ] -->
  <div class="loader-bg">
    <div class="loader-track"><div class="loader-fill"></div></div>
  </div>

  <jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>

  <!-- Main Content -->
  <div class="pc-container">
    <div class="pc-content">
      <div class="page-header">
        <div class="page-block">
          <div class="row align-items-center">
            <div class="col-md-12">
              <div class="page-header-title">
                <h5 class="m-b-10">Tổng Quan</h5>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <!-- Tổng số người dùng -->
        <div class="col-md-6 col-xl-4">
          <div class="card">
            <div class="card-body">
              <h6 class="mb-2 f-w-400 text-muted">Tổng Cộng Người Dùng:</h6>
              <h4 class="mb-3">${totalUsers}</h4>
            </div>
          </div>
        </div>

        <!-- Tổng số đơn hàng -->
        <div class="col-md-6 col-xl-4">
          <div class="card">
            <div class="card-body">
              <h6 class="mb-2 f-w-400 text-muted">Tổng Cộng Đơn Hàng:</h6>
              <h4 class="mb-3">${totalOrders}</h4>
            </div>
          </div>
        </div>

        <!-- Tổng doanh thu -->
        <div class="col-md-6 col-xl-4">
          <div class="card">
            <div class="card-body">
              <h6 class="mb-2 f-w-400 text-muted">Doanh Thu:</h6>
              <h4 class="mb-3">
                <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="đ"/>
              </h4>
            </div>
          </div>
        </div>

        <!-- Bảng sản phẩm gần đây -->
        <div class="col-md-12 col-xl-12">
          <h5 class="mb-3">Sản phẩm đã bán gần đây</h5>
          <div class="card tbl-card">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-hover table-borderless mb-0">
                  <thead>
                    <tr>
                      <th>STT</th>
                      <th>Tên Sản Phẩm</th>
                      <th>Tổng Số Đơn Hàng</th>
                      <th>Tổng Số Lượng</th>
                      <th class="text-end">Tổng Doanh Thu</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="item" items="${recentProductSales}" varStatus="loop">
                      <tr>
                        <td><a href="#" class="text-muted">${loop.index + 1}</a></td>
                        <td>${item.productName}</td>
                        <td>${item.totalOrders}</td>
                        <td>${item.totalQuantity}</td>
                        <td class="text-end">
                          <fmt:formatNumber value="${item.totalAmount}" type="currency" currencySymbol="đ"/>
                        </td>
                      </tr>
                    </c:forEach>
                    <c:if test="${empty recentProductSales}">
                      <tr><td colspan="5" class="text-center text-muted">Chưa có dữ liệu.</td></tr>
                    </c:if>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- Scripts -->
  <script>layout_change('light');</script>
  <script>change_box_container('false');</script>
  <script>layout_rtl_change('false');</script>
  <script>preset_change("preset-1");</script>
  <script>font_change("Public-Sans");</script>

</body>
</html>
