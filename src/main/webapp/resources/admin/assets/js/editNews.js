
$(document).ready(function () {
	var editor = '';
	$(document).ready(function() {
		editor = CKEDITOR.replace('news_content');
		var defaultValue = editor.config.defaultData;
		$("#btnReset").click(function() {
			 $('#mySelect').val("${news.news_status}");
			 $('#news_description').val("${news.news_description}");
			 $('#news_img_banner').val("${news.news_img_banner}");
			 $('#news_post_date').val("${news.news_post_date}");
			 editor.setData(defaultValue);
		});
		$('input.cancle').on("click", function(event) {
			location.assign("/CharityApp/admin/quan-ly-tin-tuc");
		});
	});
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        ignore: [],
        rules: {
            "news_descritption": {
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
        	
        	"news_descritption": {
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