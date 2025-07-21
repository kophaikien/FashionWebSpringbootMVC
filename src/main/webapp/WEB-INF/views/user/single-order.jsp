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
		<jsp:include page="/WEB-INF/views/user/layout/single-order_css.jsp"></jsp:include>
	<style>
	.btn-status {
	  padding: 8px 16px;
	  border: none;
	  border-radius: 5px;
	  color: white;
	  font-weight: bold;
	}
	
	.btn-status.red {
	  background-color: #e74c3c; /* màu đỏ */
	}
	
	.btn-status.black {
	  background-color: #2c3e50; /* màu đen hoặc xám đậm */
	}
		.popup {
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: #fff;
	    z-index: 1000;
	    padding: 30px;
	    border-radius: 10px;
	    max-width: 600px;
	    width: 90%;
	    box-shadow: 0 0 10px rgba(0,0,0,0.25);
	  }

  .overlay {
    position: fixed;
    top: 0; left: 0;
    width: 100vw; height: 100vh;
    background-color: rgba(0, 0, 0, 0.6);
    z-index: 999;
  }

  .hidden {
    display: none;
  }

  .close-btn {
    float: right;
    font-size: 28px;
    cursor: pointer;
    color: #333;
  }

  .user_star_rating li {
    display: inline-block;
    cursor: pointer;
    font-size: 24px;
    color: #ccc;
    transition: color 0.3s;
  }

  .user_star_rating li.selected i {
    color: #FFD700;
  }

  .input_review {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    resize: vertical;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .review_submit_btn {
    background-color: #ff4c3b;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
  }

  .review_submit_btn:hover {
    background-color: #e04334;
  }
	.order-item {
  position: relative;
  background: #fff;
  border: 1px solid #eee;
}

.order-item .btn-outline-primary {
  font-size: 13px;
  padding: 3px 10px;
  border-radius: 5px;
  transition: all 0.3s ease-in-out;
}

.order-item .btn-outline-primary:hover {
  background-color: #007bff;
  color: white;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
<div class="contact_page bg-light">
	<div class="container contact_container">
		<div class="row">
						<div class=" col" style="height: 80px;">

				<!-- Breadcrumbs -->

				<div class="container breadcrumbs d-flex flex-row align-items-center">
					<ul class="pl-0">
						<li><a href="index.html">Trang chủ</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Thông tin tài khoản</a></li>
					</ul>
				</div>

			</div>
		</div>
	<!-- account -->
	 <main class="container my-4 d-flex flex-column  flex-md-row gap-4">
   <!-- Sidebar -->
   <aside class="flex-shrink-0 rounded pt-3 pb-3" style="width: 250px;">
    <!-- User info -->
    <div class="d-flex align-items-center gap-3 mb-4">
     <img alt="Avatar hình minh họa người đàn ông đeo kính, tóc đen, mặc áo sơ mi xanh và cà vạt đỏ" class="rounded-circle" height="48" src="${path}/UploadFiles/${loginedUser.avatar}" width="48"/>
     <div>
      <p class="fw-semibold mb-0 text-dark">
       ${loginedUser.name}
      </p>
     
     </div>
    </div>
    <!-- Navigation -->
    <nav>
     <ul class="list-unstyled mb-0">
      <li class="mb-3">
       <a class="d-flex align-items-center gap-2 text-secondary text-decoration-none px-3 py-2  " href="${path}/account/view">
         Tài khoản của tôi
       </a>
      </li>
      <li>
       <a class="btn-bill d-flex align-items-center gap-2 text-primary fw-semibold bg-primary bg-opacity-10 rounded px-3 py-2 text-decoration-none " href="${path}/account/bill">
         Thông tin đơn hàng
       </a>
      </li>
     </ul>
    </nav>
   </aside>
   <!-- Main content -->
   <div class="flex-grow-1 bg-white rounded  " style="padding: 20px 20px;">
    
    <div class="mb-3 d-flex align-items-center text-secondary justify-content-between" style="font-size:11px; user-select:none;">
    <div class="mã đơn hàng">
      <i class="fas fa-box mr-1"></i>
      <span>Đơn hàng:</span>
      <span class="font-weight-bold text-primary ml-1">${order.code}</span>
    </div>
    <c:choose>
		  <c:when test="${order.status == 'DA_GIAO'}">
		    <button type="button" class="btn-status black">Đơn hàng đã giao thành công</button>
		  </c:when>
		  <c:when test="${order.status == 'XAC_NHAN'}">
		    <button type="button" class="btn-status black">Đơn hàng đã xác nhận</button>
		  </c:when>
		  <c:when test="${order.status == 'DANG_GIAO'}">
		    <button type="button" class="btn-status black">Đơn hàng đang được giao</button>
		  </c:when>
		  <c:when test="${order.status == 'CHO_XAC_NHAN'}">
		    <button type="button" class="btn-status black">Đơn hàng đang chờ xác nhận</button>
		  </c:when>
		  <c:when test="${order.status == 'DA_HUY'}">
		    <button type="button" class="btn-status red">Đơn hàng đã hủy</button>
		  </c:when>
	</c:choose>

      
    </div>
    <section aria-labelledby="receiver-info" class="receiver-info mb-2">
      <h2 id="receiver-info" class="section-title">Thông tin người nhận</h2>
      <p class="font-weight-bold">${order.customerName}</p>
      <p>${order.customerAddress}</p>
      <p>${order.createDate }</p>
      <p>Số điện thoại: ${order.customerMobile}</p>
    </section>

    <section aria-label="Order items" class="mb-4">
    <c:forEach items="${order.saleOrderProducts}" var = "orderProduct">
      <div class="order-item">
        <img
          src="${path}/UploadFiles/${orderProduct.product.avatar}"
          width="48"
          height="48"
        />
        <div class="order-item-details">
          <p class="font-weight-bold mb-1" style="line-height:1.2;">
            ${orderProduct.name }
          </p>
          <c:choose>
          	<c:when test="${orderProduct.price > orderProduct.salePrice}">
          		<p class="text-secondary mb-0" style="line-height:1.2;">
		            Đơn giá: <fmt:formatNumber value="${orderProduct.salePrice}" type="currency" currencySymbol="đ" />
		          </p>
          	</c:when>
          	<c:otherwise>
          	<p class="text-secondary mb-0" style="line-height:1.2;">
		            Đơn giá: <fmt:formatNumber value="${orderProduct.price}" type="currency" currencySymbol="đ" />
		          </p>
          	</c:otherwise>
          </c:choose>
        </div>
        <div class="order-item-qty">${orderProduct.quantity}</div>
        <div class="order-item-price">
				<c:choose>
					<c:when test="${orderProduct.price == orderProduct.salePrice }">
						<fmt:formatNumber value="${orderProduct.price * orderProduct.quantity }" minFractionDigits="0" /> <span>đ</span>
					</c:when>
					 <c:otherwise>
						<fmt:formatNumber value="${orderProduct.salePrice * orderProduct.quantity }" minFractionDigits="0" /> <span>đ</span>
					 </c:otherwise>
				</c:choose>
		</div>
		<!-- Nút đánh giá -->
     		<div class="ml-3">
			  <c:if test="${order.status == 'DA_GIAO' && not reviewedMap[orderProduct.product.id]}">
				   <button type="button"
				        class="btn btn-sm btn-outline-primary openReviewBtn"
				        data-product-id="${orderProduct.product.id}">
				     Đánh giá
				   </button>
				</c:if>
			</div>
      </div>
		     <!-- form review -->
		

	</c:forEach>
      <hr class="divider" />

      <div class="order-summary order-summary-row">
        <div class="order-summary-label">Thành tiền hàng:</div>
        <div class="order-summary-value font-weight-bold">
			<fmt:formatNumber value="${order.total}" minFractionDigits="0" currencySymbol=""/>        </div>
      </div>
      <div class="order-summary order-summary-row order-summary-total">
        <div class="order-summary-label">Tổng số tiền:</div>
        <div class="order-summary-value">
				<fmt:formatNumber value="${order.total}" minFractionDigits="0" currencySymbol=""/>  
        </div>
      </div>
      <div class="order-summary order-summary-row">
        <div class="order-summary-label">Hình thức thanh toán:</div>
        <div class="order-summary-value">
				<c:if test="${order.payment == 'cod'}">
					Thanh toán khi nhận hàng
				</c:if>
				<c:if test="${order.payment == 'bank'}">
					Thanh toán chuyển khoản
				</c:if>
		</div>
      </div>
      </section>
  </div>
  </main>
		

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
		<!-- Contact Us -->

	</div>
	</div>

	  <!-- Popup dùng chung -->
		<div class="popup hidden" id="reviewPopup">
		  <div class="popup-content">
		    <span class="close-btn" id="closePopup">&times;</span>
		
		    <div class="add_review_col">
		      <div class="add_review">
		        <form id="review_form" action="${path }/account/review" method="post">
		          <h3>Thêm đánh giá</h3>
		          <p style="display:inline-block">Mức độ hài lòng</p>
		          <ul class="user_star_rating" id="starRating">
		            <li data-value="1"><i class="fa fa-star-o"></i></li>
		            <li data-value="2"><i class="fa fa-star-o"></i></li>
		            <li data-value="3"><i class="fa fa-star-o"></i></li>
		            <li data-value="4"><i class="fa fa-star-o"></i></li>
		            <li data-value="5"><i class="fa fa-star-o"></i></li>
		          </ul>
		          <input type="hidden" name="saleOrderId" id="saleOrderId" value="${order.id}" />
		          
		          <input type="hidden" name="productId" id="popupProductId" value="${orderProduct.product.id}"/>
		          <input type="hidden" name="rating" id="ratingValue" />
		          <textarea class="input_review" name="message" placeholder="Nội dung đánh giá" rows="4" required></textarea>
		          <div class="text-left text-sm-right mt-3">
		            <button type="submit" class="red_button review_submit_btn trans_300">Gửi đánh giá</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<script src="${path}/user/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"> 
			function cancelOrder(orderId){ 
				if (!confirm("Bạn có chắc chắn muốn hủy đơn không?")){ 
					return; 
				}
				jQuery.ajax({ 
					url: '/account/cancel-order', 
					method: "POST", 
					data: { id: orderId}, 
					success: function(jsonResult){
						alert("Bạn đã hủy thành công đơn hàng: " + jsonResult.code); 
						$('#orderStatus').html(' ĐƠN HÀNG ĐÃ HỦY'); 
					}, 
					error : function(jqXhr, textStatus, errorMessage) {
						alert("An error occur");
					}
					
					
				}); 
			}
	</script>
	<script>
document.addEventListener("DOMContentLoaded", function () {
  const popup = document.getElementById("reviewPopup");
  const closeBtn = document.getElementById("closePopup");
  const ratingInput = document.getElementById("ratingValue");
  const stars = document.querySelectorAll("#starRating li");
  const productIdInput = document.getElementById("popupProductId");

  // Bắt sự kiện mở popup
  document.querySelectorAll(".openReviewBtn").forEach(button => {
    button.addEventListener("click", () => {
      const productId = button.getAttribute("data-product-id");
      productIdInput.value = productId;
      popup.classList.remove("hidden");
      createOverlay();
    });
  });

  // Đóng popup
  closeBtn.addEventListener("click", () => {
    popup.classList.add("hidden");
    removeOverlay();
  });

  // Click ngoài để tắt popup
  function createOverlay() {
    let overlay = document.createElement("div");
    overlay.id = "overlay";
    overlay.className = "overlay";
    document.body.appendChild(overlay);
    overlay.addEventListener("click", () => {
      popup.classList.add("hidden");
      overlay.remove();
    });
  }

  function removeOverlay() {
    const overlay = document.getElementById("overlay");
    if (overlay) overlay.remove();
  }

  // Xử lý chọn sao
  stars.forEach((star, index) => {
    star.addEventListener("click", () => {
      const rating = parseInt(star.getAttribute("data-value"));
      ratingInput.value = rating;

      stars.forEach((s, i) => {
        const icon = s.querySelector("i");
        if (i < rating) {
          icon.classList.remove("fa-star-o");
          icon.classList.add("fa-star");
        } else {
          icon.classList.remove("fa-star");
          icon.classList.add("fa-star-o");
        }
      });
    });
  });
});
</script>


	
	</body>