<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Colo Shop</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/WEB-INF/views/user/layout/category_ccs.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

<div class="container product_section_container">
		<div class="row">
			<div class="col product_section clearfix">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="index.html"><i class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li>
					</ul>
				</div>

				<!-- Sidebar -->

				<div class="sidebar">
					<div class="sidebar_section">
						<div class="sidebar_title">
							<h5>Product Category</h5>
						</div>

						<!-- FORM LỌC DỮ LIỆU GỬI QUA URL -->
						

						<ul class="sidebar_categories">
						    <li class="${selectedCategoryId == null ? 'active' : ''}">
						        <a href="#" onclick="setCategoryAndSubmit('')">ALL</a>
						    </li>
						    <c:forEach items="${categories}" var="category">
						        <li class="${category.id == selectedCategoryId ? 'active' : ''}">
						            <a href="#" onclick="setCategoryAndSubmit('${category.id}')">${category.name}</a>
						        </li>
						    </c:forEach>
						</ul>
					</div>
					<form id="filterForm" method="GET" action="${path}/category">
							<input type="hidden" name="categoryId" id="categoryInput" value="${selectedCategoryId}">

							<div class="sidebar_section">
								<div class="sidebar_title">
									<h5>Filter by Name</h5>
								</div>
								<input type="text" name="keyword" id="searchInput" placeholder="Enter product name" style="width: 100%; padding: 8px; margin-bottom: 10px;" value="${param.keyword}">
								<div class="filter_button">
									<span onclick="submitFilter()">search</span>
								</div>
							</div>
						</form>
				</div>

				<!-- Main Content -->

				<div class="main_content">
					<div class="products_iso">
						<div class="row">
							<div class="col">
								<div class="product_sorting_container product_sorting_container_top">
									<ul class="product_sorting">
										<li><span class="type_sorting_text">Default Sorting</span><i class="fa fa-angle-down"></i>
											<ul class="sorting_type">
												<li class="type_sorting_btn"><span>Default Sorting</span></li>
												<li class="type_sorting_btn"><span>Price</span></li>
												<li class="type_sorting_btn"><span>Product Name</span></li>
											</ul>
										</li>
										<li><span>Show</span><span class="num_sorting_text">6</span><i class="fa fa-angle-down"></i>
											<ul class="sorting_num">
												<li class="num_sorting_btn"><span>6</span></li>
												<li class="num_sorting_btn"><span>12</span></li>
												<li class="num_sorting_btn"><span>24</span></li>
											</ul>
										</li>
									</ul>
									<div class="pages d-flex flex-row align-items-center">
										<div class="page_current">
											<span>1</span>
											<ul class="page_selection">
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
											</ul>
										</div>
										<div class="page_total"><span>of</span> 3</div>
										<div id="next_page" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
									</div>
								</div>

								<div class="product-grid">
									<c:forEach items="${products }" var="product">
										<div class="product-item mix ${fn:replace(product.category.name, ' ', '-')}">
											<div class="product discount product_filter">
												<div class="product_image">
													<img src="${path }/UploadFiles/${product.avatar}" alt="">
												</div>
												<div class="favorite favorite_left"></div>
											<c:if test="${product.saleValue.percent > 0 }">
												<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>${product.saleValue.percent }%</span></div>
												</c:if>
												<div class="product_info">
													<h6 class="product_name"><a href="single.html">${product.name }</a></h6>
													<c:choose>
														<c:when test="${product.salePrice lt product.price && product.salePrice > 0}">
															<div class="product_price"><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ"/><span><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/></span></div>
														</c:when>
														<c:when test="${product.salePrice <= 0 }">
															<div class="product_price"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/></div>
														</c:when>
													</c:choose>
												</div>
											</div>
											<div class="red_button add_to_cart_button"><a href="${path}/product/${product.id}">Xem chi tiết</a></div>
										</div>
									</c:forEach>
								</div>

								<div class="product_sorting_container product_sorting_container_bottom clearfix">
									<ul class="product_sorting">
										<li><span>Show:</span><span class="num_sorting_text">04</span><i class="fa fa-angle-down"></i>
											<ul class="sorting_num">
												<li class="num_sorting_btn"><span>01</span></li>
												<li class="num_sorting_btn"><span>02</span></li>
												<li class="num_sorting_btn"><span>03</span></li>
												<li class="num_sorting_btn"><span>04</span></li>
											</ul>
										</li>
									</ul>
									<span class="showing_results">Showing 1–3 of 12 results</span>
									<div class="pages d-flex flex-row align-items-center">
										<div class="page_current">
											<span>1</span>
											<ul class="page_selection">
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
											</ul>
										</div>
										<div class="page_total"><span>of</span> 3</div>
										<div id="next_page_1" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="newsletter" style="padding: 20px 0;" >
		<div class="container">
			<div class="row">
				<div style="text-align: center;width:100%">
				    <h2 style="font-size: 24px; margin-bottom: 10px;">Cảm ơn bạn đã ghé thăm!</h2>
				    <p style="font-size: 16px; color: #555;">Chúng tôi luôn sẵn sàng mang đến những sản phẩm tốt nhất cho bạn.</p>
				  </div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/user/layout/category_js.jsp"></jsp:include>

	<script>
		function setCategoryAndSubmit(categoryValue) {
			document.getElementById('categoryInput').value = categoryValue;
			document.getElementById('filterForm').submit();
		}

		function submitFilter() {
			document.getElementById('filterForm').submit();
		}
	</script>

</body>
</html>
