<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<div class="popular_causes_area section_padding mt-4">
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-5">
							<h2>
								<b>Xác nhận</b> quyên góp
							</h2>
						</div>
						<div class="col-sm-7">
							<a href="nhung-hoan-canh" class="btn btn-secondary"> <i
								class="fa fa-hand-o-right"></i> <span>Trở về trang quyên
									góp</span></a>
							<!--  
							 <a
								href="#" class="btn btn-secondary"><i class="material-icons">&#xE24D;</i>
								<span>Export to Excel</span></a>
						-->
						</div>
					</div>
				</div>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Tên quyên góp</th>
							<th>Đối tác</th>
							<th>Loại hoàn cảnh</th>
							<th>Ngày quyên góp</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="hoan-canh-chi-tiet?id=${circum.circum_id}">${circum.circum_name}</a></td>
							<td><a href="doi-tac-chi-tiet?id=${circum.partner_id}">
									<img src="<c:url value="${logoPartner}"/>" style="width: 20%;"
									alt="logo Partner">
							</a></td>
							<td>${circum.circum_type}</td>
							<td><fmt:formatDate type="date" dateStyle="short"
									value="${now}" /></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>


<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			
			<h3 class="mb-30">Thông tin người ủng hộ</h3>
			<form id="formSubmit" action="quyen-gop" method="post">

				<input type="hidden" name="circum_id" id="circum_id"
					value="${circum.circum_id}"> 
				<input type="hidden"
					name="circum_order_date" id="circum_order_date"
					value="<fmt:formatDate type = "date" 
	        						 dateStyle = "short" value = "${now}" />">
	        	<input type="hidden" name="circum_name" id="circum_name"
					value="${circum.circum_name}">
	        	<security:authorize access="!isAuthenticated()">
	        		
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Họ và tên</label> <input type="text"
							name="circum_order_name" id="circum_order_name"
							class="single-input col-sm-7" placeholder="Họ tên">
					</div>
					
					<div class="mt-10 form-group">
						<label class="col-sm-3">Địa chỉ Email</label> <input type="email"
							name="circum_order_mail" id="circum_order_mail"
							placeholder="Địa chỉ Email" class="single-input col-sm-7">
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Số điện thoại</label> <input type="text"
							name="circum_order_phone" id="circum_order_phone"
							class="single-input col-sm-7" placeholder="Số điện thoại">
					</div>
					
	
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Tài khoản ngân hàng</label> <input
							type="text" name="circum_order_bank" id="circum_order_bank"
							class="single-input col-sm-7" placeholder="Tài khoản ngân hàng">
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Số tiền quyên góp (Đv: nghìn đồng)</label> 
						<input type="number" id="circum_order_amount" class="single-input col-sm-7"
								name="circum_order_amount"  min="1"/>
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Tên ngân hàng</label> <input type="text"
							name="circum_order_bankname" id="circum_order_bankname"
							class="single-input col-sm-7" placeholder="Tên ngân hàng">
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Địa chỉ</label> <input type="text"
							name="circum_order_address" id="circum_order_address"
							class="single-input col-sm-7" placeholder="Địa chỉ">
					</div>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Username</label> <input type="text"
							name="circum_order_name" id="circum_order_name"
							class="single-input col-sm-7" placeholder="Họ tên"
							value="${accountDetails.account_name }" readonly>
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3">Địa chỉ Email</label> <input type="email"
							name="circum_order_mail" id="circum_order_mail"
							placeholder="Địa chỉ Email" class="single-input col-sm-7"
							value="${accountDetails.account_mail}" readonly>
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Số điện thoại</label> <input type="text"
							name="circum_order_phone" id="circum_order_phone"
							class="single-input col-sm-7" placeholder="Số điện thoại"
							value="${accountDetails.account_phone}">
					</div>
	
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Tài khoản ngân hàng</label> <input
							type="text" name="circum_order_bank" id="circum_order_bank"
							class="single-input col-sm-7" placeholder="Tài khoản ngân hàng"
							value="${accountDetails.account_bank}">
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Số tiền quyên góp (Đv: nghìn đồng)</label> 
						<input type="number" id="circum_order_amount" class="single-input col-sm-7"
								name="circum_order_amount"  min="1"/>
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Tên ngân hàng</label> <input type="text"
							name="circum_order_bankname" id="circum_order_bankname"
							class="single-input col-sm-7" placeholder="Tên ngân hàng"
							value="${accountDetails.account_bankname}">
					</div>
					<div class="mt-10 form-group">
						<label class="col-sm-3 ">Địa chỉ</label> <input type="text"
							name="circum_order_address" id="circum_order_address"
							class="single-input col-sm-7" placeholder="Địa chỉ"
							value="${accountDetails.account_address}">
					</div>
				</security:authorize>
				<div class="mt-10 form-group">

					<div class="col-10 mt-4">
						<div class="donate_now_btn text-center">
							<input type="submit" class="boxed-btn4" value="Xác nhận">
							<input type="button" class="boxed-btn4" 
							id="reset" value="Reset">
							<input type="button" class="boxed-btn4" 
							id="cancel" value="Hủy">
						</div>
						<div class="donate_now_btn text-center">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="<c:url value="/resources/user/js/cart.js"/>">
	
</script>