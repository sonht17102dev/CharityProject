$(document).ready(function () {
	var editor = '';
	$(document).ready(function() {
		editor = CKEDITOR.replace('partner_content');
		var defaultValue = editor.config.defaultData;
		$("#btnReset").click(function() {
			 $('#mySelect').val("${partner.partner_status}");
			 $('#partner_name').val("${partner.partner_name}");
			 $('#partner_slogan').val("${partner.partner_slogan}");
			 $('#partner_logo').val("${partner.partner_logo}");
			 $('#partner_banner').val("${partner.partner_banner}");
			 $('#partner_total_money').val("${partner.partner_total_money}");
			 $('#partner_number_donate').val("${partner.partner_number_donate}");
			 editor.setData(defaultValue);
		});
		$('input.cancle').on("click", function(event) {
			location.assign("/CharityApp/admin/quan-ly-doi-tac");
		});
	});
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        ignore: [],
        rules: {
           
            "partner_status": {
              required: true
            },
            "partner_name": {
              required: true
            },
            "partner_slogan": {
              required: true
            },
            "partner_logo": {
              required: true
            },
            "partner_banner": {
              required: true
            },
            "partner_number_donate": {
              required: true,
              digits: true
            },
            "partner_total_money": {
              required: true,
              digits: true
            },
            "partner_introduce" : {
                required: true
            },
            partner_content: {
            	required: function(textarea) {
                    CKEDITOR.instances[textarea.id].updateElement();
                    var editorcontent = textarea.value.replace(/<[^>]*>/gi, '');
                    return editorcontent.length === 0;
                }
            }
          },
          messages: {
        	
        	"partner_status": {
        		required: "Hãy chọn trạng thái đối tác !"
        	},
        	"partner_name": {
        		required: "Hãy nhập tên đối tác !"
        	},
            "partner_slogan": {
              required: "Hãy nhập khẩu hiệu đối tác !"
            },
            "partner_logo": {
              required: "Hãy nhập logo đối tác !"
            },
            "partner_banner": {
              required: "Hãy nhập banner đối tác !"
            },
            "partner_number_donate": {
              required: "Hãy nhập số dự án quyên góp",
              digits: "Yêu cầu nhập số"
            },
            "partner_total_money": {
              required: "Hãy nhập số tổng tiền đạt được",
              digits: "Yêu cầu nhập số"
            },
            "partner_introduce": {
              required: "Hãy nhập mô tả ngắn đối tác !"
            },
            "partner_content": {
            	required: "Hãy nhập đoạn giới thiệu đối tác !"
            }
          }
        });
});
