
$(document).ready(function () {
	var editor = '';
	$(document).ready(function() {
		editor = CKEDITOR.replace('news_content');
	});
	
	$("#btnReset").click(function() {
		 $("#news_descritption").val("");
		 $("#news_img_banner").val("");
		 $("#news_post_date").val("");
		 CKEDITOR.instances['news_content'].setData('');
	});
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-tin-tuc");
	});
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        ignore: [],
        rules: {
            "news_description": {
              required: true
            },
            "news_img_banner": {
              required: true
            },
            "news_post_date": {
              required: true
            },
            news_content: {
                required: function(textarea) {
                CKEDITOR.instances[textarea.id].updateElement();
                var editorcontent = textarea.value.replace(/<[^>]*>/gi, '');
                return editorcontent.length === 0;
              }
            }
          },
          messages: {
        	
        	"news_description": {
        		required: "Hãy nhập tiêu đề tin tức !"
        	},
            "news_img_banner": {
              required: "Hãy nhập hình ảnh banner tin tức !"
            },
            "news_post_date": {
              required: "Hãy nhập ngày đăng bài !"
            },
            "news_content": {
            	required: "Hãy nhập nội dung của bài viết !"
            }
          }
       });
});