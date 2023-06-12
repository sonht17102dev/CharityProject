/*
	const inputAmount = document.getElementById('amount');
	const inputAmountForm = document.getElementById('circum_order_amount');

	inputAmount.oninput = function() {
		inputAmountForm.value = this.value;
	}
	*/
	$(document).ready(function() {
		$("#cancel").click(function() {
			location.assign("/CharityApp/nhung-hoan-canh");
		});
		$("#reset").click(function(){
			//$("#circum_order_name").val('');
			//$("#circum_order_mail").val('');
			$("#circum_order_phone").val('');
			$("#circum_order_bank").val('');
			$("#circum_order_bankname").val('');
			$("#circum_order_address").val('');
			$("#amount").val('');
		});
		
		$("#formSubmit").validate({
			onfocusout : false,
			onkeyup : false,
			onclick : false,
			//ignore: [],
			rules : {
				"circum_order_name" : {
					required : true
				},
				"circum_order_mail" : {
					required : true,
					email : true
				},
				"circum_order_phone" : {
					required : true,
					digits : true
				},
				"circum_order_bank" : {
					required : true,
					digits : true
				},
				"circum_order_bankname" : {
					required : true,
				},
				"circum_order_address" : {
					required : true
				},
				"circum_order_amount" : {
					required : true
				}

			},
			messages : {
				"circum_order_name" : {
					required : "Trường này là bắt buộc !"
				},
				"circum_order_mail" : {
					required : "Trường này là bắt buộc !",
					email : "Email không hợp lệ !"
				},
				"circum_order_phone" : {
					required : "Trường này là bắt buộc !",
					digits : "Yêu cầu nhập số !"
				},
				"circum_order_bank" : {
					required : "Trường này là bắt buộc !",
					digits : "Yêu cầu nhập số !"
				},
				"circum_order_bankname" : {
					required : "Trường này là bắt buộc !"
				},
				"circum_order_address" : {
					required : "Trường này là bắt buộc !"
				},
				"circum_order_amount" : {
					required : "Trường này là bắt buộc !"
				}

			}
		});
	});