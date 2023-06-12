
const selectElement = document.querySelector("#mySelect"); // Lấy đối tượng thẻ <select> bằng ID
const selectedOptionValue = selectElement.options[0].value; // Lấy giá trị của tùy chọn được chọn
function myFunction() {
	//console.log(selectElement.value);
	if(selectElement.value === 'USER') {
		alert('Admin không được phép cập nhật thành USER !')
		selectElement.value = 'Chọn chức danh';
	}
}
$(document).ready(function () {	
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-tai-khoan");
	});
	
	
	
	$("#btnReset").click(function() {
		 $("#mySelect").val("${accountByID.account_role}");
		 $("#account_name").val("${accountByID.account_name}");
		 $("#account_phone").val("${accountByID.account_phone}");
	});
	
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        //ignore: [],
        rules: {
        	"account_role": {
        		required: true
        	},
            "account_mail": {
              required: true,
              email: true
            },
            "account_name": {
              required: true
            },
            "account_phone": {
              required: true,
              digits: true
            },
            "account_password": {
                required: true
            },
            "account_status": {
                required: true
            }
          },
          messages: {
        	"account_role": {
        		required: "Hãy chọn chức danh"
        	},
            "account_mail": {
              required: "Hãy nhập tài khoản mail",
              email : "Email không hợp lệ"
            },
            "account_name": {
              required: "Hãy nhập username"
            },
            "circum_des": {
              required: "Hãy nhập mô tả ngắn về đợt quyên góp"
            },
            "account_phone": {
              required: "Hãy nhập số điện thoại",
              digits: "Yêu cầu nhập số"
            },
            "account_password": {
                required: "Hãy nhập mật khẩu"
            },
            "account_status": {
                required: "Hãy chọn trạng thái"
            }
          }
       });
});