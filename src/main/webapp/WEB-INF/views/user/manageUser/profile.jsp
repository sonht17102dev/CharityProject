<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="container-xl px-4 mt-4 mb-4"
	style="margin-top: 70px !important;">

	<%@ include file="/WEB-INF/views/user/manageUser/menu.jsp"%>
	<div class="row">
		<div class="col-xl-4">
			
			
			<div class="card mb-4 mb-xl-0">
				<div class="card-header deepPink text-center font-larger">Hình đại diện</div>
				<div class="card-body text-center ">
					<c:if test="${info.account_image != null}">
						<img class="img-account-profile rounded-circle mb-2"
							src="<c:url value="/resources/image/${info.account_image}"/>"
							alt="Hình đại diện">
					</c:if>
					<c:if test="${info.account_image == null}">
						<img class="img-account-profile rounded-circle mb-2"
							src="<c:url value="/resources/user/img/no-image.jpg"/>"
							alt="Hình đại diện">
					</c:if>
					
					<div class="small font-italic text-muted mb-4">JPG hay PNG
						không vượt quá 5 MB</div>
						<form
							action="${pageContext.request.contextPath}/tai-khoan/uploadfile"
							method="post" enctype="multipart/form-data">
							<input type="hidden" id="username" name="username"
								value="${info.account_name}" readonly> <input
								type="hidden" name="id" value="${info.account_id}">
								
							<div class="form-group">
								<label for="formFile" class="form-label">Cập nhật ảnh đại diện</label>
								<input name="thisfile" class="form-control" type="file"
									id="formFile">
							</div>
							<button class="btn btn-primary">Tải ảnh mới</button>
						</form>
				</div>
			</div>
			<div class="card mb-4 mb-xl-0">
				<div class="card-body text-center">
					<a href="${pageContext.request.contextPath}/trang-chu"
						class="btn btn-success"> Về trang chủ</a>
				</div>
			</div>
		</div>
		<!-- layout change infomation -->
		<div id="changeInfo" class="col-xl-8">
			<div class="card mb-4">
				<div class="card-header deepPink font-larger">
					Thông tin tài khoản
					<c:if test="${param.messageUser == 'Cập nhật thành công !!!'}">
						<span style="color: green; float: right;">Cập nhật thành
							công !!</span>
					</c:if>
				</div>
				<div class="table-responsive-md">
				<table class="table table-hover" id="table-info">
					<thead class="thead-light ">
						<tr class="text-center">
							<th scope="col" colspan="2" >Thông tin chi tiết</th>
							<th scope="col">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:if test='${info.account_firstName!=null}'>
								<td scope="row" class="primary">
									<ul class="info-table-row">
										<li>Username</li>
										<li>Tên</li>
										<li>Họ</li>
										<li>Địa chỉ Email</li>
										<li>Tên tổ chức</li>
										<li>Địa chỉ</li>
										<li>Số điện thoại</li>
										<li>Ngày sinh</li>
										<li>Số tài khoản</li>
										<li>Ngân hàng</li>
									</ul>
								</td>
								<td scope="row">
									<ul class="info-table-row">
										<li>${info.account_name}</li>
										<li>${info.account_firstName}</li>
										<li>${info.account_lastName}</li>									
										<li>${info.account_mail}</li>
										<li>${info.account_organization}</li>
										<li>${info.account_address}</li>
										<li>${info.account_phone}</li>
										<li>${info.account_birthday}</li>
										<li>${info.account_bank}</li>
										<li>${info.account_bankname}</li>
									</ul>
								</td>
							</c:if>
							<c:if test='${info.account_firstName == null}'>
								<td scope="row" colspan="2" class="primary text-center">
								Vui lòng cập nhật thông tin cá nhân!</td>
							</c:if>
							<td scope="row" class="btnEdit"> <button class="btn btn-primary" 
							id="btn-Edit" onclick="showFormInfo()">Cập nhật</button></td>
						</tr>
						
					</tbody>
				</table>
				</div>
				<div class="card-body " >
					<form:form id="formInfo" method="post" class="hidden " modelAttribute="info"
						action="${pageContext.request.contextPath}/tai-khoan/cap-nhat">
						<form:input type="hidden" name="id" value="${info.account_id}"  path="account_id"/>
						<div class="mb-3">
							<label class="mb-1" for="inputUsername">Username (tên của
								bạn sẽ hiển thị như thế nào với những người dùng khác trên trang
								web)</label> <form:input class="form-control" id="username" name="username"
								type="text" placeholder="Nhập username của bạn" path="account_name"
								value="${info.account_name}"/>
						</div>

						<div class="row gx-3 mb-3">

							<div class="col-md-6">
								<label class="mb-1" for="inputFirstName">Tên</label> <form:input
									class="form-control" id="firstName" name="firstName"
									type="text" placeholder="Nhập tên của bạn" path="account_firstName"
									value="${info.account_firstName}"/>
							</div>

							<div class="col-md-6">
								<label class="mb-1" for="inputLastName">Họ</label> <form:input
									class="form-control" id="lastName" name="lastName" type="text"
									placeholder="Nhập họ của bạn" path="account_lastName"
									value="${info.account_lastName}"/>
							</div>
						</div>

						<div class="row gx-3 mb-3">

							<div class="col-md-6">
								<label class="mb-1" for="inputOrgName">Tên tổ chức</label> <form:input
									class="form-control" id="orgName" name="orgName" type="text"
									placeholder="Nhập tên tổ chức của bạn" path="account_organization"
									value="${info.account_organization}"/>
							</div>

							<div class="col-md-6">
								<label class="mb-1" for="inputLocation">Địa chỉ</label> <form:input
									class="form-control" id="address" name="address" type="text"
									placeholder="Nhập địa chỉ của bạn" path="account_address"
									value="${info.account_address}"/>
							</div>
						</div>

						<form:input class="form-control" id="email" name="email" type="hidden"
								placeholder="Nhập địa chỉ email của bạn" path="account_mail"
								value="${info.account_mail}" readonly="true" />

						<div class="row gx-3 mb-3">

							<div class="col-md-6">
								<label class="mb-1" for="inputPhone">Số điện thoại</label> <form:input
									class="form-control" id="phone" name="phone" type="text"
									placeholder="Nhập số điện thoại của bạn" path="account_phone"
									value="${info.account_phone}"/>
							</div>

							<div class="col-md-6">
								<label class="mb-1" for="inputBirthday">Ngày sinh</label> <form:input
									class="form-control" id="birthday" type="text" name="birthday"
									placeholder="Nhập ngày sinh của bạn" path="account_birthday"
									value="${info.account_birthday}"/>
							</div>
						</div>
						<div class="row gx-3 mb-3">

							<div class="col-md-6">
								<label class="mb-1" for="inputBank">Số tài khoản</label> <form:input
									class="form-control" id="bank" name="bank" type="text"
									placeholder="Nhập số tài khoản của bạn" path="account_bank"
									value="${info.account_bank}"/>
							</div>

							<div class="col-md-6">
								<label class="mb-1" for="inputBankname">Ngân hàng</label> <form:input
									class="form-control" id="bankname" type="text" name="bankname"
									placeholder="Nhập tên ngân hàng của bạn" path="account_bankname"
									value="${info.account_bankname}"/>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col-lg-6 col-md-6 col-6 btn-form-info" >
								<button class="btn btn-primary " id="btn-submit" type="submit">Lưu</button>
								</div>
							<div class="col-lg-6 col-md-6 col-6 btn-form-info" >
								<button class="btn btn-warning" id="btn-cancle" 
								onclick = "hideFormInfo()"
								type="button">Hủy</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- end layout change infomation -->
	</div>
</div>

<script src="<c:url value="/resources/user/js/profile.js"/>">
	
</script>