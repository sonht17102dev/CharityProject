<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="container-xl px-4 mt-4 mb-4" style="margin-top: 50px !important;">
	
	<%@ include file="/WEB-INF/views/user/manageUser/menu.jsp" %>
	<div class="row">
		<div class="col-xl-4">

			<div class="card mb-4 mb-xl-0">
				<div class="card-header">Hình đại diện</div>
				<div class="card-body text-center">

					<img class="img-account-profile rounded-circle mb-2"
						src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">

					<div class="small font-italic text-muted mb-4">JPG hay PNG
						không vượt quá 5 MB</div>

					<button class="btn btn-primary" type="button">Tải ảnh mới</button>
				</div>
			</div>
			<div class="card mb-4 mb-xl-0">
				<div class="card-body text-center">
					<a href="${pageContext.request.contextPath}/trang-chu" class="btn btn-success">
						Về trang chủ</a>
				</div>
			</div>
		</div>
		<!-- layout change infomation -->
		<div id="changeInfo" class="col-xl-8">
			<div class="card mb-4">
				<div class="card-header">Thông tin tài khoản</div>
				<div class="card-body">
					<form id="formInfo" method="post" action="${pageContext.request.contextPath}/tai-khoan/cap-nhat">
						<input type="hidden" name="id" value="${user.account_id}">
						<div class="mb-3">
							<label class="small mb-1" for="inputUsername">Username
								(tên của bạn sẽ hiển thị như thế nào với những người dùng khác
								trên trang web)</label> <input class="form-control" id="username"
								type="text" placeholder="Nhập username của bạn" name="username"
								value="${user.account_name}">
						</div>

						<div class="row gx-3 mb-3">
							
							<div class="col-md-6">
								<label class="small mb-1" for="inputFirstName">Tên</label> <input
									class="form-control" id="firstName" name="firstName"
									type="text" placeholder="Nhập tên của bạn" 
									value="${userDetails.account_firstName}">
							</div>

							<div class="col-md-6">
								<label class="small mb-1" for="inputLastName">Họ</label> <input
									class="form-control" id="lastName" name="lastName" type="text"
									placeholder="Nhập họ của bạn" 
									value="${userDetails.account_lastName}">
							</div>
						</div>

						<div class="row gx-3 mb-3">

							<div class="col-md-6">
								<label class="small mb-1" for="inputOrgName">Tên tổ chức</label>
								<input class="form-control" id="orgName" name="orgName"
									type="text" placeholder="Nhập tên tổ chức của bạn" 
									value="${userDetails.account_organization}">
							</div>

							<div class="col-md-6">
								<label class="small mb-1" for="inputLocation">Địa chỉ</label> <input
									class="form-control" id="address" name="address" type="text"
									placeholder="Nhập địa chỉ của bạn" 
									value="${userDetails.account_address}">
							</div>
						</div>

						<div class="mb-3">
							<label class="small mb-1" for="inputEmailAddress">Địa chỉ
								Email</label> <input class="form-control" id="email" name="email"
								type="email" placeholder="Nhập địa chỉ email của bạn" 
								value="${user.account_mail}" disabled>
						</div>

						<div class="row gx-3 mb-3">

							<div class="col-md-6">
								<label class="small mb-1" for="inputPhone">Số điện thoại</label>
								<input class="form-control" id="phone" name="phone" type="tel"
									placeholder="Nhập số điện thoại của bạn" 
									value="${user.account_phone}">
							</div>

							<div class="col-md-6">
								<label class="small mb-1" for="inputBirthday">Ngày sinh</label>
								<input class="form-control" id="birthday" type="text"
									name="birthday" placeholder="Nhập ngày sinh của bạn" 
									value="${userDetails.account_birthday}">
							</div>
						</div>

						<button class="btn btn-primary" type="submit">Lưu thay
							đổi</button>
					</form>
				</div>
			</div>
		</div>
		<!-- end layout change infomation -->
	</div>
</div>
<script>
	$(document).ready(function() {
		$("#formInfo").validate({
			rules : {
				"username" : {
					required : true
				},
				"password" : {
					required : true
				}
			},
			messages : {
				"username" : {
					required : "Vui lòng nhập username của bạn !!!"
				},
				"password" : {
					required : "Vui lòng nhập mật khẩu của bạn !!!"
				}
			}
		});
	});
</script>