
	$(document).ready(function () {
		$("#formSubmit").validate({
	        rules: {
	        	"username": {
	        		required: true
	        	},
	            "password": {
	              required: true
	            }
	          },
	          messages: {
	        	"username": {
	        		required: "Vui lòng nhập username của bạn !!!"
	        	},
	            "password": {
	              required: "Vui lòng nhập mật khẩu của bạn !!!"
	            }
	          }
	        });
		$("#formReset").validate({
	        rules: {
	        	"email": {
	        		required: true
	        	}
	          },
	          messages: {
	        	"email": {
	        		required: "Vui lòng nhập email của bạn !!!"
	        	}
	          }
	    });
	});
	// Lấy cửa sổ modal
	var modal = document.getElementById("myModal");
	var loginForm = document.getElementById("login-form");
	// Lấy nút close
	var span = document.getElementsByClassName("close")[0];
	
	// Khi người dùng click vào nút "Quên mật khẩu"
	function showForgotPasswordForm() {
	    modal.style.display = "block";
	    loginForm.style.display = "none";
	}
	
	// Khi người dùng click vào nút close
	span.onclick = function () {
	    modal.style.display = "none";
	    loginForm.style.display = "block";
	}
	
	// Khi người dùng click ra ngoài cửa sổ modal
	window.onclick = function (event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	        loginForm.style.display = "block";
	    }
	}
	