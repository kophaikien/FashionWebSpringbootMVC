<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V4</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('${path}/user/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form method="POST" action="${path }/login_processing_url" class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Login
					</span>
					<c:if test="${not empty param.login_error }">
										<div class="alert alert-danger" role="alert">
											Login attempt was not successful, try again!!!</div>
									</c:if>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="col d-flex justify-content-between p-20-0 ">
											<!-- Checkbox -->
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="remember-me" name="remember-me" /> 
												<label class="form-check-label" for="remember-me"> Remember me </label>
											</div>
											<div class="text-right">
												<a href="#">
													Forgot password?
												</a>
											</div>
									</div>
					
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>



					<div class="flex-col-c p-b-130">

						<a href="#" class="txt2">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="${path }/user/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${path }/user/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${path }/user/vendor/bootstrap/js/popper.js"></script>
	<script src="${path }/user/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${path }/user/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${path }/user/vendor/daterangepicker/moment.min.js"></script>
	<script src="${path }/user/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${path }/user/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${path }/user/js/main.js"></script>

</body>
</html>