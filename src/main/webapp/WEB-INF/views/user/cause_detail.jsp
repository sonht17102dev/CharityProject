<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!-- bradcam_area_start  -->
<c:set var="percent"
	value="${circumDetail.circum_target / circumDetail.circum_raise * 100}" />

<div class="section-top-border">
	<div class="row">
		<div class="col-lg-12 causes">
			<h2>
				<c:out value="${circumDetail.circum_name}" />
			</h2>
			<p>
				❤️
				<c:out value="${circumDetail.circum_des}" />
			</p>
			<div>
				<p>
					<span>${circumDetail.circum_start_donate}</span> <span
						style="float: right;"><a href="#">Chia sẻ <i
							class="fa fa-arrow-right" aria-hidden="true"></i></a></span>
				</p>
			</div>
		</div>


	</div>

</div>
<div class="news__area section_padding">
	<div class="container">
		<div class="col-lg-12">
			<div class="news_active owl-carousel">
				<c:forEach items="${img}" var="img_cause">
					${img_cause}
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end -->
<!-- popular_causes_area_start  -->
<div class="section-top-border">
	<div class="row">
		<div class="col-lg-9 col-md-8 causes">
			<h3 class="mb-30">Câu chuyện</h3>
			<article class="soju__prose small">
			${circumDetail.circum_content}
			</article>
			<div class="horizontal_line"></div>
			<!-- Nhà hảo tâm hàng đầu start-->
			<div>
				<h2>Nhà hảo tâm hàng đầu</h2>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>1</li>
							<li>HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>2</li>
							<li style="padding-left: 20px;">HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>3</li>
							<li style="padding-left: 20px;">HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>4</li>
							<li>HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>5</li>
							<li>HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
					<div class="btn-submit">
						<a href="#">Xem tất cả</a>
					</div>
				</div>
			</div>
			<!-- Nhà hảo tâm hàng đầu end-->
			<div class="horizontal_line"></div>
			<!-- Nhà hảo tâm mới nhất start-->
			<div>
				<h2>Nhà hảo tâm mới nhất</h2>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>1</li>
							<li>HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>2</li>
							<li style="padding-left: 20px;">HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>3</li>
							<li style="padding-left: 20px;">HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>4</li>
							<li>HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
				</div>
				<div>
					<div class="list_volunteer">
						<ul>
							<li>5</li>
							<li>HO THI MY NGOC<br>*******192
							</li>
							<li style="float: right;">500.000đ</li>
						</ul>
					</div>
					<div class="btn-submit">
						<a href="#">Xem tất cả</a>
					</div>
				</div>
			</div>
			<!-- Nhà hảo tâm mới nhất end-->
		</div>
		<div class="col-lg-3 col-md-4 mt-sm-30 sidebar_right">
			<div class="single-element-widget ">

				<div class="causes_content">
					<h2 class="mb-30">Thông tin quyên góp</h2>
					<div
						class="balance d-flex justify-content-between align-items-center">
						<span><fmt:formatNumber type="number"
								value="${circumDetail.circum_target}" /> đ quyên góp / <fmt:formatNumber
								type="number" value="${circumDetail.circum_raise}" />đ </span>
					</div>
					<div class="custom_progress_bar">
						<c:if test="${percent >= 100}">
							<div class="progress-bar" role="progressbar" style="width: 100%;"
								aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
								<span class="progres_count"> ${percent}% </span>
							</div>
						</c:if>

						<c:if test="${percent < 100}">
							<div class="progress-bar" role="progressbar"
								style="width: ${percent}%;" aria-valuenow="30" aria-valuemin="0"
								aria-valuemax="100">
								<span class="progres_count"> <fmt:formatNumber
										type="number" maxFractionDigits = "1" value="${percent}" /> %
								</span>
							</div>
						</c:if>
					</div>

					<div class="infomation">
						<ul>
							<li>Lượt quyên góp <br> <span><fmt:formatNumber
										type="number" value="${circumDetail.circum_donations}" /></span></li>
							<li>Đạt được <br> <span><fmt:formatNumber
										type="number" maxFractionDigits="1" value="${percent}" />%</span></li>
							<li>Thời gian còn <br>${circumDetail.circum_time_end}
								Ngày<span></span>
							</li>

						</ul>
					</div>
					<div class="">
						<a href="#" class="btn-Donate-sidebar">Quyên góp</a>
						<p>Đồng hành cùng dự án</p>

						<div class="partner">

							<div class="partner_img">

								<img src="<c:url value="${circumDetail.partner_logo}"/>">
							</div>
							<div class="partner_content">
								<p class="mb-20" style="color: deeppink;">${circumDetail.partner_name}</p>
								<p>
									<a href="doi-tac-chi-tiet?id=${circumDetail.partner_id}">Tìm hiểu thêm >></a>
								</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<div class="popular_causes_area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb-55">
					<h3>
						<span>Các hoàn cảnh Quyên góp</span>
					</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<c:forEach items="${listTop3Circum}" var="o">
					<c:set var="percentTop3"
						value="${o.circum_target / o.circum_raise * 100}" />
					<div class="single_cause box-cause">
						<div class="thumb">
							${o.circum_image}
						</div>
						<div class="causes_content">
							<div class="custom_progress_bar">
								<div class="progress">
									<c:if test="${percentTop3 >= 100}">
										<div class="progress-bar" role="progressbar"
											style="width: 100%;" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100">
											<span class="progres_count"> <fmt:formatNumber
													type="number" maxFractionDigits="1" value="${percentTop3}" /> </span>
										</div>
									</c:if>

									<c:if test="${percentTop3 < 100}">
										<div class="progress-bar" role="progressbar"
											style="width: <fmt:formatNumber
													type="number" maxFractionDigits="1" value="${percentTop3}" />%;" aria-valuenow="30"
											aria-valuemin="0" aria-valuemax="100">
											<span class="progres_count"> <fmt:formatNumber
													type="number" maxFractionDigits="1" value="${percentTop3}" />
											</span>
										</div>
									</c:if>

								</div>
							</div>
							<div
								class="balance d-flex justify-content-between align-items-center">
								<span>Raised: <fmt:formatNumber type="number"
										value="${o.circum_target}" />đ
								</span> <span>Goal: <fmt:formatNumber type="number"
										value="${o.circum_raise}" />đ
								</span>
							</div>
							<h4>${o.circum_name}</h4>
							<div class="infomation">
								<ul>
									<li>Lượt quyên góp <br> <span><fmt:formatNumber
												type="number" value="${o.circum_donations}" /></span></li>
									<li>Đạt được <br>
									<span><fmt:formatNumber
													type="number" maxFractionDigits="1" value="${percentTop3}" />%</span></li>
									<c:if test="${percentTop3 >=100}">
										<li><a href="#" data-scroll-nav='1' class="btn-Donate">Đạt
												mục tiêu</a></li>
									</c:if>
									<c:if test="${percentTop3 < 100}">
										<li><a href="quyen-gop" data-scroll-nav='1'
											class="btn-Donate">Quyên góp</a></li>
									</c:if>
								</ul>
							</div>

							<a class="read_more" href="hoan-canh-chi-tiet?id=${o.circum_id}">Đọc
								thêm </a>
						</div>
					</div>
				</c:forEach>
			</div>




		</div>

	</div>
</div>
<!-- popular_causes_area_end  -->