<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<c:set value="${latest_news.get(0)}" var="latest_news" />

<div class="section-top-border mt-4">
	<div class="row">
		<div class="col-lg-8 col-md-8 ">
			<h2 class="deepPink">Cập nhật các tin tức quyên góp mới nhất</h2>
			<div class="banner_news">
				<div class="banner_items">
					<a href="tin-tuc-chi-tiet?id=${latest_news.news_id}"
						style="width: 100%;"><img src="${latest_news.news_img_banner}"></a>
				</div>
				<div class="banner_items">
					<span>${latest_news.news_post_date}</span>
				</div>
				<div class="banner_items">
					<h3>
						<a href="tin-tuc-chi-tiet?id=${latest_news.news_id}"
							style="width: 100%;">${latest_news.news_description}</a>
					</h3>
				</div>
			</div>
			<div id="content" class="row">
			<c:forEach items="${listAllNews}" var="o">

				<div class="news_st news_wrapper">
					<div class="news_items_banner">
						<a href="tin-tuc-chi-tiet?id=${o.news_id}"
							style="width: 100%;"><img src="${o.news_img_banner}"></a>
					</div>
					<div class="news_items_date">
						<span>${o.news_post_date}</span>
					</div>
					<div class="news_items_des">
						<h4>
							<a href="tin-tuc-chi-tiet?id=${o.news_id}"
								style="width: 100%;">${o.news_description}</a>
						</h4>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="donate_now_btn text-center">
						<button onclick="loadMore()" class="btn btn-primary" id="loadmoreBtn">Load more</button>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-4 col-md-4 mt-sm-30 sidebar_right">

			<div class="single-element-widget border-left">
				<h2 class="mb-30 deepPink">Hoàn cảnh quyên góp mới nhất</h2>
				<c:forEach items="${listTop3Circum}" var="o">
					<c:set var="percent"
						value="${o.circum_target / o.circum_raise * 100}" />
					<div class="causes_content">
						<div class="img-cause" id="thumb">
							${o.circum_image}
							<p>${o.circum_name}</p>
						</div>
						<div
							class="balance d-flex justify-content-between align-items-center">
							<span><fmt:formatNumber type="number"
									value="${o.circum_target}" />đ / <fmt:formatNumber
									type="number" value="${o.circum_raise}" />đ </span>
						</div>
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

						<div class="infomation text-center">
							<ul>
								<li>Lượt quyên góp <br> <span><fmt:formatNumber
											type="number" value="${o.circum_donations}" /></span></li>
								<li>Đạt được <br> <span><fmt:formatNumber
											type="number" maxFractionDigits="3" value="${percent}" />%</span></li>
								<li>Thời gian còn <br>37 Ngày<span></span>
								</li>

							</ul>
						</div>
						<div class="">
							<a href="quyen-gop?id=${o.circum_id}" class="btn-Donate-sidebar">Quyên góp</a>
						</div>
						<div class="horizontal_line"></div>

					</div>
				</c:forEach>
			</div>

		</div>
	</div>
</div>
<script>
	function loadMore() {
		var itemLength = document.getElementsByClassName('news_st').length;
		var row = document.getElementById("content");
		var loadBtn = document.getElementById("loadmoreBtn");
		console.log(itemLength);
		$.ajax({
			url : "/CharityApp/loadmore",
			type : "get", //send it through get method
			data : {
				existItems : itemLength
			},
			success : function(data) {
				
				row.innerHTML += data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
		if(itemLength >= ${size}){
			loadBtn.classList.add("hidden");
		}
	}
</script>
<!-- news_end  -->