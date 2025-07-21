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
		<jsp:include page="/WEB-INF/views/user/layout/bill_css.jsp"></jsp:include>
	<style>

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
						<li class="active"><a href="${path }/account/view"><i class="fa fa-angle-right" aria-hidden="true"></i>Thông tin tài khoản</a></li>
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
   <div class="flex-grow-1 bg-white rounded ">
    <h1 class="h5 font-weight-normal mb-4 border-bottom pt-3 pl-3">Đơn hàng của tôi</h1>
  <c:forEach var="order" items="${saleOrders}">
  <div class="mb-3" style="border-bottom: 10px rgb(248 249 250) solid;">
    <div class="d-flex justify-content-between align-items-center px-3 py-2 border-bottom">
      <div class="d-flex align-items-center " style="font-weight: 500px" id="orderStatus">
        <c:choose>
          <c:when test="${order.status == 'DA_GIAO'}">
            ĐƠN HÀNG ĐÃ HOÀN THÀNH
          </c:when>
          <c:when test="${order.status == 'XAC_NHAN'}">
            ĐƠN HÀNG ĐÃ ĐƯỢC XÁC NHẬN
          </c:when>
           <c:when test="${order.status == 'DANG_GIAO'}">
            ĐƠN HÀNG ĐANG ĐƯỢC GIAO ĐẾN BẠN
          </c:when>
          <c:when test="${order.status == 'CHO_XAC_NHAN'}">
            ĐƠN HÀNG CHỜ XÁC NHẬN
          </c:when>
         <c:when test="${order.status == 'DA_HUY'}">
            ĐƠN HÀNG ĐÃ HỦY
          </c:when>
        </c:choose>
      </div>
    </div>

    <c:forEach var="saleOrderProduct" items="${order.saleOrderProducts}">
      <div class="d-flex align-items-center px-3 py-3 border-bottom">
        <img
          src="${path }/UploadFiles/${saleOrderProduct.product.avatar}" 
          alt="${saleOrderProduct.name}" 
          class="product-img"
        />
        <div class="flex-grow-1 ml-3">
          <p class="mb-1">${saleOrderProduct.name}</p>
          <p class="mb-0 text-muted small">
            Size: <strong>${saleOrderProduct.size}</strong> | Số lượng: <strong>${saleOrderProduct.quantity}</strong>
          </p>
        </div>
        <div class="text-right text-dark price">
          <fmt:formatNumber value="${saleOrderProduct.salePrice}" type="currency" currencySymbol="" />đ
        </div>
      </div>
    </c:forEach>

    <div class="border-bottom d-flex justify-content-end px-3 py-3">
      <p class="mb-0 text-dark font-weight-normal">
        Tổng tiền:
        <span class="price ml-1">
          <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="" />đ
        </span>
      </p>
    </div>

    <div class="bill-end d-flex justify-content-between">
      <div class="px-3 py-3 text-secondary small">
        <p class="mb-2 d-flex align-items-center">
          <i class="far fa-clock order-header-icon icon-blue"></i>
          Thời gian đặt hàng:
          <strong class="ml-1">
            <fmt:formatDate value="${order.createDate}" pattern="HH:mm, dd/MM/yyyy" />
          </strong>
        </p>
      </div>

      <div class="px-3 py-3 d-flex justify-content-end">
        <c:choose>
          <c:when test="${order.status == 'CHO_XAC_NHAN'}">
            <button type="button" class="btn btn-cancel" style="background-color: black; color: white" onclick="cancelOrder(${order.id})" >HỦY ĐƠN HÀNG</button>
          </c:when>
          <c:otherwise>
            <a href="${path}/account/saleOrder/${order.id}" class="btn btn-detail">CHI TIẾT </a>
            
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
  
  
</c:forEach>
	<!-- form review -->
	<div id="overlay" class="overlay hidden"></div>

<!-- Form popup -->

<!-- end -->

  </div>
  </main>
		

	<!-- Newsletter -->

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
		<!-- Contact Us -->

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
	
	</body>