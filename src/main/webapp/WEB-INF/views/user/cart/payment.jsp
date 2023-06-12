<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<script>
	alert('Cảm ơn bạn đã quyên góp!!\n Mọi đóng góp dù nhỏ cũng là một niềm động viên rất lớn!!!');
</script>
<div class="container pt-120 mb-4">
	<div class="mb-4">
	<h2 class="deepPink">Ủng hộ</h2>
	<p>Quý vị có thể đóng góp tài chính cho Quỹ, các chương trình của
		Quỹ Charity hệ thống tài khoản ngân
		hàng hoặc gửi trực tiếp về văn phòng Quỹ. Mọi đóng góp tài chính dù
		lớn hay nhỏ sẽ được cập nhật trong vòng 24h kể từ khi chúng tôi nhận
		được.</p>
	</div>
	<div class="row list-box  justify-content-between">
		<div class="col-lg-6 box-item row" id="box-bank">
			<div class="box-content  col-lg-9 col-md-9 col-9">
				<h3>Giao dịch ngân hàng</h3>
				<p>Chuyển khoản hoặc nộp tiền mặt tại các ngân hàng trên toàn
					quốc</p>
			</div>
			<div class="icon col-lg-3 col-md-3 col-3">
				<img alt="icon-bank"
					src="<c:url value="/resources/user/img/icon-bank.jfif"/>">
			</div>
		</div>
		<div class="col-lg-6 box-item row" id="box-office">
			<div class="box-content col-lg-9 col-md-9 col-9">
				<h3>Trực tiếp</h3>
				<p>Tại văn phòng Charity</p>
			</div>
			<div class="icon col-lg-3 col-md-3 col-3">
				<img alt="icon-bank"
					src="<c:url value="/resources/user/img/icon-cash.png"/>">
			</div>
		</div>
	</div>

	<div id="bank-info" class="row mt-4">
		<div class="wrap-payments-bank col-lg-12">
			<div class="title">
				<h2>Giao dịch ngân hàng</h2>
			</div>
			<div class="syntax-payments">
				<p>
					Cú pháp chuyển khoản ủng hộ: <strong>Họ và tên người
						chuyển_Tên chương trình</strong>
				</p>
				<p>Ví dụ:</p>
				<p>Nguyen Van A_Anh sang hoc duong</p>
				<p>Nguyen Van A_Nang buoc em den truong</p>
				<p>Nguyen Van A_Mat troi hy vong</p>
				<p>Nguyen Van A_Tre yeu the</p>
			</div>
		</div>
		<div class="wrap-transfer-info col-lg-12 col-md-12 col-12 row mt-4">
			<div class="col-lg-6 col-md-6 col-12">
				<div class="title-col deepPink">
					<h3>Số tài khoản VNĐ</h3>
				</div>
				<div class="list-info-bank mt-4">
					<div class="item-info row justify-content-between">
						<div class="col-lg-5 col-md-5 col-5">
							<span class="logo"> <img style="width: 100%;"
								src="https://quyhyvong.com/wp-content/plugins/foxpay-donate/assets/images/bank_agribank.svg"
								alt="Agribank">
							</span>
						</div>
						<div class="col-lg-7 col-md-7 col-7">
							<div class="name-bank">Ngân hàng Agribank</div>
							<div class="gr-info">
								<div class="info" style="min-width: 150px;">
									<span class="text-title">Số tài khoản:</span> <span
										class="text-value">1500223204211</span>
								</div>
								<div class="info" style="min-width: 125px;">
									<span class="text-title">Chủ tài khoản:</span> <span
										class="text-value">Quỹ Charity</span>
								</div>
								<div class="info">
									<span class="text-title">Chi nhánh:</span> <span
										class="text-value">TPHCM</span>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="list-info-bank mt-4">
					<div class="item-info row justify-content-between">
						<div class="col-lg-5 col-md-5 col-5">
							<span class="logo"> <img style="width: 100%;"
								src="https://quyhyvong.com/wp-content/plugins/foxpay-donate/assets/images/bank_Sacombank.png"
								alt="Sacombank">
							</span>
						</div>
						<div class="col-lg-7 col-md-7 col-7">
							<div class="name-bank">Ngân hàng Sacombank</div>
							<div class="gr-info">
								<div class="info" style="min-width: 150px;">
									<span class="text-title">Số tài khoản:</span> <span
										class="text-value">020018826623</span>
								</div>
								<div class="info" style="min-width: 125px;">
									<span class="text-title">Chủ tài khoản:</span> <span
										class="text-value">Quỹ Charity</span>
								</div>
								<div class="info">
									<span class="text-title">Chi nhánh:</span> <span
										class="text-value">TPHCM</span>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="list-info-bank mt-4">
					<div class="item-info row justify-content-between">
						<div class="col-lg-5 col-md-5 col-5">
							<span class="logo"> <img style="width: 100%;"
								src="https://quyhyvong.com/wp-content/plugins/foxpay-donate/assets/images/bank_BIDV.png"
								alt="BIDV">
							</span>
						</div>
						<div class="col-lg-7 col-md-7 col-7">
							<div class="name-bank">Ngân hàng BIDV</div>
							<div class="gr-info">
								<div class="info" style="min-width: 150px;">
									<span class="text-title">Số tài khoản:</span> <span
										class="text-value">42710008180228</span>
								</div>
								<div class="info" style="min-width: 125px;">
									<span class="text-title">Chủ tài khoản:</span> <span
										class="text-value">Quỹ Charity</span>
								</div>
								<div class="info">
									<span class="text-title">Chi nhánh:</span> <span
										class="text-value">TPHCM</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="list-info-bank mt-4">
					<div class="item-info row justify-content-between">
						<div class="col-lg-5 col-md-5 col-5">
							<span class="logo"> <img style="width: 100%;"
								src="https://quyhyvong.com/wp-content/plugins/foxpay-donate/assets/images/bank_techcombank.png"
								alt="Techcombank">
							</span>
						</div>
						<div class="col-lg-7 col-md-7 col-7">
							<div class="name-bank">Ngân hàng Techcombank</div>
							<div class="gr-info">
								<div class="info" style="min-width: 150px;">
									<span class="text-title">Số tài khoản:</span> <span
										class="text-value">19114210368222644</span>
								</div>
								<div class="info" style="min-width: 125px;">
									<span class="text-title">Chủ tài khoản:</span> <span
										class="text-value">Quỹ Charity</span>
								</div>
								<div class="info">
									<span class="text-title">Chi nhánh:</span> <span
										class="text-value">TPHCM</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="list-info-bank mt-4">
					<div class="item-info row justify-content-between">
						<div class="col-lg-5 col-md-5 col-5">
							<span class="logo"> <img style="width: 100%;"
								src="https://quyhyvong.com/wp-content/plugins/foxpay-donate/assets/images/bank_TPBank.png"
								alt="TPB">
							</span>
						</div>
						<div class="col-lg-7 col-md-7 col-7">
							<div class="name-bank">Ngân hàng TPBank</div>
							<div class="gr-info">
								<div class="info" style="min-width: 150px;">
									<span class="text-title">Số tài khoản:</span> <span
										class="text-value">30020314223199</span>
								</div>
								<div class="info" style="min-width: 125px;">
									<span class="text-title">Chủ tài khoản:</span> <span
										class="text-value">Quỹ Charity</span>
								</div>
								<div class="info">
									<span class="text-title">Chi nhánh:</span> <span
										class="text-value">TPHCM</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="list-info-bank mt-4">
					<div class="item-info row justify-content-between">
						<div class="col-lg-5 col-md-5 col-5">
							<span class="logo"> <img style="width: 100%;"
								src="https://quyhyvong.com/wp-content/plugins/foxpay-donate/assets/images/bank_vcb.png"
								alt="Vietcombank">
							</span>
						</div>
						<div class="col-lg-7 col-md-7 col-7">
							<div class="name-bank">Ngân hàng Vietcombank</div>
							<div class="gr-info">
								<div class="info" style="min-width: 150px;">
									<span class="text-title">Số tài khoản:</span> <span
										class="text-value">0011006026854</span>
								</div>
								<div class="info" style="min-width: 125px;">
									<span class="text-title">Chủ tài khoản:</span> <span
										class="text-value">Quỹ Charity</span>
								</div>
								<div class="info">
									<span class="text-title">Chi nhánh:</span> <span
										class="text-value">TPHCM</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12 bank-usd">
				<div class="title-col deepPink">
					<h3>Số tài khoản USD</h3>
				</div>
				<div class="info-account-usd">
					<p>
						<span>Account Name:</span> CHARITY FOUNDATION
					</p>
					<p>
						<span>Account Number:</span> 73007000003444
					</p>
					<p>
						<span>Bank name:</span> TIEN PHONG COMMERCIAL JOINT STOCK BANK,
						TPHCM, VIETNAM.
					</p>
					<p>
						<span>Address:</span> TPBank Building - 57 Ly Thuong Kiet - Hoan
						Kiem District - Hanoi
					</p>
					<p>
						<span>Swift code/BIC:</span> TPBVVNVX
					</p>
				</div>
			</div>
		</div>
		<!-- Nội dung thông tin tài khoản -->
	</div>

	<div id="office-info" class="hidden row mt-4">
		<div id="block-donate-office" style="display: block;"
			class="block-content wrap-payments-bank">
			<div class="title">
				<h2>Văn phòng Quỹ Charity:</h2>
			</div>
			<div class="syntax-payments">
				<p>
					Phía Bắc: <strong>Tầng 9, Tòa nhà FPT Tower, số 10 Phạm
						Văn Bạch, Dịch Vọng, Cầu Giấy, Hà Nội.</strong>
				</p>
				<p>
					Phía Nam: <strong>Tầng 6, Tòa nhà Exchange Tower, số 1 Nam
						Kỳ Khởi Nghĩa, Phường Nguyễn Thái Bình, Quận 1, Tp.HCM.</strong>
				</p>
				<p>
					Hotline: <strong>0972 776 776</strong>
				</p>
			</div>
		</div>
	</div>
</div>
<script src="<c:url value="/resources/user/js/payment.js"/>">
	
</script>