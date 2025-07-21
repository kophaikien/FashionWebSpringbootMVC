
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
	<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	 <style>
	 	* a, * p{
	 		font-family: sans-serif !important; 
	 	}
        .button_add {
            border: none;
            background-color: #fe4c50;
          
        }
        .prouduct_image{ 
        width: 100% !important; 
        }
        
        .button_add:hover {
            background-color:#FE7C7F !important;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${path}/user/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${path}/user/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

<div class="super_container">
	

	<!-- Slider -->

	<div class="main_slider" style="background-image:url(${path}/user/images/slider_1.jpg)">
		<div class="container fill_height">
			<div class="row align-items-center fill_height">
				<div class="col">
					<div class="main_slider_content">
						<h6>Spring / Summer Collection 2017</h6>
						<h1>Giảm Giá đến 30%</h1>
						<div class="red_button shop_now_button"><a href="#">shop now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- New Arrivals -->



	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>New Arrivals</h2>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>

						<!-- Product 1 -->
					<c:forEach items="${products}" var="product" varStatus="status" >
					<c:if test="${product.isNew}">
						<div class="product-item ${product.category.name }">
							<div class="product discount product_filter">
								<div class="product_image">
									<img src="${path }/UploadFiles/${product.avatar}" alt="">
								</div>
								<div class="favorite favorite_left"></div>
								<c:if test="${product.saleValue.percent > 0 }">
								<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>${product.saleValue.percent }%</span></div>
								</c:if>
								<div class="product_info">
									<h6 class="product_name"><a href="${path }/product/${product.id}">${product.name }</a></h6>
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
								</div>
							</div>
							<div class="red_button add_to_cart_button"><a href="${path}/product/${product.id} 	">Xem chi tiết</a></div>
						</div>
					 </c:if>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Deal of the week -->

	<div class="deal_ofthe_week">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="deal_ofthe_week_img">
						<img src="${path}/user/images/deal_ofthe_week.png" alt="">
					</div>
				</div>
				<div class="col-lg-6 text-right deal_ofthe_week_col">
					<div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
						<div class="section_title">
							<h2>Deal Of The Week</h2>
						</div>
						<ul class="timer">
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="day" class="timer_num">03</div>
								<div class="timer_unit">Day</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="hour" class="timer_num">15</div>
								<div class="timer_unit">Hours</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="minute" class="timer_num">45</div>
								<div class="timer_unit">Mins</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="second" class="timer_num">23</div>
								<div class="timer_unit">Sec</div>
							</li>
						</ul>
						<div class="red_button deal_ofthe_week_button"><a href="#">shop now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Best Sellers -->

	<div class="best_sellers">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>Best Sellers</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product_slider_container">
						<div class="owl-carousel owl-theme product_slider">
						       <c:forEach var="product" items="${products}" varStatus="status">
						    <c:if test="${product.isHot}">
						        <div class="owl-item product_slider_item">
						            <div class="product-item ${product.category.name }">
						                <div class="product">
						                    <div class="product_image">
						                        <img src="${path}/UploadFiles/${product.avatar}" alt="">
						                    </div>
						                    <div class="favorite favorite_left"></div>
						                    <div class="product_info">
						                        <h6 class="product_name">
						                            <a href="${path }/product/${product.id}">${product.name}</a>
						                        </h6>
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
						
						                        </div>
						                    </div>
						                </div>
						            </div>
						        
						    </c:if>
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

	<!-- Benefit -->

	

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

	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

</div>
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			let selectedSize = $("input[name='size']:checked").val(); 
			if (!size){ 
				alert("Vui lòng chọn size"); 
				return; 
			}
			alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				id: _productId, //lay theo id
				quantity: _quantity,
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

</html>
