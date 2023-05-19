<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-lg-12 content_partner">
			<div id="id-news-${news.news_id}">
				<div class="container-news">
					<div class="row">
						<div class="col-lg-12 col-md-8">
							<h2>Cập nhật các tin tức quyên góp mới nhất</h2>
							<div class="banner_news">
								<img src="${news.news_img_banner}">
								<h3 class="text-center">${news.news_description}</h3>
							</div>
							<article class="news-content mt-4" id="">
								${news.news_content}
							</article>

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
				<c:forEach items="${listCircum}" var="o">
					<c:set var="percentTop3"
						value="${o.circum_target / o.circum_raise * 100}" />
					<div class="single_cause col-xl-4 box-height">
						<div class="thumb" id="thumb">
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
		<div class="row justify-content-center mt-4">
			<div class="col-12">
				<div class="donate_now_btn text-center">
					<a href="nhung-hoan-canh" class="boxed-btn4">Xem thêm</a>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- popular_causes_area_end  -->
