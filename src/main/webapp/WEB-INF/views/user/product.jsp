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
<link rel="stylesheet" type="text/css" href="${path }/user/styles/single_responsive.css">

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
					<div class="original_price">${product.salePrice } %</div>
					<div class="product_price">${ product.price}</div>
					<ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul>
					
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
							<li class="tab" data-active-tab="tab_3"><span>Reviews (2)</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">

					<!-- Tab Description -->

					<div id="tab_1" class="tab_container active">
    <div class="row align-items-center">
        <!-- Hình ảnh sản phẩm -->
        <div class="col-lg-6 text-center">
            <img src="${path}/UploadFiles/${productImages[0].path}" alt="Product Image" class="img-fluid">
        </div>
        <!-- Nội dung mô tả sản phẩm -->
        <div class="col-lg-6">
            <h2>${ $product.name }</h2>
            <p>${ $product.detailDescription }</p>
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
								<p>COLOR:<span>Gold, Red</span></p>
								<p>SIZE:<span>L,M,XL</span></p>
							</div>
						</div>
					</div>

					<!-- Tab Reviews -->

					<div id="tab_3" class="tab_container">
						<div class="row">

							<!-- User Reviews -->

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>Reviews (2)</h4>
								</div>

								<!-- User Review -->

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>

								<!-- User Review -->

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</div>

							<!-- Add Review -->

							<div class="col-lg-6 add_review_col">

								<div class="add_review">
									<form id="review_form" action="post">
										<div>
											<h1>Add Review</h1>
											<input id="review_name" class="form_input input_name" type="text" name="name" placeholder="Name*" required="required" data-error="Name is required.">
											<input id="review_email" class="form_input input_email" type="email" name="email" placeholder="Email*" required="required" data-error="Valid email is required.">
										</div>
										<div>
											<h1>Your Rating:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="message"  placeholder="Your Review" rows="4" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">submit</button>
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

	<!-- Benefit -->

	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
						<h4>Newsletter</h4>
						<p>Subscribe to our newsletter and get 20% off your first purchase</p>
					</div>
				</div>
				<div class="col-lg-6">
					<form action="post">
						<div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
							<input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
							<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		addToCart = function(_productId, _productName) {		
			
			alert("Thêm "  + $("#quantity_value").text() + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				id: _productId, //lay theo id
				quantity: $("#quantity_value").text(),
				name: _productName,
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