<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!-- slider_area_start -->
<div class="slider_area mt-4">
	<div class="single_slider  d-flex align-items-center justify-content-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12 introduce_partner">
					<h1>${partnerDetail.partner_name}</h1>
					<p>${partnerDetail.partner_introduce}</p>
					<table class="num_info_partner">
						<tr>
							<td style="border-left: 2px solid #ef3686; padding-left: 5px;">${partnerDetail.partner_number_donate}+</td>
							<td style="border-left: 2px solid #ef3686; padding-left: 5px;">${partnerDetail.partner_total_money}+</td>
						</tr>
						<tr>
							<td>dự án đã được gây quỹ thành công</td>
							<td>đồng được quyên góp</td>

						</tr>
					</table>
				</div>
				<div class="col-lg-6 col-md-12 banner-partner">
					<img src="${partnerDetail.partner_banner}">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- slider_area_end -->
<!-- popular_causes_area_start  -->
<div class="popular_causes_area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb-55">
					<h3>
						<span>Chương trình Quyên góp</span>
					</h3>
					<p>Các chương trình quyên góp của ${partnerDetail.partner_name}</p>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${listCircumOfPartner}" var="circumsOfPartner">
				<c:set var="percent"
					value="${circumsOfPartner.circum_target / circumsOfPartner.circum_raise * 100}" />
				<div class="single_cause col-lg-4 col-md-6 col-12 box-cause">
					<div class="thumb" id="thumb">
						${circumsOfPartner.circum_image}</div>
					<div class="causes_content">
						<div class="custom_progress_bar">
							<div class="progress">
							<c:if test="${percent >= 100}">
								<div class="progress-bar" role="progressbar"
									style="width: 100%;" aria-valuenow="30" aria-valuemin="0"
									aria-valuemax="100">
									<span class="progres_count"> ${percent}% </span>
								</div>
							</c:if>

							<c:if test="${percent < 100}">
								<div class="progress-bar" role="progressbar"
									style="width: ${percent}%;" aria-valuenow="30"
									aria-valuemin="0" aria-valuemax="100">
									<span class="progres_count"> <fmt:formatNumber
											type="percent" maxIntegerDigits="2" value="${percent}" />
									</span>
								</div>
							</c:if>
						</div>
						</div>
						<div
							class="balance d-flex justify-content-between align-items-center">
							<span>Raised: <fmt:formatNumber type="number"
									value="${circumsOfPartner.circum_target}" />đ
							</span> <span>Goal: <fmt:formatNumber type="number"
									value="${circumsOfPartner.circum_raise}" />đ
							</span>
						</div>
						<h4>${circumsOfPartner.circum_name}</h4>
						<div class="infomation">
							<ul>
								<li>Lượt quyên góp <br> <span><fmt:formatNumber
											type="number" value="${circumsOfPartner.circum_donations}" /></span></li>
								<li>Đạt được <br>
								<span><fmt:formatNumber type="number"
											maxFractionDigits="3" value="${percent}" />%</span></li>
								<c:if test="${percent >=100}">
									<li><a href="#" data-scroll-nav='1' class="btn-Donate">Đạt
											mục tiêu</a></li>
								</c:if>
								<c:if test="${percent < 100}">
									<li><a href="quyen-gop" data-scroll-nav='1'
										class="btn-Donate">Quyên góp</a></li>
								</c:if>
							</ul>
						</div>

						<a class="read_more"
							href="hoan-canh-chi-tiet?id=${circumsOfPartner.circum_id}">Đọc
							thêm </a>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</div>
<!-- popular_causes_area_end  -->

<!-- Information detail Partner start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-12 content_partner">
			<h1>${partnerDetail.partner_slogan}</h1>
			${partnerDetail.partner_content}

		</div>
	</div>
</div>
<!-- Information detail Partner end-->
<!-- our_volunteer_area_start  -->
<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb-55">
						<h3 class="deep-pink">
							<span>Các đối tác đồng hành khác</span>
						</h3>
						<p>Các tổ chức nhân đạo Phi Lợi Nhuận đồng hành cùng Ví MoMo
							giúp đỡ các hoàn cảnh khó khăn trên khắp cả nước.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${listPartner}" var="list">
					<div class="col-lg-4 col-md-6 our-partner">
						<div>
							<img src="${list.partner_logo}">
						</div>
						<div class="single-defination">
							<h4 class="mb-20" style="color: deeppink;">${list.partner_name}</h4>
							<p>${list.partner_slogan}</p>
							<p>
								<a href="doi-tac-chi-tiet?id=${list.partner_id}">Xem chi
									tiết >></a>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>

	</div>
</div>
