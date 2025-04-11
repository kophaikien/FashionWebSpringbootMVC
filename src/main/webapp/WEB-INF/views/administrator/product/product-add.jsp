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
                <h5 class="m-b-10">Add Product</h5>
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
				
                <div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${path }/admin/product/add-save" method="post" 
	                        	modelAttribute="product" enctype="multipart/form-data">
	                        		 
	                        		 <div class="form-body">
	                        			<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="category">Select category</label>
			                                        <sf:select path="category.id" class="form-control" id="category">
			                                            <sf:options items="${categories }" itemValue="id" itemLabel="name"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Product name</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name" placeholder="product name"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="price">Price</label>
			                                        <sf:input path="price" type="number" autocomplete="off" id="price" name="price" class="form-control" placeholder="price"></sf:input>
                                        		</div>
	                                    	</div>
										
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="salePrice">Sale price</label>
			                                        <sf:input path="salePrice" type="number" autocomplete="off" id="salePrice" name="salePrice" class="form-control" placeholder="Sale price"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="create">Create by</label>
			                                        <sf:select path="userCreateProduct.id" class="form-control" id="createBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="update">Update by</label>
			                                        <sf:select path="userUpdateProduct.id" class="form-control" id="updateBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate">Create date</label>
			                                        
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updatedate">Update date</label>
			                                       
			                                        <sf:input path="updateDate" class="form-control" type="date" 
			                                        			id="updateDate" name="updateDate"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description">Description</label>
			                                        <sf:textarea path="shortDescription" id="shortDescription" name="shortDescription"
																class="form-control" rows="3" placeholder="Short desription..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="detailDescription">Detail description</label>
			                                        <sf:textarea path="detailDescription" id="detailDescription" name="detailDescription"
																class="form-control" rows="3" placeholder="detail desription..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-2">
												<div class="form-group mb-4">
													<label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="isHot" class="form-check-input" id="isHot" name="isHot"></sf:checkbox>
			                                        <label for="isHot">Is a hot product?</label>
			                                       
                                        		</div>
	                                    	</div>
	                                    	
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
			                                        <label for="avatarFile">Choose product Avatar</label>
                                    				<input id="avatarFile" name="avatarFile" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" 
                                    				class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <a href="${root }/admin/product/view" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Back to list
			                                        </a>
                                    				<button type="submit" class="btn btn-primary">Save Add Product</button>
                                        		</div>
	                                    	</div>
										</div>
										
	                        		</div>
	                        	</sf:form>
	                        </div>
	                    </div>    
                  </div> 
				
				</div>

				<!-- End PAge Content -->
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