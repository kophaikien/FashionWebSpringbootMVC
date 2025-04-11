<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00C9FF 0%, #92FE9D 100%);
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .gradient-button {
            background: linear-gradient(90deg, #00C9FF 0%, #92FE9D 100%);
        }
    </style>
</head>
<body>
    <div class="w-full max-w-sm bg-white rounded-lg shadow-md p-8">
        <h2 class="text-2xl font-bold text-center mb-6">Sign Up</h2>
        <form>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                    Username
                </label>
                <div class="flex items-center border-b border-gray-300 py-2">
                    <i class="fas fa-user text-gray-400 mr-2"></i>
                    <input class="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none" id="username" type="text" placeholder="Type your username" aria-label="Username">
                </div>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                    Email
                </label>
                <div class="flex items-center border-b border-gray-300 py-2">
                    <i class="fas fa-envelope text-gray-400 mr-2"></i>
                    <input class="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none" id="email" type="email" placeholder="Type your email" aria-label="Email">
                </div>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                    Password
                </label>
                <div class="flex items-center border-b border-gray-300 py-2">
                    <i class="fas fa-lock text-gray-400 mr-2"></i>
                    <input class="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none" id="password" type="password" placeholder="Type your password" aria-label="Password">
                </div>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="confirm-password">
                    Confirm Password
                </label>
                <div class="flex items-center border-b border-gray-300 py-2">
                    <i class="fas fa-lock text-gray-400 mr-2"></i>
                    <input class="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none" type="password" id="retypepassword" placeholder="Confirm your password" aria-label="Confirm Password">
                </div>
            </div>
            <div class="mb-4">
                <button class="w-full gradient-button text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" onclick="_register()" type="button">
                    SIGN UP
                </button>
            </div>
            <div class="text-center text-gray-600 mb-4">
                Or <a href="${path }/login" class="text-blue-500">Login</a> Using
            </div>
            <div class="flex justify-center space-x-4">
                <a href="#" class="text-blue-600"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-blue-400"><i class="fab fa-twitter"></i></a>
                <a href="#" class="text-red-600"><i class="fab fa-google"></i></a>
            </div>
        </form>
    </div>
    
    <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
		function _register() {
			//javascript object
			let data = {				
				username : jQuery("#username").val(),
				password : jQuery("#password").val(),
				email : jQuery("#email").val(), //Get by Id
				mobile : jQuery("#mobile").val(),
				retypepassword : jQuery("#retypepassword").val(),
				
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/register",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
</body>
</html>