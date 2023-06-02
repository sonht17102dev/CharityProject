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
				<li class="active">Cập nhật đối tác</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<form:form id="formSubmit" action="cap-nhat-doi-tac" method="post" modelAttribute="partner">
						<form:input type="hidden" id="partner_id" name="partner_id" 
						 path="partner_id" value = "${partner.partner_id}" />
					<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
							<div class="col-sm-9">
							<c:set var = "stt" value = "${partner.partner_status}"/>
								<form:select id="mySelect" class="form-control" 
									name="partner_status" path="partner_status">
                       				<form:options items = "${listStatus}" />
								</form:select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tên đối tác
							</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_name"
									name="partner_name" value="${partner.partner_name}" path="partner_name"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Khẩu hiệu</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_slogan" name="partner_slogan"
									value="${partner.partner_slogan}" path="partner_slogan"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Logo</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_logo"
									name="partner_logo" value="${partner.partner_logo}" path="partner_logo"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Banner</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_banner"
									name="partner_banner" value="${partner.partner_banner}" path="partner_banner"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số dự án đã thực hiện</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_number_donate"
									name="partner_number_donate" value="${partner.partner_number_donate}" 
									path="partner_number_donate"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tổng số
								tiền đã nhận quyên góp</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_total_money"
									name="partner_total_money" value="${partner.partner_total_money}" 
									path="partner_total_money"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Giới thiệu ngắn</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="partner_introduce" 
								name="partner_introduce" value="${partner.partner_introduce}" 
								path="partner_introduce"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung</label>
							<div class="col-sm-9">
								<form:textarea rows="" cols="" id="partner_content" name="partner_content" 
									style="width: 820px; height: 175px;" path="partner_content" 
									value="${partner.partner_content}"/>
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
					</form:form>
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

</script>    