<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thống kê đơn hàng</title>
  <jsp:include page="/WEB-INF/views/common/variables.jsp" />
  <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp" />
</head>

<body data-pc-preset="preset-1" data-pc-direction="ltr" data-pc-theme="light">
  <div class="loader-bg">
    <div class="loader-track">
      <div class="loader-fill"></div>
    </div>
  </div>

  <jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp" />
  <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp" />

  <div class="pc-container">
    <div class="pc-content">
      <div class="page-header">
        <div class="page-block">
          <div class="row align-items-center">
            <div class="col-md-12">
              <div class="page-header-title">
                <h5 class="m-b-10">Thống kê đơn hàng</h5>
              </div>
              <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="${path}/admin/home">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thống kê đơn hàng</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <form action="${path}/admin/revenue/view" method="get">
        <div class="row align-items-end mb-4">
          <div class="col-md-3">
            <label for="beginDate" class="form-label">Từ ngày</label>
            <input type="date" class="form-control" id="beginDate" name="beginDate" value="${beginDate}" />
          </div>
          <div class="col-md-3">
            <label for="endDate" class="form-label">Đến ngày</label>
            <input type="date" class="form-control" id="endDate" name="endDate" value="${endDate}" />
          </div>
          <div class="col-md-2">
            <button type="submit" class="btn btn-primary mt-4">Lọc</button>
          </div>
        </div>
      </form>

      <div class="card">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered table-striped">
              <thead>
                <tr class="text-center">
                  <th>Mã đơn</th>
                  <th>Ngày đặt</th>
                  <th>Ngày cập nhật</th>
                  <th>Hình thức</th>
                  <th>Trạng thái</th>
                  <th>Tổng tiền</th>
                  <th>Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="order" items="${filteredOrders}">
                  <tr>
                    <td class="text-center">${order.id}</td>
                    <td>
                      <fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                    </td>
                    <td>
                      <fmt:formatDate value="${order.updateDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                    </td>
                    <td>${order.payment}</td>
                    <td>${order.status.label}</td>
                    <td>
                      <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="đ" />
                    </td>
                    <td><a href="${path}/admin/saleOrder/edit-saleOrder/${order.id}">Xem chi tiết</a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="mt-3">
            <h5>Tổng doanh thu:
              <span class="text-success fw-bold">
                <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="đ" />
              </span>
            </h5>
          </div>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp" />
  <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp" />
</body>

</html>
