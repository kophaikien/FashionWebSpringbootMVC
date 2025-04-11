 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- [Head] start -->

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
<!-- [Head] end -->
<!-- [Body] Start -->

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
                <h5 class="m-b-10">Edit Category</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
 		<div class="row">
        <!-- [ link-button ] start -->
        <div class="col-sm-12">
          <div class="card">
         
              <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- basic table -->
               	<div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${path }/admin/category/edit-save" method="post" modelAttribute="category" enctype="multipart/form-data">
	                        		 <div class="form-body">
	                        		 
	                        		 	<sf:hidden path="id"/> <!-- id > 0 -> Edit -->
	                        		 	
	                        			<div class="row">
	                                    	
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Category name</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name" placeholder="category name"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="category">Create by</label>
			                                        <sf:select path="userCreateCategory.id" class="form-control" id="userCreateCategory">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="category">Update by</label>
			                                        <sf:select path="userUpdateCategory.id" class="form-control" id="userUpdateCategory">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createDate">Create date</label>
			                                        
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updateDate">Update date</label>
			                                       
			                                        <sf:input path="updateDate" class="form-control" type="date" 
			                                        			id="updateDate" name="updateDate"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description">Description</label>
			                                        <sf:textarea path="description" id="description" name="description"
																class="form-control" rows="3" placeholder="desription..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                                    	
	                                    	<div class="col-md-10">
												<div class="form-group mb-4">
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                                        <label for="status">Active</label>			                                       
                                        		</div>
	                                    	</div>
	                                    	
										</div>
										
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <a href="${path }/admin/category/view" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Back to list
			                                        </a>
                                    				<button type="submit" class="btn btn-primary">Save edit category</button>
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
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
            </div>
          </div>
          </div>
        </div>
        <!-- [ link-button ] end -->
      </div>
      <!-- [ Main Content ] end -->

 <jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>

  <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>