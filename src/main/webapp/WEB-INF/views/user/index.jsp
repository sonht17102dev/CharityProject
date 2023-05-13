<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>


<!-- slider_area_start -->
<div class="slider_area">
	<div
		class="single_slider  d-flex align-items-center slider_bg_1 overlay2">
		<div class="container">
			<div class="row">
				<div class="col-lg-9"></div>
			</div>
		</div>
	</div>
</div>
<!-- slider_area_end -->


<!-- latest_activites_area_start  -->

<div class="latest_activites_area ">
	<div
		class=" video_bg_1 video_activite  d-flex align-items-center justify-content-center">
		<a class="popup-video"
			href="https://www.youtube.com/watch?v=uUsGgRX0zOw"> <i
			class="flaticon-ui"></i>
		</a>
	</div>
	<div class="container">

		<div class="row justify-content-end">
			<div class="col-lg-7">
				<div class="activites_info">
					<div class="section_title">
						<h3>
							<span>Nền tảng quyên góp từ thiện </span><br> Trái tim MoMo
						</h3>
					</div>
					<p class="para_1">Trái Tim MoMo là nền tảng giúp bạn dễ dàng
						chung tay quyên góp tiền cùng hàng triệu người, giúp đỡ các hoàn
						cảnh khó khăn trên khắp cả nước.</p class="para_1">
					<div class="small_info">
						<div class="small_info_details">
							<h4>404</h4>
							<p>dự án đã được gây quỹ thành công</p>
						</div>
						<div class="small_info_details">
							<h4>55+ tỷ</h4>
							<p>đồng được quyên góp</p>
						</div>
						<div class="small_info_details">
							<h4>14+ triệu</h4>
							<p>lượt quyên góp</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- latest_activites_area_end  -->

<!-- popular_causes_area_start  -->
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
				<c:forEach items="${list6Circum}" var="o">
					<c:set var="percent"
						value="${o.circum_target / o.circum_raise * 100}" />
					<div class="single_cause box-cause">
						<div class="thumb">${o.circum_image}</div>
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
									<li>Đạt được <br> <span><fmt:formatNumber
												type="number" maxFractionDigits="3" value="${percent}" />%</span></li>
									<c:if test="${percent >=100}">
										<li><a href="#" class="btn-Donate">Đạt mục tiêu</a></li>
									</c:if>
									<c:if test="${percent < 100}">
										<li><a href="quyen-gop?id=${o.circum_id}"
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

<!-- counter_area_start  -->
<div class="counter_area">
	<div class="container">
		<div class="counter_bg overlay">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div
						class="single_counter d-flex align-items-center justify-content-center">
						<div class="icon">
							<i class="flaticon-calendar"></i>
						</div>
						<div class="events">
							<h3 class="counter">120</h3>
							<p>Finished Event</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div
						class="single_counter d-flex align-items-center justify-content-center">
						<div class="icon">
							<i class="flaticon-heart-beat"></i>
						</div>
						<div class="events">
							<h3 class="counter">120</h3>
							<p>Finished Event</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div
						class="single_counter d-flex align-items-center justify-content-center">
						<div class="icon">
							<i class="flaticon-in-love"></i>
						</div>
						<div class="events">
							<h3 class="counter">120</h3>
							<p>Finished Event</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div
						class="single_counter d-flex align-items-center justify-content-center">
						<div class="icon">
							<i class="flaticon-hug"></i>
						</div>
						<div class="events">
							<h3 class="counter">120</h3>
							<p>Finished Event</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- counter_area_end  -->

<!-- our_volunteer_area_start  -->
<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb-55">
						<h3>
							<span>Các đối tác đồng hành</span>
						</h3>
						<p>Các tổ chức nhân đạo Phi Lợi Nhuận đồng hành cùng Ví MoMo
							giúp đỡ các hoàn cảnh khó khăn trên khắp cả nước.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${list6Partner}" var="p">
					<div class="col-md-4 our-partner">
						<div>
							<img src="<c:url value="${p.partner_logo}"/>">
						</div>
						<div class="single-defination">
							<h4 class="mb-20" style="color: deeppink;">${p.partner_name}</h4>
							<p>${p.partner_slogan}</p>
							<p>
								<a href="doi-tac-chi-tiet?id=${p.partner_id}">Xem chi tiết
									>></a>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-12 mt-4">
					<div class="donate_now_btn text-center">

						<a href="doi-tac" class="boxed-btn4">Xem thêm >></a>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>


<!-- news__area_start  -->
<div class="news__area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb-55">
					<h3>
						<span>Tin tức cộng đồng</span>
					</h3>
					<p>Cập nhật thông tin các hoạt động quyên góp mới nhất</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="news_active owl-carousel">
					<c:forEach items="${list2News}" var="n">
						<div class="single__blog d-flex align-items-center">
							<div class="thum">
								<img src="<c:url value="${n.news_img_banner}"/>" alt="">
							</div>
							<div class="newsinfo">
								<span>${n.news_post_date}</span> <a
									href="tin-tuc-chi-tiet?id=${n.news_id}">
									<h3>${n.news_description }</h3>
								</a> <a class="read_more" href="tin-tuc-chi-tiet?id=${n.news_id}">>>Xem
									chi tiết</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="row">
					<div class="col-12 mt-4">
						<div class="donate_now_btn text-center">

							<a href="tin-tuc" class="boxed-btn4">Xem thêm >></a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- news__area_end  -->
