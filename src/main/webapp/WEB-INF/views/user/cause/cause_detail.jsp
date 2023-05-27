<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!-- bradcam_area_start  -->
<c:set var="percent"
	value="${circumDetail.circum_target / circumDetail.circum_raise * 100}" />

<div class="section-top-border">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-12 causes">
			<h2 class="deepPink">
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
		<div class="col-lg-12 col-md-12">
			<div class="news_active owl-carousel" id="banner-images">
				<c:url value="${circumDetail.circum_image}"/>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end -->
<!-- popular_causes_area_start  -->
<div class="section-top-border">
	<div class="row" >
		<div class="col-lg-9 col-md-12 causes">
			<article class="content-main " id="article">
				${circumDetail.circum_content}</article>
			<div class="row">
				<div class="col-lg-12">
					<div class="donate_now_btn text-center mt-4">
						<button type="button" class="boxed-btn4" id="showMoreButton"
							onclick="showMore()">Xem thêm >></button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-12 col-12 mt-sm-30 sidebar_right" id="infoArticle">
			<div class="single-element-widget" >

				<div class="causes_content ">
					<h2 class="mb-30">Thông tin quyên góp</h2>
					<div
						class="balance d-flex justify-content-between align-items-center">
						<span><fmt:formatNumber type="number"
								value="${circumDetail.circum_target}" /> đ / <fmt:formatNumber
								type="number" value="${circumDetail.circum_raise}" />đ </span>

					</div>
					<div class="custom_progress_bar">
						<div class="progress">
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
										type="number" maxFractionDigits="1" value="${percent}" /> %
								</span>
							</div>
						</c:if>
					</div>
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
						<c:if test="${percent >=100}">
							<a href="#" class="btn-Donate-sidebar">Kết thúc</a>
						</c:if>
						<c:if test="${percent < 100}">
							<a href="quyen-gop?id=${circumDetail.circum_id}"
								class="btn-Donate-sidebar">Quyên góp</a>
						</c:if>
						<p class="mt-4">Đồng hành cùng dự án</p>

						<div class="partner">

							<div class="partner_img">
								<a href="doi-tac-chi-tiet?id=${circumDetail.partner_id}"> <img
									src="<c:url value="${circumDetail.partner_logo}"/>"></a>
							</div>
							<div class="partner_content">
								<p class="mb-20">
									<a href="doi-tac-chi-tiet?id=${circumDetail.partner_id}"
										class="deepPink"> ${circumDetail.partner_name}</a>
								</p>
								<p>
									<a href="doi-tac-chi-tiet?id=${circumDetail.partner_id}">Tìm
										hiểu thêm >></a>
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
			<c:forEach items="${listTop3Circum}" var="o">
				<c:set var="percentTop3"
					value="${o.circum_target / o.circum_raise * 100}" />
				<div class="col-lg-4 col-md-6 col-12 single_cause box-cause">
					<div class="thumb" id="thumb">
						<a href="quyen-gop?id=${o.circum_id}">${o.circum_image}</a>
					</div>
					<div class="causes_content">
						<div class="custom_progress_bar">
							<div class="progress">
								<c:if test="${percentTop3 >= 100}">
									<div class="progress-bar" role="progressbar"
										style="width: 100%;" aria-valuenow="30" aria-valuemin="0"
										aria-valuemax="100">
										<span class="progres_count"> <fmt:formatNumber
												type="number" maxFractionDigits="1" value="${percentTop3}" />
										</span>
									</div>
								</c:if>

								<c:if test="${percentTop3 < 100}">
									<div class="progress-bar" role="progressbar"
										style="width: <fmt:formatNumber
													type="number" maxFractionDigits="1" value="${percentTop3}" />%;"
										aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
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
						<div class="circum_name">
							<h4>${o.circum_name}</h4>
						</div>
						<div class="infomation">
							<ul>
								<li>Lượt quyên góp <br> <span><fmt:formatNumber
											type="number" value="${o.circum_donations}" /></span></li>
								<li>Đạt được <br> <span><fmt:formatNumber
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
	</div>
</div>
<!-- popular_causes_area_end  -->
<script>
	/*	Loại bỏ style mặc định khi dùng ckeditor upload hình ảnh*/
	var imgBanners = document.querySelectorAll("#banner-images img");
	
	imgBanners.forEach( item => {
		if(item.hasAttribute("style")){
			item.removeAttribute("style");
		}
	})
	var article = document.getElementById('article');
	var infoArticle = document.getElementById("infoArticle");
	article.classList.add("hide-acticle"); 
	article.classList.remove("show-acticle"); 
	
  	var screenWidth = window.innerWidth || document.documentElement.clientWidth;

  	if (screenWidth < 991) {
	 	infoArticle.style.display = 'none';
  	} else {
	  	infoArticle.style.display = 'block';
  	}
	function showMore() {
		article.classList.remove("hide-acticle") 
		article.classList.add("show-acticle") 
		infoArticle.classList.remove("hideInfoActicle");
		infoArticle.classList.add("showInfoActicle");
		document.getElementById('showMoreButton').style.display = 'none';  // Ẩn nút "Xem thêm"
	}
</script>