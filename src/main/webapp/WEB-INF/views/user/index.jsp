<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<script>
<c:if test="${messageLogout!=null}">
	alert('${messageLogout}');
	location.assign("/CharityApp/trang-chu");
</c:if>
<c:if test="${messageLogin!=null}">
	alert('${messageLogin}');
	location.assign("/CharityApp/trang-chu");
</c:if>
</script>

<!-- slider_area_start -->
<div class="slider_area container">
	<div
		class="single_slider  d-flex align-items-center slider_bg_1 overlay2 row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-12"></div>
	</div>
</div>
<!-- slider_area_end -->


<!-- latest_activites_area_start  -->



<div class="popular_causes_area section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 video_bg_1 introduce-height">
				<div
					class="d-flex justify-content-center align-items-center h-100 video-intro">
					<a class="popup-video"
						href="https://www.youtube.com/watch?v=uUsGgRX0zOw"> <i
						class="flaticon-ui"></i>
					</a>
				</div>
			</div>
			<div
				class="col-lg-6 col-md-6 d-flex justify-content-center align-items-center introduce-height mt-5">
				<div class="activites_info">
					<div class="section_title">
						<h3>
							<span>Nền tảng quyên góp từ thiện </span><br> Charifit
						</h3>
						<p class="para_1">Charifit là nền tảng giúp bạn dễ dàng chung
							tay quyên góp tiền cùng hàng triệu người, giúp đỡ các hoàn cảnh
							khó khăn trên khắp cả nước.</p>
					</div>
					<div class="small_info mt-4">
						<div class="small_info_details">
							<h4 class="deepPink">404</h4>
							<p>
								<small>dự án đã được gây quỹ thành công</small>
							</p>
						</div>
						<div class="small_info_details">
							<h4 class="deepPink">55+ tỷ</h4>
							<p>
								<small>đồng được quyên góp</small>
							</p>
						</div>
						<div class="small_info_details">
							<h4 class="deepPink">14+ triệu</h4>
							<p>
								<small>lượt quyên góp</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<hr>
<!-- latest_activites_area_end  -->
<div class="popular_causes_area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-6 col-md-6 ">
				<div class="section_title text-center mb-55">
					<h3>
						<span>Các hoàn cảnh Quyên góp</span>
					</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list6Circum}" var="o">
				<c:set var="percent"
					value="${o.circum_target / o.circum_raise * 100}" />
				<div
					class="col-xl-4 col-lg-4 col-md-6 col-12 single_cause box-cause">
					<div class="thumb" id="thumb">
						<a href="quyen-gop?id=${o.circum_id}">${o.circum_image}</a>
					</div>
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
							<span>Đạt: <fmt:formatNumber type="number"
									value="${o.circum_target}" />đ
							</span> <span>Mục tiêu: <fmt:formatNumber type="number"
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
		<div class="row">
			<div class="col-12 mt-4">
				<div class="donate_now_btn text-center">

					<a href="nhung-hoan-canh" class="boxed-btn4">Xem thêm >></a>
				</div>
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
							<h3 class="counter">423</h3>
							<p>Giúp đỡ hoàn cảnh khó khăn</p>
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
							<h3 class="counter">145</h3>
							<p>Giúp đỡ bệnh hiễm nghèo</p>
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
							<h3 class="counter">384</h3>
							<p>Cơ sở vật chất mới</p>
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
							<h3 class="counter">1250</h3>
							<p>Học sinh được đến trường</p>
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
					<div class="col-lg-4 col-md-6 our-partner">
						<div class="mr-2">
							<a href="doi-tac-chi-tiet?id=${p.partner_id}"> <img
								src="<c:url value="${p.partner_logo}"/>"></a>
						</div>
						<div class="single-defination">
							<h4 class="mb-20 deepPink">
								<a href="doi-tac-chi-tiet?id=${p.partner_id}">${p.partner_name}</a>
							</h4>
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
<hr>

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
			<c:forEach items="${list2News}" var="n">
				<div class="col-lg-6">
					<div class="news_active">
						<div class="single__blog d-flex align-items-center">
							<div class="thum">
								<img src="<c:url value="${n.news_img_banner}"/>" alt="">
							</div>
							<div class="newsinfo">
								<span>${n.news_post_date}</span>
								<h3>
									<a href="tin-tuc-chi-tiet?id=${n.news_id}">${n.news_description}</a>
								</h3>
								<a class="read_more" href="tin-tuc-chi-tiet?id=${n.news_id}">>>Xem
									chi tiết</a>
							</div>
						</div>
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
<!-- news__area_end  -->
<hr>
<!-- questions_start -->
<section class="container">
	<div class="row">
		<div class="col-xl-4 head_question">
			<h2 class="deepPink">Câu hỏi thường gặp</h2>
		</div>
		<div class="col-xl-8 questions_container pb-4">
			<div class="question_items">
				<div class="question">
					<a class="" data-toggle="collapse" href="#collapseExample1"
						role="button" aria-expanded="false"
						aria-controls="#collapseExample1"> Charifit là gì? </a> <a
						class="" data-toggle="collapse" href="#collapseExample1"
						role="button" aria-expanded="false"
						aria-controls="#collapseExample1"> <i class="ti-angle-down"></i>
					</a>

				</div>
				<div class="collapse answer" id="collapseExample1">
					<div class="card card-body">Charifit là tính năng gây quỹ từ
						thiện của MoMo. Các dự án được đăng tải trong Charifit đều là
						những dự án đã được lựa chọn cẩn trọng, và được bảo trợ bởi các tổ
						chức uy tín.</div>
				</div>
			</div>
			<div class="question_items">
				<div class="question">
					<a class="" data-toggle="collapse" href="#collapseExample2"
						role="button" aria-expanded="false"
						aria-controls="#collapseExample2"> Charifit có thu lợi nhuận
						từ việc gây quỹ không? </a> <a class="" data-toggle="collapse"
						href="#collapseExample2" role="button" aria-expanded="false"
						aria-controls="#collapseExample2"> <i class="ti-angle-down"></i>
					</a>

				</div>
				<div class="collapse answer" id="collapseExample2">
					<div class="card card-body">Charifit hoàn toàn không thu lợi
						nhuận từ việc gây quỹ. Ngoại trừ phí chuyển khoản ngân hàng, 100%
						số tiền của người dùng được chuyển tới cho các tổ chức bảo trợ.</div>
				</div>
			</div>
			<div class="question_items">
				<div class="question">
					<a class="" data-toggle="collapse" href="#collapseExample3"
						role="button" aria-expanded="false"
						aria-controls="collapseExample3"> Sau bao lâu từ khi quyên
						góp, tiền sẽ được chuyển đến tay hoàn cảnh? </a> <a class=""
						data-toggle="collapse" href="#collapseExample3" role="button"
						aria-expanded="false" aria-controls="collapseExample3"> <i
						class="ti-angle-down"></i>
					</a>

				</div>
				<div class="collapse answer" id="collapseExample3">
					<div class="card card-body">Trong vòng 1 tuấn kể từ khi dự án
						quyên góp thành công, tiền sẽ được chuyển tới đối tác. Trong những
						trường hợp khẩn cấp, chúng tôi có thể chuyển sớm hơn.</div>
				</div>
			</div>
			<div class="question_items">
				<div class="question">
					<a class="" data-toggle="collapse" href="#collapseExample4"
						role="button" aria-expanded="false"
						aria-controls="collapseExample4"> Ai có thể gây quỹ trên
						Charifit? </a> <a class="" data-toggle="collapse"
						href="#collapseExample4" role="button" aria-expanded="false"
						aria-controls="collapseExample4"> <i class="ti-angle-down"></i>
					</a>

				</div>
				<div class="collapse answer" id="collapseExample4">
					<div class="card card-body">Để có thể gây quỹ trên Charifit,
						hoàn cảnh cần được bảo trợ bởi một tổ chức có pháp nhân là Quỹ, tổ
						chức phi chính phủ, Doanh nghiệp xã hội hoặc một cơ quan nhà nước
						có chức năng tiếp nhận tài trợ.</div>
				</div>
			</div>
			<div class="question_items">
				<div class="question">
					<a class="" data-toggle="collapse" href="#collapseExample5"
						role="button" aria-expanded="false"
						aria-controls="collapseExample5"> Nếu hoàn cảnh gây quỹ không
						thành công thì sao? </a> <a class="" data-toggle="collapse"
						href="#collapseExample5" role="button" aria-expanded="false"
						aria-controls="collapseExample5"> <i class="ti-angle-down"></i>
					</a>
				</div>
				<div class="collapse answer" id="collapseExample5">
					<div class="card card-body">Nhà tài trợ vẫn sẽ chuyển số tiền
						tương ứng với số Heo Vàng đã quyên góp. Trong một số trường hợp,
						chúng tôi sẽ kéo dài thêm thời gian gây quỹ</div>
				</div>
			</div>
			<div class="question_items">
				<div class="question">
					<a class="" data-toggle="collapse" href="#collapseExample6"
						role="button" aria-expanded="false"
						aria-controls="collapseExample6"> Làm thế nào để liên hệ và
						gửi hoàn cảnh tới Charifit? </a> <a class="" data-toggle="collapse"
						href="#collapseExample6" role="button" aria-expanded="false"
						aria-controls="collapseExample6"> <i class="ti-angle-down"></i>
					</a>
				</div>
				<div class="collapse answer" id="collapseExample6">
					<div class="card card-body">Tổ chức đủ điều kiện vui lòng gửi
						email thông tin của tổ chức tới địa chỉ donation@mservice.com.vn
						để được nhận hướng dẫn.</div>
				</div>
			</div>
		</div>
	</div>

</section>
<!-- questions_end -->