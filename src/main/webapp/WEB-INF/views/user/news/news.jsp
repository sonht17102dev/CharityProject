<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<c:set value="${latest_news.get(0)}" var="latest_news" />

<!-- news_model_start  -->
<div id="id-news-${latest_news.news_id}" class="modalLogin">
	<div class="container-news">
		<div class="row">
			<span
				onclick="document.getElementById('id-news-${latest_news.news_id}').style.display='none'"
				class="close " title="Close Modal">&times;</span>
			<div class="col-lg-12 col-md-8">
				<h2>Cập nhật các tin tức quyên góp mới nhất</h2>
				<div class="banner_news">
					<img src="${latest_news.news_img_banner}">
					<h3>${latest_news.news_description}</h3>
				</div>
				${latest_news.news_content}

			</div>
			<div class="row">
				<div class="col-12">
					<div class="donate_now_btn text-center">
						<a href="#" class="boxed-btn4">Xem thêm</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- news_model_end  -->
<c:forEach items="${listAllNews}" var="news_sub">
	<!-- news_model_start  -->
	<div id="id-news-${news_sub.news_id}" class="modalLogin">
		<div class="container">
			<div class="row">
				<span
					onclick="document.getElementById('id-news-${news_sub.news_id}').style.display='none'"
					class="close " title="Close Modal">&times;</span>
				<div class="col-lg-12 col-md-8">
					<h2>Cập nhật các tin tức quyên góp mới nhất</h2>
					<div class="banner_news">
						<img src="${news_sub.news_img_banner}">
						<h3>${news_sub.news_description}</h3>
					</div>
					${news_sub.news_content}

				</div>
				<div class="row">
					<div class="col-12">
						<div class="donate_now_btn text-center">
							<a href="#" class="boxed-btn4">Xem thêm</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</c:forEach>
<!-- news_model_end  -->
<!-- news_start  -->

<div class="section-top-border">
	<div class="row">
		<div class="col-lg-9 col-md-8 companion_partners">
			<h2 class="deep-pink">Cập nhật các tin tức quyên góp mới nhất</h2>
			<div class="banner_news">
				<div>
					<a type="button"
						onclick="document.getElementById('id-news-${latest_news.news_id}').style.display='block'"
						style="width: 100%;"><img src="${latest_news.news_img_banner}"></a>
				</div>
				<div>
					<span>${latest_news.news_post_date}</span>
				</div>
				<div>
					<h4>
						<a type="button"
							onclick="document.getElementById('id-news-${latest_news.news_id}').style.display='block'"
							style="width: 100%;">${latest_news.news_description}</a>
					</h4>
				</div>
			</div>
			<div id="content" class="row">
			<c:forEach items="${listAllNews}" var="o">

				<div class="news_st news_wrapper">
					<div>
						<a type="button"
							onclick="document.getElementById('id-news-${o.news_id}').style.display='block'"
							style="width: 100%;"><img src="${o.news_img_banner}"></a>
					</div>
					<div>
						<span>${o.news_post_date}</span>
					</div>
					<div>
						<h4>
							<a type="button"
								onclick="document.getElementById('id-news-${o.news_id}').style.display='block'"
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

		<div class="col-lg-3 col-md-4 mt-sm-30 sidebar_right">

			<div class="single-element-widget border-left">
				<h2 class="mb-30">Hoàn cảnh quyên góp mới nhất</h2>
				<c:forEach items="${listTop3Circum}" var="o">
					<c:set var="percent"
						value="${o.circum_target / o.circum_raise * 100}" />
					<div class="causes_content">
						<div class="img-cause">
							${o.circum_image}
							<p>${o.circum_name}</p>
						</div>
						<div
							class="balance d-flex justify-content-between align-items-center">
							<span><fmt:formatNumber type="number"
									value="${o.circum_target}" />đ quyên góp / <fmt:formatNumber
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
							<a href="#" class="btn-Donate-sidebar">Quyên góp</a>
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