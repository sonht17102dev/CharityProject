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
				<li><a href="quan-ly-tai-khoan">Quản lý tài khoản</a>
				</li>
				<li class="active">Thêm tài khoản</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<h1 style="color:red;">${mess}</h1>
					<form id="formSubmit" action="them-tai-khoan" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Chức danh</label>
							<div class="col-sm-9">
								<select class="form-control" id="account_role" name="account_role" required>
									<option value="">Chọn chức danh</option>
									<option value="ADMIN">ADMIN</option>
									<option value="USER">USER</option>
								</select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Địa chỉ Mail</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="account_mail"
									name="account_mail" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Username</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="account_name"
									name="account_name" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số điện thoại</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="account_phone"
									name="account_phone" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Mật khẩu</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="account_password"
									name="account_password" value="" />
							</div>
						</div>
						<br /> <br />
							<%-- <input type="hidden" value="" id="account_id" name="account_id" />--%>
						<hr>
						<div class="form-group">

							<div class="col-sm-12">
								<input type="submit" class="btn btn-white btn-success btn-bold"
									value="Lưu" id="btnSubmit" /> 
								<input type="reset"
									class="btn btn-white btn-warning btn-bold" value="Reset"
									id="btnReset" />
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
	$("#btnReset").click(function () {
        $("#formSubmit")[0].reset();
    });
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-tai-khoan");
	});
	$.validator.addMethod("validatePassword", function (value, element, param) {
        return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
    }, "Hãy nhập password từ 8 đến 16 ký tự bao gồm chữ hoa, chữ thường và ít nhất một chữ số");
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        //ignore: [],
        rules: {
        	"account_role": {
        		required: true
        	},
            "account_mail": {
              required: true,
              email: true
            },
            "account_name": {
              required: true
            },
            "account_phone": {
              required: true,
              digits: true
            },
            "account_password": {
                required: true,
                validatePassword: true
            }
          },
          messages: {
        	"account_role": {
        		required: "Hãy chọn chức danh"
        	},
            "account_mail": {
              required: "Hãy nhập tài khoản mail",
              email : "Email không hợp lệ"
            },
            "account_name": {
              required: "Hãy nhập username"
            },
            "circum_des": {
              required: "Hãy nhập mô tả ngắn về đợt quyên góp"
            },
            "account_phone": {
              required: "Hãy nhập số điện thoại",
              digits: "Yêu cầu nhập số"
            },
            "account_password": {
                required: "Hãy nhập mật khẩu"
            }
          }
        });
});

</script>