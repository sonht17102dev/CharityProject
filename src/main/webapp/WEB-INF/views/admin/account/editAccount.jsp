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
				<li class="active">Cập nhật tài khoản</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<h1 class='${message != null ? " " : "hidden"}' style="color:red;">${message}</h1>
					<form id="formSubmit" action="cap-nhat-tai-khoan" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Chức danh</label>
							<div class="col-sm-9">
							<c:set var = "role" value = "${accountByID.account_role}"/>
								<select class="form-control" id="account_role" name="account_role">
									<c:choose>
							         <c:when test = "${role == 0}">
							           <option value="0">0</option>
							           <option value="Chọn chức danh (0: admin, 1: user)">Chọn chức danh (0: admin, 1: user)</option>
							            <option value="1">1</option>
							         </c:when>
							         
							         <c:when test = "${role == 1}">
							            <option value="1">1</option>
							            <option value="Chọn chức danh (0: admin, 1: user)">Chọn chức danh (0: admin, 1: user)</option>
							            <option value="0">0</option>
							         </c:when>
							         
							         <c:otherwise>
							            <option value="Chọn chức danh (0: admin, 1: user)">Chọn chức danh (0: admin, 1: user)</option>
							            <option value="0">0</option>
							            <option value="1">1</option>
							         </c:otherwise>
							      </c:choose>
								</select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Địa chỉ Mail</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="account_mail"
									name="account_mail" value="${accountByID.account_mail}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Username</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="account_name"
									name="account_name" value="${accountByID.account_name}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số điện thoại</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="account_phone"
									name="account_phone" value="${accountByID.account_phone}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Mật khẩu</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="account_password"
									name="account_password" value="${accountByID.account_password}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
							<div class="col-sm-9">
							<c:set var = "status" value = "${accountByID.account_status}"/>
								<select class="form-control" id="account_status" name="account_status">
									<c:choose>
							         <c:when test = "${status == 'online'}">
							           <option value="online">Online</option>
							           <option value="Chọn trạng thái">Chọn trạng thái</option>
							            <option value="offline">Offline</option>
							            <option value="ban">Ban</option>
							         </c:when>
							         
							         <c:when test = "${status == 'offline'}">
							            <option value="offline">Offline</option>
							            <option value="Chọn trạng thái">Chọn trạng thái</option>
							            <option value="online">Online</option>
							            <option value="ban">Ban</option>
							         </c:when>
							         <c:when test = "${status == 'ban'}">
							            <option value="ban">Ban</option>
							            <option value="Chọn trạng thái">Chọn trạng thái</option>
							            <option value="online">Online</option>
							            <option value="offline">Offline</option>
							         </c:when>
							         
							         <c:otherwise>
							            <option value="Chọn trạng thái">Chọn trạng thái</option>
							            <option value="online">Online</option>
							            <option value="offline">Offline</option>
							            <option value="ban">Ban</option>
							         </c:otherwise>
							      </c:choose>
								</select>
							</div>
						</div>
						<br /> <br />
							<input type="hidden" value="${accountByID.account_id}" id="account_id" name="account_id" />
						<hr>
						<div class="form-group">

							<div class="col-sm-12">
								<input type="submit" class="btn btn-white btn-success btn-bold"
									value="Lưu" id="btnSubmit" /> 
								<button type="button"
									class="btn btn-white btn-warning btn-bold" id="btnReset">Reset</button>
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
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-tai-khoan");
	});
	$("#btnReset").click(function() {
		 $("#account_role").val("Chọn chức danh (0: admin, 1: user)");
		 $("#account_mail").val("");
		 $("#account_name").val("");
		 $("#account_phone").val("");
		 $("#account_password").val("");
		 $("#account_status").val("Chọn trạng thái (0: active, 1: Inactive)");
	});
	$("#formSubmit").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        //ignore: [],
        rules: {
        	"account_role": {
        		required: true,
        		digits: true
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
                required: true
            }
          },
          messages: {
        	"account_role": {
        		required: "Hãy chọn chức danh",
        		digits: "Yêu cầu nhập số"
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