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
     <img alt="Avatar hình minh họa người đàn ông đeo kính, tóc đen, mặc áo sơ mi xanh và cà vạt đỏ" class="rounded-circle" height="48" src="${path}/${loginedUser.avatar}" width="48"/>
     <div>
      <p class="fw-semibold mb-0 text-dark">
       ${loginedUser.name }
      </p>
     </div>
    </div>
    <!-- Navigation -->
    <nav>
     <ul class="list-unstyled mb-0">
      <li class="mb-3">
       <a class="d-flex align-items-center gap-2 text-secondary text-decoration-none px-3 py-2  " href="${path }/account/view">
         Tài khoản của tôi
       </a>
      </li>
      <li>
       <a class="btn-bill d-flex align-items-center gap-2 text-primary fw-semibold bg-primary bg-opacity-10 rounded px-3 py-2 text-decoration-none " href="${path }/account/bill">
         Thông tin đơn hàng
       </a>
      </li>
     </ul>
    </nav>
   </aside>
   <!-- Main content -->
   <div class="flex-grow-1 bg-white rounded ">
    <h1 class="h5 font-weight-normal mb-4 border-bottom pt-3 pl-3">Bạn chưa có đơn hàng nào</h1>
  	

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
	</body>