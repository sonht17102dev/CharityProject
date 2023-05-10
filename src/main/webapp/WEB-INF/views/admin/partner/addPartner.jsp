<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">

			<div class="breadcrumbs" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
					</li>
					<li><a href="home">Quản lý</a>
					</li>
					<li><a href="quan-ly-doi-tac">Quản lý đối tác</a>
					</li>
					<li class="active">Thêm đối tác mới</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">

					<h1 class='${message != null ? " " : "hidden"}' style="color:red;">${message}</h1>
					<form id="formSubmit" action="them-doi-tac" method="post">
						
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tên đối tác
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_name"
									name="partner_name" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Khẩu hiệu</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_slogan" name="partner_slogan"
									value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Logo</label>
							<div class="col-sm-9">
							
							<input type="text" class="form-control" id="partner_logo"
									name="partner_logo" value="" />
						    
        
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Banner</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_banner"
									name="partner_banner" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số dự án đã thực hiện</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_number_donate"
									name="partner_number_donate" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tổng số
								tiền đã nhận quyên góp</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_total_money"
									name="partner_total_money" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Giới thiệu ngắn</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="partner_introduce" name="partner_introduce"
									style="width: 820px; height: 175px"></textarea>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="partner_content"
									name="partner_content" style="width: 820px; height: 175px"></textarea>
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
		editor = CKEDITOR.replace('partner_content');
	});
	
	$("#btnReset").click(function() {
		 //$(this).closest('form').find("input[type=text], textarea").val("");
		 //$("#formSubmit")[0].reset();
		 //CKEDITOR.instances['partner_content'].setData('');
	});
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-doi-tac");
	});
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        ignore: [],
        rules: {
           
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

</script>    