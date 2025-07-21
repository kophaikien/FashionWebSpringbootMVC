<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
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
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="${path }/user/styles/bootstrap4/bootstrap.min.css">
<link href="${path }/user/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${path }/user/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${path }/user/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${path }/user/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="${path }/user/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="${path }/user/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${path }/user/styles/single_styles.css">
<link rel="stylesheet" type="text/css" href="${path }/user/styles/main_styles.css">

<link rel="stylesheet" type="text/css" href="${path }/user/styles/single_responsive.css">
<style>
  
.size-options {
  display: flex;
  gap: 10px;
}

.size-button {
  position: relative;
  cursor: pointer;
}

/* Ẩn radio input */
.size-button input[type="radio"] {
  display: none;
}

/* Giao diện nút */
.size-button span {
  display: inline-block;
  padding: 10px 15px;
  color: #000;
  transition: background-color 0.2s, color 0.2s;
}

/* Khi được chọn */
.size-button input[type="radio"]:checked + span {
  border-bottom: 1px solid #000;
}

</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="categories.html"><i class="fa fa-angle-right" aria-hidden="true"></i>${product.category.name}'s</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Single Product</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-7">
    <div class="single_product_pics">
        <div class="row">
            <!-- Danh sách ảnh nhỏ -->
            <div class="col-lg-3 thumbnails_col order-lg-1 order-2">
                <div class="single_product_thumbnails">
                    <ul>
                        <c:forEach var="image" items="${productImages}" varStatus="status">
                            <li class="${status.first ? 'active' : ''}">
                                <img src="${path}/UploadFiles/${image.path}" 
                                     alt="Product Image" 
                                     data-image="${path}/UploadFiles/${image.path}">
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
            <!-- Ảnh chính hiển thị -->
            <div class="col-lg-9 image_col order-lg-2 order-1">
                <div class="single_product_image">
                    <div class="single_product_image_background" 
                         style="background-image:url('${path}/UploadFiles/${productImages[0].path}')">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>${ product.name}</h2>
						<p>${product.shortDescription }</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center">
						<span class="ti-truck"></span><span>free delivery</span>
					</div>
									<c:choose>
									    <c:when test="${product.salePrice lt product.price && product.salePrice > 0}">
												<div class="product_price"><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ"/>
												 <span><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/> 
												</span></div>
									    </c:when>
									    <c:when test="${product.salePrice <= 0 }">
									
									   <div class="product_price">
									    		<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/> 
									    		</div>
									    </c:when>
									</c:choose>

					<div class="size-options">
					<span style="line-height: 44px">Select Size:</span>
						<c:forEach items="${product.variants}" var="variant">
						<label class="size-button">
					      <input type="radio" name="size" value="variant.size" />
					      <span>${variant.size }</span>
					    </label>
						</c:forEach>
					    
					  </div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span>Quantity:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
							<span id="quantity_value">1</span>
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						</div>
					
						
					</div>
					<button   class="button_add " style="margin: 20px 0;/* display:block; */width: 50%;" type="button"  onclick="addToCart(${product.id },'${product.name }')">add to cart</button>
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center" style="margin-left:0; "></div>
				</div>
			</div>
		</div>

	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>Description</span></li>
							<li class="tab" data-active-tab="tab_2"><span>Additional Information</span></li>
							<li class="tab" data-active-tab="tab_3"><span>Reviews</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<!-- Tab Description -->
					<div id="tab_1" class="tab_container active">
					    <div class="row align-items-center">
					        <!-- Nội dung mô tả sản phẩm -->
					        <div class="col-lg-6">
					            <h2>${product.name }</h2>
					            <p>${product.additionalInfo }</p>
					        </div>
					       
					    </div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row">
							<div class="col additional_info_col">
								<div class="tab_title additional_info_title">
									<h4>Additional Information</h4>
								</div>
								<p>SIZE:<span>
								<c:forEach items="${product.variants }" var="variant" varStatus="status">
									${variant.size } <c:if test="${!status.last}">, </c:if>
								</c:forEach>
								</span></p>
							</div>
						</div>
					</div>

					<!-- Tab Reviews -->

					<div id="tab_3" class="tab_container">
						<div class="row">

							<!-- User Reviews -->

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>Reviews </h4>
								</div>

								<!-- User Review -->

								<c:forEach var="review" items="${reviewList}">
								  <div class="user_review_container d-flex flex-column flex-sm-row mb-3">
								    <div class="user">
								      <div class="user_pic">
								        <img alt="Avatar người dùng"
								             class="rounded-circle"
								             height="48"
								             src="${path}/${review.user.avatar}" 
								             width="48"/>
								      </div>
								      <div class="user_rating">
								        <ul class="star_rating">
								          <c:set var="rating" value="${review.rating}" />
								          <c:forEach begin="1" end="5" var="i">
								            <c:choose>
								              <c:when test="${rating >= i}">
								                <li><i class="fa fa-star" style="color:#FFD700;"></i></li>
								              </c:when>
								              <c:when test="${rating >= i - 0.5}">
								                <li><i class="fa fa-star-half-o" style="color:#FFD700;"></i></li>
								              </c:when>
								              <c:otherwise>
								                <li><i class="fa fa-star-o" style="color:#FFD700;"></i></li>
								              </c:otherwise>
								            </c:choose>
								          </c:forEach>
								        </ul>
								      </div>
								    </div>
								    <div class="review pl-3">
								      <div class="review_date">
								        <fmt:formatDate value="${review.reviewDate}" pattern="dd/MM/yyyy"/>
								      </div>
								      <div class="user_name">${review.user.name}</div>
								      <p>${review.comment}</p>
								    </div>
								  </div>
								</c:forEach>

							</div>

							<!-- Add Review -->

							

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<!-- Suggested Products -->
		<div class="best_sellers">
		    <div class="container">
		        <div class="row">
		            <div class="col text-center">
		                <div class="section_title new_arrivals_title">
		                    <h2>Sản phẩm gợi ý cho bạn</h2>
		                </div>
		            </div>
		        </div>
		        <div class="row">
		            <div class="col">
		                <div class="product_slider_container">
		                    <div class="owl-carousel owl-theme product_slider">
		                        <c:forEach var="product" items="${suggestedProducts}">
		                            <div class="owl-item product_slider_item">
		                                <div class="product-item ${product.category.name}">
		                                    <div class="product">
		                                        <div class="product_image" style="height: 200px"; >
		                                            <img src="${path}/UploadFiles/${product.avatar}" alt="">
		                                        </div>
		                                        <div class="favorite favorite_left"></div>
		                                        <div class="product_info">
		                                            <h6 class="product_name">
		                                                <a href="${path}/product/${product.id}">${product.name}</a>
		                                            </h6>
		                                            <c:choose>
		                                                <c:when test="${product.salePrice lt product.price}">
		                                                    <div class="original_price">
		                                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/>
		                                                    </div>
		                                                    <div class="product_price">
		                                                        <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ"/>
		                                                    </div>
		                                                </c:when>
		                                                <c:otherwise>
		                                                    <div class="product_price">
		                                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/>
		                                                    </div>
		                                                </c:otherwise>
		                                            </c:choose>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </c:forEach>
		                    </div>
		
		                    <!-- Slider Navigation -->
		                    <div class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
		                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
		                    </div>
		                    <div class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
		                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	
	<!-- Newsletter -->

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
		<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
			<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		addToCart = function(_productId, _productName) {
			let selectedSize = $("input[name='size']:checked").closest("label").find("span").text().trim();
			console.log("Size được chọn: " + selectedSize);			
			let qty = jQuery("#quantity_value").text().trim();
			if (!selectedSize){ 
				alert("Vui lòng chọn size"); 
				return; 
			}
			alert("Thêm " + qty + " sản phẩm '" + _productName + "' size: " + selectedSize + " vào giỏ hàng");

			let data = {
				id: _productId, //lay theo id
				quantity: qty,
				name: _productName,
				size: selectedSize, 
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProducts").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
	</body>