 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
                <h5 class="m-b-10">Đơn Hàng</h5>
              </div>
              <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="../dashboard/index.html">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="javascript: void(0)">Đơn Hàng</a></li>
                <li class="breadcrumb-item" aria-current="page">Thêm Đơn Hàng</li>
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
              <h5>Thêm Đơn Hàng</h5>
            </div>
            <div class="page-wrapper">
                       <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- basic table -->
               	<div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${path }/admin/saleOrder/add-save" method="post" modelAttribute="saleOrder" enctype="multipart/form-data">
	                        		 <div class="form-body">
	                        		 
	                        		 	<sf:hidden path="id"/> <!-- id > 0 => update -->
	                        		 
	                        			<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="customerName">Tên Khách Hàng</label>
			                                        <sf:input path="customerName" type="text" class="form-control" id="customerName" name="customerName" placeholder="cusomer name"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="code">Mã Đơn Hàng Hàng</label>
			                                        <sf:input path="code" type="text" class="form-control" id="cod" name="code" placeholder="code"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">	                                    	
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="mobile">Số Điện Thoại</label>
			                                        <sf:input path="customerMobile" type="text" class="form-control" id="customerMobile" name="customerMobile" placeholder="mobile"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	<div class="col-md-6">
												    <div class="form-group mb-4">
												        <label for="status">Trạng thái đơn hàng</label>
												        <sf:select path="status" cssClass="form-control" id="status" name="status">
												        	<c:forEach items="${orderStatuses}" var="orderStatus">
												            <sf:option value="${orderStatus}">${orderStatus.label}</sf:option>
												        			
												        	</c:forEach>
												        </sf:select>
												    </div>
												</div>

										</div>
										<div class="row">
										<div class="col-md-6">
												    <div class="form-group mb-4">
												        <label for="user">Tài khoản</label>
												        <sf:select path="user.id" cssClass="form-control" id="userId" name="userId">
    																<sf:option value="${saleOrder.user.id}"></sf:option>
												        </sf:select>
												    </div>
												</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="email">Email</label>
			                                        <sf:input path="customerEmail" type="text" class="form-control" id="customerEmail" name="customerEmail" placeholder="email"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="address">Địa Chỉ</label>
			                                        <sf:input path="customerAddress" type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="address"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate">Ngày Tạo</label>
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updatedate">Ngày Cập Nhật</label>
			                                        <sf:input path="updateDate" class="form-control" type="date" 
			                                        			id="updateDate" name="updateDate" ></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4"> 
			                                        <a href="${path }/admin/user/view" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        Quay Lại
			                                        </a>
                                    				<button type="submit" class="btn btn-primary">Lưu</button>
                                        		</div>
	                                    	</div>
										</div>
										
	                        		</div>
	                        	</sf:form>
	                        </div>
	                    </div>    
                  </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
          
        </div>	
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
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