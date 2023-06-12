
$(document).ready(function () {
	$("#formSubmit").validate({
        rules: {
        	"username": {
        		required: true
        	},
            "usermail": {
              required: true,
              email: true
            },
            "userphone": {
              required: true,
              digits: true
            }
          },
          messages: {
        	"username": {
        		required: "Vui lòng nhập họ và tên của bạn !!!"
        	},
            "usermail": {
              required: "Vui lòng nhập gmail của bạn !!!",
              email: "Vui lòng nhập địa chỉ email hợp lệ !!!"
            },
            "userphone": {
              required: "Vui lòng nhập số điện thoại của bạn !!!",
              digits: "Vui lòng nhập số !!!"
            }
          }
        });
});

