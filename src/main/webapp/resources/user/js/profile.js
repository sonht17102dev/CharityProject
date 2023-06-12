var btnEdit = document.getElementById('btn-Edit');
	var btnCancle = document.getElementById('btn-cancle');
	var formInfo = document.getElementById('formInfo');
	var tableInfo = document.getElementById('table-info');
	function hideFormInfo() {
		formInfo.classList.add("hidden");
		tableInfo.classList.remove("hidden");
	}
	function showFormInfo () {
		formInfo.classList.remove("hidden");
		tableInfo.classList.add("hidden");
	}
	$(document).ready(function() {
		$("#formInfo").validate({
			onfocusout : false,
			onkeyup : false,
			onclick : false,
			rules : {
				"account_name" : {
					required : true
				},
				"account_firstName" : {
					required : true
				},
				"account_lastName" : {
					required : true
				},
				"account_organization" : {
					required : true
				},
				"account_address" : {
					required : true
				},
				"account_phone" : {
					required : true
				},
				"account_birthday" : {
					required : true
				},
				"account_bank" : {
					required : true
				},
				"account_bankname" : {
					required : true
				}
			},
			messages : {
				"account_name" : {
					required : "Vui lòng nhập username của bạn !!!"
				},
				"account_firstName" : {
					required : "Vui lòng nhập tên của bạn !!!"
				},
				"account_lastName" : {
					required : "Vui lòng nhập họ của bạn !!!"
				},
				"account_organization" : {
					required : "Vui lòng nhập tên công ty của bạn !!!"
				},
				"account_address" : {
					required : "Vui lòng nhập địa chỉ của bạn !!!"
				},
				"account_phone" : {
					required : "Vui lòng nhập số điện thoại của bạn !!!"
				},
				"account_birthday" : {
					required : "Vui lòng nhập ngày sinh của bạn !!!"
				},
				"account_bank" : {
					required : "Vui lòng nhập số tài khoản của bạn !!!"
				},
				"account_bankname" : {
					required : "Vui lòng nhập tên ngân hàng của bạn !!!"
				}
			}
		});
	});