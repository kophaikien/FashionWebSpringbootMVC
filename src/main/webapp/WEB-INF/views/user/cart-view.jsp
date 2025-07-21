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
	<link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    rel="stylesheet"
  />
  <link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet"
  />
	<style>
	.summary  span{ 
		font-size: 13px; 
	}
    body {
      font-family: 'Inter', sans-serif, Arial, sans-serif;
      font-size: 0.875rem;
      color: #4a5568;
      background-color: #fff;
      margin-top: 200px
    }
    label {
      font-weight: 500;
      font-size: 0.75rem;
    }
    .required {
      color: #e53e3e;
    }
    .form-control,
    select {
      font-size: 0.75rem;
      height: calc(1.5em + 0.5rem + 2px);
    }
    .form-check-label {
      font-size: 0.75rem;
      font-weight: 500;
    }
    .btn-order {
      background-color: #f56565;
      border-color: #f56565;
      font-weight: 600;
      font-size: 0.875rem;
    }
    .btn-order:hover {
      background-color: #c53030;
      border-color: #c53030;
    }
    .text-xs {
      font-size: 0.75rem;
    }
    .text-red {
      color: #e53e3e;
    }
    .text-blue {
      color: #3182ce;
    }
    .text-blue-light {
      color: #63b3ed;
    }
    .text-gray-light {
      color: #a0aec0;
    }
    .text-gray-dark {
      color: #2d3748;
    }
    .line-through {
      text-decoration: line-through;
    }
    .small-text {
      font-size: 0.65rem;
    }
    .border-blue {
      border-color: #63b3ed !important;
    }
    .bg-blue-light {
      background-color: #ebf8ff;
    }
    .cursor-pointer {
      cursor: pointer;
    }
    .product-qty {
      width: 3rem;
      font-size: 0.75rem;
      padding: 0.125rem 0.25rem;
      text-align: center;
    }
    .product-img {
      width: 50px;
      height: 50px;
      object-fit: contain;
      border-radius: 0.25rem;
      background: #f0f0f0;
    }
    .trash-btn {
      color: #a0aec0;
      border: none;
      background: transparent;
      font-size: 1rem;
      cursor: pointer;
    }
    .trash-btn:hover {
      color: #4a5568;
    }
    .icon-question {
      color: #a0aec0;
      margin-left: 0.25rem;
      font-size: 0.75rem;
    }
    .rating-stars i {
      color: #ecc94b;
      font-size: 1rem;
    }
    .alert-icon {
      color: #f56565;
      font-size: 1.25rem;
      margin-right: 0.5rem;
    }
    @media (min-width: 992px) {
      main{ 
      	max-width: 1140px; 
      	gap: 1.5 rem; 
      }
      form {
        flex: 2;
      }
      section.summary {
        flex: 1;
      }
    }
    .main_content{ 
    	display: flex; 
    	max-width: 1140px; 
    }
    form > input{ 
     height: 40px; 
    }
    .form-control{
    height: 35px; }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
<div class="main__products-title text-center">
		<p>GIỎ HÀNG CỦA BẠN</p>
	</div>
  <main class="container-fluid px-3" style="height: 500px">
	<c:choose>
		<c:when test="${totalCartProducts > 0}">
		<div class="main_content" style="width: 100%; padding-right: 0">
			    <form novalidate autocomplete="off" class="mb-4 mr-3">
			      <!-- Row 1 -->
			      <div class="form-row">
			        <div class="form-group col-md-6">
			          <label for="fullname">Họ và tên <span class="required">*</span></label>
			          <input
			            type="text"
			            class="form-control"
			            id="txtName"
			            name="fullname"
			            placeholder="Họ và tên"
			            required
			          />
			        </div>
			        <div class="form-group col-md-6">
			          <label for="email">Email</label>
			          <input
			            type="email"
			            class="form-control"
			            id="txtEmail"
			            name="email"
			            placeholder="email"
			          />
			        </div>
			      </div>
			      <!-- Row 2 -->
			      <div class="form-row">
			        <div class="form-group col-md-6">
			          <label for="phone1"> Số Điện thoại người nhận <span class="required">*</span></label>
			          <input
			            type="text"
			            class="form-control"
			            id="txtMobile1"
			            name="phone1"
			            placeholder="Số Điện thoại"
			          />
			        </div>
			        <div class="form-group col-md-6">
			          <label for="phone2"> Số Điện thoại 2</label>
			          <input
			            type="text"
			            class="form-control"
			            id="txtMobile2"
			            name="phone2"
			            placeholder="Số điện thoại dự phòng"
			          />
			        </div>
			      </div>
			      <!-- Row 3 -->
			          <div class="form-group">
			        <label for="address">Địa chỉ chi tiết <span class="required">*</span></label>
			        <input
			          type="text"
			          class="form-control"
			          id="txtAddress"
			          name="address"
			          placeholder="Tên phố/xóm, số nhà"
			        />
			      </div>
			     
			      <!-- Phương thức thanh toán -->
			      <fieldset class="mb-3">
			        <legend class="font-weight-bold small-text">Phương thức thanh toán</legend>
			        <div class="form-check">
			          <input
			            class="form-check-input"
			            type="radio"
			            name="payment"
			            id="cod"
			            value="cod"
			            checked
			          />
			          <label class="form-check-label small-text" for="cod">
			            Thanh toán khi nhận hàng
			          </label>
			        </div>
			        <div class="form-check">
			          <input
			            class="form-check-input"
			            type="radio"
			            name="payment"
			            id="bank"
			            value="bank"
			          />
			          <label class="form-check-label small-text" for="bank">
			            Thanh toán chuyển khoản
			          </label>
			        </div>
			      </fieldset>
			      <!-- Đặt hàng button -->
			      <button type="button" onclick="_placeOrder()" class="btn btn-order btn-block mb-2">
			        ĐẶT HÀNG
			      </button>
			    </form>
			    <section class="summary border rounded p-3">
			      <!-- VitalCare -->
			      <div class="mb-3 " style="max-height: 250px; overflow: auto;" >
			        <!-- Product 1 -->
			        <div class="list_cart_product">
			       <c:forEach var="item" items="${cartItems}">
					    <div class="d-flex mb-3 align-items-start">
					        <div>
					            <div
					                class="product-img bg-light d-inline-block mr-2"
					                aria-label="Product image of ${item.name}"
					            >
					                <img src="${path }/UploadFiles/${item.avatar}" alt="${item.name}" width="100%" height="100%" />
					            </div>
					        </div>
					        <div class="flex-grow-1" style="font-size: 0.6875rem; line-height: 1.2;">
					            <p class="font-weight-bold mb-1 text-dark">
					                ${item.name} &nbsp/<span class="sizeCartProduct">Size: ${item.size}</span>
					            </p>
					            <c:choose>
					            	<c:when test="${item.price > item.salePrice and item.salePrice > 0  }">
					            	<div class="text-muted line-through mb-1">${ item.price}</div>
					            	<div class="d-flex align-items-center font-weight-bold text-dark">
					                <span>${item.salePrice}₫</span>
					                <span class="mx-1">×</span>
					                <input
					                    type="number"
					                    min="1"
					                    value="${item.quantity}"
					                    class="product-qty form-control"
					                    id ="productQuantity_${item.id }_${item.size}"
					                    data-product-id="${item.id }"
					                    data-size="${item.size }"
					                /> </div>
					            	</c:when>
					            	
					            <c:otherwise>
					            <div class="d-flex align-items-center font-weight-bold text-dark">
					                <span>${item.price}₫</span>
					                <span class="mx-1">×</span>
					                <input
					                    type="number"
					                    min="1"
					                    value="${item.quantity}"
					                    class="product-qty form-control"
					                    id ="productQuantity_${item.id }_${item.size}"
					                    data-product-id="${item.id }"
					                    data-size="${item.size }"
					                />
					                 
					            </div>
					            </c:otherwise>
					            </c:choose>
					            <div class=" d-flex justify-content-end font-weight-bold small-text mb-2 mt-3">
								        <span>Tổng số tiền: &nbsp</span>
								 <%-- <span id= "totalPrice_${item.id }_${item.size}">${totalCartPrice }₫</span>--%>       
								        <span id="totalPrice_${item.id}_${item.size}">
											 <span id="totalPrice_${item.id}_${item.size}">
												<c:choose>
												    <c:when test="${item.salePrice > 0 and item.salePrice < item.price}">
												        <fmt:formatNumber value="${item.salePrice * item.quantity}" minFractionDigits="0" /> <span>đ</span>
												    </c:when>
												    <c:otherwise>
												        <fmt:formatNumber value="${item.price * item.quantity}" minFractionDigits="0" /> <span>đ</span>
												    </c:otherwise>
												</c:choose>
											</span>

										</span>

								      </div>
					        </div>
					          <a class="delete-btn ml-2 mt-1" href="${path }/delete/${item.id}?size=${item.size}">
					          <i class="fas fa-trash-alt"></i>
					          </a>  
					    </div>
					</c:forEach>
			      </div>
			      </div>
			
			      <!-- Mã giảm giá của Shop -->
			      <p class="mb-1 small-text">Được đồng kiểm</p>
			      <div class="d-flex justify-content-between font-weight-bold small-text mb-1">
			        <span>Tổng tiền cần thanh toán</span>
			        <span class="text-danger font-weight-bold" id="totalCartPrice"><fmt:formatNumber
														value="${totalCartPrice}"
														minFractionDigits="0" />đ</span> 
										
			      </div>
			    </section>
			    </div>
			    </c:when>
						<c:otherwise>
						<div >
							<div class="row" style="width: 100%; ">
								<div class="col-12">
									<c:choose>
										<c:when test="${checkout }">
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span id="placeOrderSuccess">Bạn đã đặt hàng thành
													công</span>
											</h3>
										</c:when>
										<c:otherwise>
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span>${message }</span>
											</h3>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="row">
								<div class="col-md-12" align="center">
									<div class="form-group mb-4 mt-5">
										<a href="${path }/index" class="btn btn-primary active"
											role="button" aria-pressed="true"> Back to shop </a>
									</div>
								</div>
							</div>
						</div>
						</c:otherwise>
					</c:choose>
  </main>
		  <div class="newsletter">
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
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script type="text/javascript">

	$(".product-qty").on("change", function () {
	    let $inp = $(this);
	    let productId = $inp.data("product-id");
	    let size = $inp.data("size");
	    let quantity = $inp.val();
		console.log("Cập nhật số lượng giỏ hang",{productId, size, quantity})
	    $.ajax({
	        url: "/update-product-quantity",
	        method: "POST",
	        contentType: "application/json",
	        data: JSON.stringify({ id: productId, size: size, quantity: quantity }),
	        success: function (jsonResult) {
	        	
	            $("#productQuantity_" + productId + "_" + size).val(jsonResult.newQuantity);
	            $("#totalPrice_" + productId + "_" + size).html(jsonResult.totalPrice +"<span>đ</span>");
	            $("#totalCartPrice").html(jsonResult.totalCartPrice + "<span>đ</span>");
	            $("#totalCartProducts").html(jsonResult.totalCartProducts);
	        },
	        error: function () {
	            alert("Lỗi cập nhật số lượng sản phẩm");
	        }
	    });
	});

</script>


	<script type="text/javascript">
		function _placeOrder() {
			//javascript object
			 const rawText = $("#totalCartPrice").text(); // ví dụ: "150000đ"
       		 const amount = parseInt(rawText.replace(/[^\d]/g, ''), 10); // bỏ ký tự không phải số
			const selectedPayment = $("input[name='payment']:checked").val(); 
			let data = {				
				name : jQuery("#txtName").val(),
				email : jQuery("#txtEmail").val(), //Get by Id
				mobile : jQuery("#txtMobile1").val(),
				address : jQuery("#txtAddress").val(),
				paymentMethod: selectedPayment, 
				amount: amount
			};
			console.log(data); 
			
			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
			        if (selectedPayment === "bank"){
					window.location.href = "${path}/pay?amount=" + jsonResult.amount;
			        }else{ 
			        	window.location.href = "${path}/index"; 
			        }
			        
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
	
	</body>