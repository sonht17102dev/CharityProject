$(document).ready(function () {
	var editor = '';
	$(document).ready(function() {
		editor = CKEDITOR.replace('circum_content');
		editor = CKEDITOR.replace('circum_image');
	});
	
	$("#btnReset").click(function() {
		 //$(this).closest('form').find("input[type=text], textarea").val("");
		 $("#formSubmit")[0].reset();
		 CKEDITOR.instances['circum_image'].setData('');
		 CKEDITOR.instances['circum_content'].setData('');
	});
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-quyen-gop");
	});
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        ignore: [],
        rules: {
        	"circum_type": {
        		required: true
        	},
            "partner_id": {
              required: true,
              digits: true
            },
            "circum_name": {
              required: true
            },
            "circum_des": {
              required: true
            },
            "circum_donations": {
              required: true,
              digits: true
            },
            "circum_target": {
              required: true,
              digits: true
            },
            "circum_raise": {
              required: true,
              digits: true
            },
            "circum_time_end": {
              required: true,
              digits: true
            },
            "circum_start_donate": {
              required: true
            },
            circum_image: {
                required: function(textarea) {
                CKEDITOR.instances[textarea.id].updateElement();
                var editorcontent = textarea.value.replace(/<[^>]*>/gi, '');
                return editorcontent.length === 0;
              }
            },
            circum_content: {
                required: function(textarea) {
                CKEDITOR.instances[textarea.id].updateElement();
                var editorcontent = textarea.value.replace(/<[^>]*>/gi, '');
                return editorcontent.length === 0;
              }
            }
          },
          messages: {
        	"circum_type": {
        		required: "Hãy chọn thể loại"
        	},
            "partner_id": {
              required: "Hãy nhập Id đối tác",
              digits: "Yêu cầu nhập số"
            },
            "circum_name": {
              required: "Hãy nhập tiêu đề đợt quyên góp"
            },
            "circum_des": {
              required: "Hãy nhập mô tả ngắn về đợt quyên góp"
            },
            "circum_donations": {
              required: "Hãy nhập số lượt quyên góp",
              digits: "Yêu cầu nhập số"
            },
            "circum_target": {
              required: "Hãy nhập số tiền đạt được",
              digits: "Yêu cầu nhập số"
            },
            "circum_raise": {
              required: "Hãy nhập số tiền mục tiêu",
              digits: "Yêu cầu nhập số"
            },
            "circum_time_end": {
              required: "Hãy nhập thời gian kết thúc đợt quyên góp",
              digits: "Yêu cầu nhập số"
            },
            "circum_start_donate": {
              required: "Hãy nhập ngày bắt đầu quyên góp"
            },
            "circum_image": {
            	required: "Hãy nhập hình ảnh"
            },
            "circum_content": {
            	required: "Hãy nhập nội dung"
            }
          }
        });
});