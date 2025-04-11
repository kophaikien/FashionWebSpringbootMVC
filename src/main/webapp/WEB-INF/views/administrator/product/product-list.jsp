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
                <h5 class="m-b-10">Product</h5>
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
              <h5>List Product</h5>
            </div>
            <div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">

							<div class="card-body">
								<form action="${path }/admin/product/view" method="get">
									<div class="table-responsive">

										<div class="row">
											<div class="col-md-2">
												<div class="form-group mb-4">
													<a href="${path }/admin/product/add" role="button"
														class="btn btn-primary">Add new product</a>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group mb-4">
													<h3>Total products: &nbsp ${searchModel.totalItems }</h3>
												</div>
											</div>

											<div class="col-md-3">
												<div class="form-group mb-4">
													<%-- label>Current page</label--%> 
													<input id="currentPage" type="hidden"
														name="currentPage" class="form-control"
														value="${searchModel.currentPage }">
												</div>
											</div>
											
											<div class="col-md-3">
												<div class="form-group mb-4">
													<%--label>Total items</label--%> 
													<input id="totalItems" type="hidden"
														name="totalItems" class="form-control"
														value="${searchModel.totalItems }">
												</div>
											</div>

										</div>
										<!-- Tìm kiếm -->
										<div class="row">
											<div class="col-md-2">
												<div class="form-group mb-4">
													<!-- 
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<input type="checkbox" class="form-check-input" id="status" name="status" checked="checked" />
			                                        <label for="status">Active</label>
			                                         -->
													<select class="form-control" id="status" name="status">
														<option value="2">All</option>
														<option value="1">Active</option>
														<option value="0">Inactive</option>
													</select>
												</div>
											</div>

											<div class="col-md-2">
												<select class="form-control" id="categoryId"
													name="categoryId" style="margin-right: 10px;">
													<option value="0">All category</option>
													<c:forEach items="${categories }" var="category">
														<option value="${category.id }">${category.name }</option>
													</c:forEach>
												</select>
											</div>

											<div class="col-md-2">
												<input class="form-control" type="date" id="beginDate"
													name="beginDate" />
											</div>
											<div class="col-md-2">
												<input class="form-control" type="date" id="endDate"
													name="endDate" />
											</div>

											<div class="col-md-2">
												<input type="text" class="form-control" id="keyword"
													name="keyword" placeholder="Search keyword" />
											</div>

											<div class="col-md-1">
												<button type="submit" id="btnSearch" name="btnSearch"
													class="btn btn-primary">Search</button>
											</div>
											
											<div class="col-md-1">
												<button type="reset" id="btnClear" name="btnClear"
													class="btn btn-primary">Clear</button>
											</div>
										</div>
										<!-- Hết tìm kiếm -->
									
										<table id="zero_config"
											class="table table-striped table-bordered no-wrap" style="min-width: 1500px">
											<thead>
												<tr align="center">
													<th scope="col">No.</th>
													<th scope="col">Id</th>
													<th scope="col">Category</th>
													<th scope="col">Name</th>
													<th scope="col">Price</th>
													<th scope="col">Sale price</th>
													<th scope="col">Avatar</th>
													<th scope="col">Description</th>
													<th scope="col">Details</th>
													<th scope="col">Create by</th>
													<th scope="col">Update by</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
													<th scope="col">Is hot</th>
													<th scope="col">Seo</th>
													<th scope="col">Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="product" items="${products }"
													varStatus="loop">
													<tr>
														<th scope="row">${loop.index + 1 }</th>
														<td>${product.id }</td>
														<td>${product.category.name }</td>
														<td>${product.name }</td>
														<td align="right"><fmt:formatNumber
																value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
														</td>
														<td align="right">${product.salePrice }</td>

														<td><img width="40px" height="40px"
															src="${path }/UploadFiles/${product.avatar}"
															class="light-logo"></td>
															

														<td>${product.shortDescription }</td>
														<td>${product.detailDescription }</td>
														<td>${product.userCreateProduct.username }</td>
														<td>${product.userUpdateProduct.username }</td>

														<td><fmt:formatDate value="${product.createDate }"
																pattern="dd-MM-yyyy" /></td>
														<td>${product.updateDate }</td>

														<td><span id="_product_status_${product.id }">
																<c:choose>
																	<c:when test="${product.status }">
																		<span>Active</span>
																	</c:when>
																	<c:otherwise>
																		<span>Inactive</span>
																	</c:otherwise>
																</c:choose>
														</span></td>
														<td><span id="_product_isHot_${product.id }">
																<c:choose>
																	<c:when test="${product.isHot }">
																		<span>Yes</span>
																	</c:when>
																	<c:otherwise>
																		<span>No</span>
																	</c:otherwise>
																</c:choose>
														</span></td>
														<td>${product.seo }</td>
														<td><a
															href="${path }/admin/product/edit/${product.id }"
															role="button" class="btn btn-primary">Edit</a> <a
															href="${path }/admin/product/delete/${product.id }"
															role="button" class="btn btn-secondary">Delete</a></td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr align="center">
													<th scope="col">No.</th>
													<th scope="col">Id</th>
													<th scope="col">Category</th>
													<th scope="col">Name</th>
													<th scope="col">Price</th>
													<th scope="col">Sale price</th>
													<th scope="col">Avatar</th>
													<th scope="col">Description</th>
													<th scope="col">Details</th>
													<th scope="col">Create by</th>
													<th scope="col">Update by</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
													<th scope="col">Is hot</th>
													<th scope="col">Seo</th>
													<th scope="col">Actions</th>
												</tr>
											</tfoot>
										</table>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<a href="${path }/admin/product/add" role="button"
														class="btn btn-primary">Add new product</a>
												</div>
											</div>
											<%-- Phan trang --%>
										<%-- Phan trang --%>
											<div class="col-md-6">
												<div class="pagination float-right">
													<div id="paging"></div>
												</div>
											</div>

										</div>
									</div>
								</form>
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
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>


<script type="text/javascript">
		$( document ).ready(function() {
			 console.log("Current Page:", ${searchModel.currentPage});
		        console.log("Total Items:", ${searchModel.totalItems});
		        console.log("Items per Page:", ${searchModel.sizeOfPage});
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

  
</body>