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
					<form id="formSubmit" action="${pageContext.request.contextPath}/admin/cap-nhat-tai-khoan" method="POST">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Chức danh</label>
							<div class="col-sm-9">
							<c:set var = "role" value = "${accountByID.account_role}"/>
								<select id="mySelect" class="form-control" id="account_role" 
									name="account_role" onchange="myFunction()">
									<c:choose>
							         <c:when test = "${role == 'ADMIN'}">
							           <option value="ADMIN">ADMIN</option>
							           <option value="Chọn chức danh">Chọn chức danh </option>
							            <option value="USER">USER</option>
							         </c:when>
							         
							         <c:when test = "${role == 'USER'}">
							            <option value="USER">USER</option>
							            <option value="Chọn chức danh">Chọn chức danh </option>
							            <option value="ADMIN">ADMIN</option>
							         </c:when>
							         
							         <c:otherwise>
							            <option value="Chọn chức danh">Chọn chức danh </option>
							            <option value="ADMIN">ADMIN</option>
							            <option value="USER">USER</option>
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
									name="account_mail" value="${accountByID.account_mail}" readonly />
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
									name="account_password" value="${accountByID.account_password}" readonly />
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

const selectElement = document.querySelector("#mySelect"); // Lấy đối tượng thẻ <select> bằng ID
const selectedOptionValue = selectElement.options[0].value; // Lấy giá trị của tùy chọn được chọn
function myFunction() {
	//console.log(selectElement.value);
	if(selectElement.value === 'USER') {
		alert('Admin không được phép cập nhật thành USER !')
		selectElement.value = 'Chọn chức danh';
	}
}
$(document).ready(function () {	
	$('input.cancle').on("click", function(event) {
		location.assign("/CharityApp/admin/quan-ly-tai-khoan");
	});
	
	
	
	$("#btnReset").click(function() {
		 $("#mySelect").val("${accountByID.account_role}");
		 $("#account_name").val("${accountByID.account_name}");
		 $("#account_phone").val("${accountByID.account_phone}");
	});
	
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
                required: true
            },
            "account_status": {
                required: true
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
            },
            "account_status": {
                required: "Hãy chọn trạng thái"
            }
          }
       });
	/*
	$("#btnSubmit").on("click",function(event) {
		$.ajax({
			url : "/CharityApp/admin/cap-nhat-tai-khoan",
			type : 'post',
			data : {
				account_id : $("#account_id").val(),
				account_role : $("#account_role").val(),
				account_mail : $("#account_mail").val(),
				account_name : $("#account_name").val(),
				account_phone : $("#account_phone").val()
			},
			success : function(response) {
				alert('Cập nhật thành công !!!');
				location.assign("/CharityApp/admin/quan-ly-tai-khoan");
			},
			error : function() {
				alert('Cập nhật thất bại !!!');
				location.assign("/CharityApp/admin/cap-nhat-tai-khoan?id="+$("#account_id").val());
			}
		});
	});	
	*/
});

</script>