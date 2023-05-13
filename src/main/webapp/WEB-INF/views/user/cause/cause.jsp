<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!-- bradcam_area_start  -->
    <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Hoàn cảnh quyên góp</h3>
                        <p>Các chương trình hoạt động từ thiện giúp đỡ cộng đồng - Cập nhật mới nhất</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- bradcam_area_end  -->
<!-- popular_causes_area_start  -->
<div class="popular_causes_area pt-120">
	<div class="container">
		<div class="row">
			<c:forEach items="${listTop6Circum}" var="o">
				<c:set var="percent"
					value="${o.circum_target / o.circum_raise * 100}" />
				<div class="single_cause box-cause">
					<div class="thumb">
						${o.circum_image}
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
								<span><fmt:formatNumber type="number"
											maxFractionDigits="3" value="${percent}" />%</span></li>
								<c:if test="${percent >=100}">
									<li><a href="#" class="btn-Donate">Đạt
											mục tiêu</a></li>
								</c:if>
								<c:if test="${percent < 100}">
									<li><a href="quyen-gop?id=${o.circum_id}" class="btn-Donate">Quyên góp</a></li>
								</c:if>
							</ul>
						</div>

						<a class="read_more" href="hoan-canh-chi-tiet?id=${o.circum_id}">Đọc thêm </a>
					</div>
				</div>
			</c:forEach>
			<div class="pagination col-lg-6">
				<a class="${(tag==null||tag==1) ? "
					hidden" : "" }" href="nhung-hoan-canh?trang=${tag - 1}">&laquo;</a>
				<c:forEach begin="1" end="${endPage}" var="i">
					<a class='${tag == i ? "active" : ""}' href="nhung-hoan-canh?trang=${i}">${i}</a>
				</c:forEach>
				<a class='${tag==endPage ? "hidden" : "" }' href="nhung-hoan-canh?trang=${tag + 1}">&raquo;</a>
				<%-- 
				 <ul class="pagination" id="pagination"></ul>
				--%>
			
			</div>
		</div>
	</div>
</div>
<!-- popular_causes_area_end  -->
<script>
</script>