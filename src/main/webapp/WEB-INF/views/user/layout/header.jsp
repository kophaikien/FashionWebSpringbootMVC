<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header class="header trans_300">

		<!-- Top Navigation -->

		<div class="top_nav">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						
					</div>
					<div class="col-md-6 text-right">
						<div class="top_nav_right">
							<ul class="top_nav_menu">

								<!-- Currency / Language / My Account -->

								<li class="currency">
									<a href="#">
										vnđ									</a>
								
								</li>
								<li class="language">
									<a href="#">
										Việt Nam
									</a>
									
								</li>
								<li class="account">
									<a href="#">
										My Account
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="account_selection">
										<li><a href="${path }/login"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
										<li><a href="${path }/logout"><i class="fa fa-sign-out"></i>Log Out</a></li>
					
						
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="${path }/index">colo<span>shop</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="${path }/index">Trang Chủ</a></li>
								<li><a href="${path }/category">Cửa Hàng</a></li>
								<li><a href="${path }/sale">sale</a></li>
								<li><a href="${path }/user/contact/view">Liên Hệ</a></li>
							</ul>
							<ul class="navbar_user">
								<li><a href="${path }/account/view"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								
								<li class="checkout">
								<a href="${path }/cart-view">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
									<%-- 	<span id="totalCartProducts" class="checkout_items">${totalCartProducts }</span>--%>
									</a>
									
								</li>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>
