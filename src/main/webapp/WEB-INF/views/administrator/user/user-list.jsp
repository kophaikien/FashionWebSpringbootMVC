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
                <h5 class="m-b-10">Quản Lý Tài Khoản</h5>
              </div>
              <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="../dashboard/index.html">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="javascript: void(0)">Quản Lý Tài Khoản</a></li>
                <li class="breadcrumb-item" aria-current="page">Danh Sách Tài Khoản</li>
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
              <h5>List Role</h5>
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
                                <div class="table-responsive">
                               
                                
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Id</th>
                                                <th scope="col">Tên đăng nhập</th>
                                                <th scope="col">Mật Khẩu</th>
                                                <th scope="col">Tên Người Dùng</th>
                                                <th scope="col">Số điện thoại</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Địa chỉ</th>
                                                <th scope="col">Ngày Tạo</th>
                                                <th scope="col">Ngày Cập Nhật</th>
                                                <th scope="col">Action</th>                                           
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="user" items="${users }" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${user.id }</td>
		                                        	<td>${user.username }</td>
		                                        	<td>${user.password }</td>
		                                        	<td>${user.name }</td>
		                                        	<td>${user.mobile }</td>
		                                        	<td>${user.email }</td>
		                                        	<td>${user.address }</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${user.createDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${user.updateDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>${user.description }</td>
	                                        		<td>
	                                        			<a href="${path }/admin/user/edit/${user.id }" role="button" 
	                                                							class="btn btn-primary">Edit</a>
	                                                	<a href="${path }/admin/user/delete/${user.id }" role="button" 
	                                                							class="btn btn-secondary">Delete</a>
	                                        		</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                        
                                    </table>
 	                            </div>
                            </div>
                        </div>
                    </div>
                </div>
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