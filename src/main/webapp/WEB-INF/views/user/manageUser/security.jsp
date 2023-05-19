<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="container-xl px-4 mt-4" style="margin-top: 70px !important;">
	<%@ include file="/WEB-INF/views/user/manageUser/menu.jsp"%>
	<div class="row">
		<div class="col-lg-8">
		<c:if test="${messagePass != null}">
			<h3 style="color: blue;">${messagePass}</h3>
		</c:if>
			<div class="card mb-4">
				<div class="card-header">
				Thay đổi mật khẩu
				</div>
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/tai-khoan/bao-mat" method="post" id="formChangePass">
						<input type="hidden" id="account_mail" name="account_mail"
						 value="<security:authentication
											property="principal.username" />"/>
						<div class="mb-3">
							<label class="small mb-1" for="currentPassword">Mật khẩu cũ</label> 
							<input class="form-control" id="currentPassword" name="currentPassword"
								type="password" placeholder="Enter current password">
						</div>

						<div class="mb-3">
							<label class="small mb-1" for="newPassword">Mật khẩu mới</label>
							<input class="form-control" id="newPassword" type="password"
								name="newPassword" placeholder="Enter new password">
						</div>

						<div class="mb-3">
							<label class="small mb-1" for="confirmPassword">Xác nhận mật khẩu mới</label> 
							<input class="form-control" id="confirmPassword" name="confirmPassword"
								type="password" placeholder="Confirm new password">
						</div>
						<button class="btn btn-primary" type="submit">Lưu </button>
					</form>
				</div>
			</div>

		</div>
		<!--  
		<div class="col-lg-4">

			<div class="card mb-4">
				<div class="card-header">Xác thực hai yếu tố</div>
				<div class="card-body">
					<p>Thêm một mức bảo mật khác vào tài khoản của bạn bằng cách bật xác thực hai yếu tố.
					 Chúng tôi sẽ gửi cho bạn một tin nhắn văn bản để xác minh nỗ lực đăng nhập của bạn
					  trên các thiết bị và trình duyệt không được nhận dạng.</p>
					<form>
						<div class="form-check">
							<input class="form-check-input" id="twoFactorOn" type="radio"
								name="twoFactor" checked=""> <label
								class="form-check-label" for="twoFactorOn">On</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" id="twoFactorOff" type="radio"
								name="twoFactor"> <label class="form-check-label"
								for="twoFactorOff">Off</label>
						</div>
						<div class="mt-3">
							<label class="small mb-1" for="twoFactorSMS">Số điện thoại nhận SMS</label> <input
								class="form-control" id="twoFactorSMS" type="tel"
								placeholder="Enter a phone number" value="555-123-4567">
						</div>
					</form>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header">Xóa tài khoản</div>
				<div class="card-body">
					<p>Xóa tài khoản của bạn là một hành động vĩnh viễn và không thể hoàn tác.
					 Nếu bạn chắc chắn muốn xóa tài khoản của mình, hãy chọn nút bên dưới.</p>
					<button class="btn btn-danger-soft text-danger" type="button">Tôi hiểu,
					 xóa tài khoản của tôi</button>
				</div>
			</div>
		</div>
		-->
	</div>
</div>
<script>
	$(document).ready(function() {
		$.validator.addMethod("validatePassword", function (value, element, param) {
            return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
        }, "Hãy nhập password từ 8 đến 16 ký tự bao gồm chữ hoa, chữ thường và ít nhất một chữ số");

		$("#formChangePass").validate({
			rules : {
				"currentPassword" : {
					required : true,
					//minlength: 8
				},
				"newPassword" : {
					required : true,
					validatePassword: true,
					minlength: 8
				},
				"confirmPassword" : {
					required : true,
					equalTo: "#newPassword",
					validatePassword: "#re-password",
					minlength: 8
				}
				
			},
			messages : {
				"currentPassword" : {
					required : "Vui lòng nhập mật khẩu cũ !!!",
					minlength : "Hãy nhập ít nhất 8 ký tự !!!"
				},
				"newPassword" : {
					required : "Vui lòng nhập mật khẩu mới !!!",
					minlength : "Hãy nhập ít nhất 8 ký tự !!!"
				},
				"confirmPassword" : {
					required : "Vui lòng nhập lại mật khẩu mới !!!",
					equalTo: "Hai password phải giống nhau",
					minlength : "Hãy nhập ít nhất 8 ký tự !!!"
				}
			}
		});
	});
</script>