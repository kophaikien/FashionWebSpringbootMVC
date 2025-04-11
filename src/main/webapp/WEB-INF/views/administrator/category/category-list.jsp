 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <h5 class="m-b-10">Category</h5>
              </div>
              <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="../dashboard/index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="javascript: void(0)">Category</a></li>
                <li class="breadcrumb-item" aria-current="page">List Category</li>
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
              <h5>List Category</h5>
            </div>
            <div class="card-body">
              <div class="row gy-4">
                <div class="table-responsive">
                               	<div class="row">
                       		 		<div class="col-md-6">
										<div class="form-group mb-4">
	                                        <a href="${path }/admin/category/add" role="button" class="btn btn-primary">Add New Category</a>
                                      	</div>
                                   	</div>
									
                                    <div class="col-md-6">
	                                    <ul class="pagination float-right">
	                                        <li class="page-item disabled">
	                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
	                                        </li>
	                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                                        <li class="page-item">
	                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
	                                        </li>
	                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                        <li class="page-item">
	                                            <a class="page-link" href="#">Next</a>
	                                        </li>
	                                    </ul>
                                    </div>
                                </div>
                                
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Id</th>
                                                <th scope="col">Name</th>    
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th>
                                                <th scope="col">Status</th>  
                                                <th scope="col">Description</th>
                                                <th scope="col">Actions</th>                                              
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="category" items="${categories }" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${category.id }</td>
		                                        	<td>${category.name }</td>
		                                        	<td>${category.userCreateCategory.username }</td>
		                                        	<td>${category.userUpdateCategory.username }</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${category.createDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${category.updateDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<c:choose>
		                                        			<c:when test="${category.status }">
		                                        				<span>Active</span>
		                                        			</c:when>
		                                        			<c:otherwise>
		                                        				<span>Inactive</span>
		                                        			</c:otherwise>
		                                        		</c:choose>
		                                        		</td>
	                                        		<td>${category.description }</td>
	                                        		<td>
	                                        			<a href="${path }/admin/category/edit/${category.id }" role="button" 
	                                                							class="btn btn-primary">Edit</a>
	                                                	<a href="${path }/admin/category/delete/${category.id }" role="button" 
	                                                							class="btn btn-secondary">Delete</a>
	                                        		</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Id</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Actions</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    
                                    <div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <a href="${path }/admin/category/add" role="button" class="btn btn-primary">Add New Category</a>
                                        		</div>
	                                    	</div>
										
	                                    <div class="col-md-6">
		                                    <ul class="pagination float-right">
		                                        <li class="page-item disabled">
		                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
		                                        </li>
		                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
		                                        <li class="page-item">
		                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
		                                        </li>
		                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
		                                        <li class="page-item">
		                                            <a class="page-link" href="#">Next</a>
		                                        </li>
		                                    </ul>
	                                    </div>
	                                    </div>
	                                    </div>
                </div>
              </div>
            </div>
          </div>
          </div>
        </div>
        <!-- [ link-button ] end -->
      </div>
      <!-- [ Main Content ] end -->
<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${searchModel.status});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#categoryId").val(${searchModel.categoryId});
			//Dat gia tri cua keyword ung voi dieu kien search truoc do
			$("#keyword").val('${searchModel.keyword}');	
			$("#beginDate").val('${searchModel.beginDate}');
			$("#endDate").val('${searchModel.endDate}');
			
			$("#paging").pagination({
				currentPage: ${searchModel.currentPage }, //Trang hien tai
				items: ${searchModel.totalItems }, //Tong so san pham (total products)
				itemsOnPage: ${searchModel.sizeOfPage },
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
 <jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>

  <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>