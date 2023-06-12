$(document).ready(function() {
		$.validator.addMethod("validatePassword", function (value, element, param) {
            return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
        }, "Hãy nhập password từ 8 đến 16 ký tự bao gồm chữ hoa, chữ thường và ít nhất một chữ số");

		$("#formChangePass").validate({
			rules : {
				"currentPassword" : {
					required : true,
					//minlength: 8
				},
				"newPassword" : {
					required : true,
					validatePassword: true,
					minlength: 8
				},
				"confirmPassword" : {
					required : true,
					equalTo: "#newPassword",
					validatePassword: "#re-password",
					minlength: 8
				}
				
			},
			messages : {
				"currentPassword" : {
					required : "Vui lòng nhập mật khẩu cũ !!!",
					minlength : "Hãy nhập ít nhất 8 ký tự !!!"
				},
				"newPassword" : {
					required : "Vui lòng nhập mật khẩu mới !!!",
					minlength : "Hãy nhập ít nhất 8 ký tự !!!"
				},
				"confirmPassword" : {
					required : "Vui lòng nhập lại mật khẩu mới !!!",
					equalTo: "Hai password phải giống nhau",
					minlength : "Hãy nhập ít nhất 8 ký tự !!!"
				}
			}
		});
	});