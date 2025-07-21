<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
   <title>Home |ColoShop dashboard </title>
  <!-- [Meta] -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Mantis is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
  <meta name="keywords" content="Mantis, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Bootstrap Admin Template">
  <meta name="author" content="CodedThemes">
  <!-- variable-->
      <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  
	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
    
</head>

<body>
	<body data-pc-preset="preset-1" data-pc-direction="ltr" data-pc-theme="light">
  <!-- [ Pre-loader ] start -->
<div class="loader-bg">
  <div class="loader-track">
    <div class="loader-fill"></div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
 
 <div class="pc-container">
    <div class="pc-content">
      <!-- [ breadcrumb ] start -->
      <div class="page-header">
        <div class="page-block">
          <div class="row align-items-center">
            <div class="col-md-12">
              <div class="page-header-title">
                <h5 class="m-b-10">Đơn hàng</h5>
              </div>
              <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="../dashboard/index.html">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="javascript: void(0)">Đơn hàng</a></li>
                <li class="breadcrumb-item" aria-current="page">Danh sách đơn hàng</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
 		<div class="row">
        <!-- [ link-button ] start -->
        <div class="col-sm-12">
          <div class="card">
            <div class="card-header">
              <h5>Danh Sách Đơn Hàng</h5>
            </div>
            <div class="page-wrapper">
            <div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<form action="${path }/admin/order-list" method="get">
					
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											
										<%--	<!-- Tìm kiếm -->
											<div class="row">
												<div class="col-md-2">
													<div class="form-group mb-4">
				                                        <select class="form-control"
															id="status" name="status">
																<option value="2">Tất cả đơn hàng</option>
																<option value="1">Đơn hàng đã giao</option>
																<option value="0">Đơn hàng chưa giao</option>
														</select>
													</div>
												</div>
												
												<div class="col-md-2">
													<input class="form-control" type="date" 
														id="beginDate" name="beginDate"/>		
												</div>
												<div class="col-md-2">
													<input class="form-control"
																	type="date" id="endDate" name="endDate" />		
												</div>
												
												<div class="col-md-3">
													<input type="text" class="form-control" id="keyword"
															name="keyword" placeholder="Search keyword" />		
												</div>
												
												<div class="col-md-1">
													<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Search</button>
												</div>
												<div class="col-md-1">
													<input id="page" name="page" type="hidden"
																		class="form-control" value="${saleOrderSearch.currentPage }"></th>
												</div>
											</div>
											<!-- Hết tìm kiếm -->
		 --%>
											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr align="center">
														<th scope="col">No.</th>
														<th scope="col">Mã đơn hàng</th>
														<th scope="col">Khách hàng</th>
														<th scope="col">Số điện thoại</th>
														<th scope="col">Địa chỉ</th>
														<th scope="col">Phương thức thanh toán</th>
														<th scope="col">Ngày tạo </th>
														<th scope="col">Trạng thái</th>
														<th scope="col">Edit</th>
														<th scope="col">Delete</th>
	
													</tr>
												</thead>
												<tbody>
													<c:forEach var="saleOrder" items="${saleOrders }"
														varStatus="loop">
														<tr>
															<th scope="row">${loop.index + 1 }</th>
	
															<td align="center">${saleOrder.code }</td>
															<td>${saleOrder.customerName }</td>
															<td align="center">${saleOrder.customerMobile}</td>
															<td>${saleOrder.customerAddress }</td>
															<td > ${saleOrder.payment}</td>
															<%-- <td>${saleOrder.updateBy }</td> --%>
															<td><fmt:formatDate pattern="dd-MM-yyyy"
																	value="${saleOrder.createDate}" /></td>
															
															<td>${saleOrder.status.label }</td>
															<td><a
																href="${path }/admin/saleOrder/edit-saleOrder/${saleOrder.id }"
																role="button" class="btn btn-primary">Edit</a>
															<td><a
																href="${path }/admin/saleOrder/delete-saleOrder/${saleOrder.id }"
																role="button" class="btn btn-secondary">Delete</a>
														</tr>
													</c:forEach>
												</tbody>
											</table>

											
										</div>
									</div>
								</div>
							</div>
						</div>
				</form>
			</div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
        </div>																														
            </div>
          </div>
          </div>
        </div>
      </div>
  

 <jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>

  <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</body>

</html>