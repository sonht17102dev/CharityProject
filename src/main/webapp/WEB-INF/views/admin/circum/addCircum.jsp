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
				<li><a href="quan-ly-quyen-gop">Quản lý quyên góp</a>
				</li>
				<li class="active">Thêm đợt quyên góp</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<h1 class='${message != null ? " " : "hidden"}' style="color:red;">${message}</h1>
					<form id="formSubmit" action="them-quyen-gop" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Thể
								loại</label>
							<div class="col-sm-9">
								<select class="form-control" id="circum_type" name="circum_type">
									<option value="">Chọn thể loại</option>
									<c:forEach items="${category}" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Id
								Đối Tác</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="parner_id"
									name="partner_id" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tiêu
								đề</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_name"
									name="circum_name" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Mô
								tả ngắn</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_des"
									name="circum_des" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Lượt
								quyên góp</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_donations"
									name="circum_donations" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số
								tiền đạt được</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_target"
									name="circum_target" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số
								tiền mục tiêu</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_raise"
									name="circum_raise" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Thời
								gian kết thúc</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_time_end"
									name="circum_time_end" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Ngày
								bắt đầu quyên góp</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_start_donate"
									name="circum_start_donate" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình
								ảnh</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="circum_image" name="circum_image"
									style="width: 820px; height: 175px">
									</textarea>
							<!--  
									
								<input type="file" class="form-control" id="circum_image" name="circum_image" />
									-->
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="circum_content"
									name="circum_content" style="width: 820px; height: 175px"></textarea>
							</div>
						</div>
						<br /> <br />
						<hr>
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

</script>