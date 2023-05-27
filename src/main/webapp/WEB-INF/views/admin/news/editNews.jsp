<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
					</li>
					<li><a href="home">Quản lý</a>
					</li>
					<li><a href="quan-ly-tin-tuc">Quản lý tin tức</a>
					</li>
					<li class="active">Cập nhật tin tức</li>
				</ul>
				<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">

					<form id="formSubmit" action="cap-nhat-tin-tuc" method="post">
						<input type="hidden" id="news_id" name="news_id" value="${news.news_id}"/>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
							<div class="col-sm-9">
						<c:set var = "stt" value = "${news.news_status}"/>
								<select id="mySelect" class="form-control" id="news_status" 
									name="news_status" >
									<c:choose>
							         <c:when test = "${stt == 'active'}">
							           <option value="active">Đang hoạt động</option>
							           <option value="Chọn trạng thái">Chọn trạng thái </option>
							           <option value="inactive">Không hoạt động</option>
							         </c:when>
							         
							         <c:when test = "${stt == 'inactive'}">
							            <option value="inactive">Không hoạt động</option>
							            <option value="Chọn trạng thái">Chọn trạng thái </option>
							            <option value="active">Đang hoạt động</option>
							         </c:when>
							         
							         <c:otherwise>
							            <option value="Chọn trạng thái">Chọn trạng thái </option>
							            <option value="active">Đang hoạt động</option>
							            <option value="inactive">Không hoạt động</option>
							         </c:otherwise>
							      </c:choose>
								</select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tiêu đề tin tức
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_description"
									name="news_description" value="${news.news_description}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình banner</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_img_banner"
									name="news_img_banner" value="${news.news_img_banner}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Ngày đăng bài</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_post_date"
									name="news_post_date" value="${news.news_post_date}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung bài viết</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="news_content"
									name="news_content" style="width: 820px; height: 175px"
									>${news.news_content}</textarea>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<div class="col-sm-12">
								<input type="submit" class="btn btn-white btn-success btn-bold"
									value="Lưu" id="btnSubmit" /> 
								<button type="button"
									class="btn btn-white btn-warning btn-bold" 
									id="btnReset">Reset</button>
								<input type="button"
									class="btn btn-white btn-warning btn-bold cancle" value="Hủy"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- /.page-content -->
</div>
<script>

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

</script> 