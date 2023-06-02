<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
 <!-- partner_start  -->
    <div class="section-top-border mt-4">
        <div class="row">
            <div class="col-lg-8 col-md-7 col-12 companion_partners ">
                <h2 class="text text-center deepPink" >Các đối tác đồng hành</h2>
                <div class="row ml-4 " id="itemsPartner">
                <c:forEach items="${listPartner}" var="o">
                    <div class="row col-lg-6 col-md-12  flex-md-row mr-2 mb-2 align-items-center" >
                        <div class="col-md-4 col-4 ">
                        	<c:if test="${o.partner_id > 12}">
                            <a ><img src="${o.partner_logo}" 
                            style="width: 100%;"></a>
                        	</c:if>
                        	<c:if test="${o.partner_id <= 12}">
                            <a href="doi-tac-chi-tiet?id=${o.partner_id}"><img src="${o.partner_logo}" 
                            style="width: 100%;"></a>
                            </c:if>
                        </div>
                        <div class="single-defination col-md-8 col-8">
                            <c:if test="${o.partner_id > 12}">
	                            <h4 class="mb-20 deepPink" >
	                            <a >${o.partner_name}</a></h4>
	                            <p>${o.partner_slogan}</p>
	                            <p><a >Xem chi tiết >></a></p>
                            </c:if>
                            <c:if test="${o.partner_id <= 12}">
                            <h4 class="mb-20 deepPink" >
                            <a href="doi-tac-chi-tiet?id=${o.partner_id}">${o.partner_name}</a></h4>
                            <p>${o.partner_slogan}</p>
                            <p><a href="doi-tac-chi-tiet?id=${o.partner_id}">Xem chi tiết >></a></p>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="donate_now_btn text-center">
                            
                            <button type="button" class="boxed-btn4" 
						id="showMoreButton" onclick="showMore()">Xem thêm >></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-5 col-12 mt-sm-30 sidebar_right">
                
                <div class="single-element-widget ">
                    <h2 class="mb-30 deepPink">Hoàn cảnh quyên góp mới nhất</h2>
                    <c:forEach items="${listTop3Circum}" var="circum">
                    <c:set var="percentTop3"
						value="${circum.circum_target / circum.circum_raise * 100}" />
                    <div class="causes_content">
                        <div class="img-cause" id="thumb">
                            <a href="hoan-canh-chi-tiet?id=${circum.circum_id}">
	                            ${circum.circum_image}
                            </a>
                            <p>${circum.circum_des}</p>
                        </div>
                        <div class="balance d-flex justify-content-center align-items-center mt-3">
                            <span><fmt:formatNumber type="number"
										value="${circum.circum_target}" />đ/ <fmt:formatNumber type="number"
										value="${circum.circum_raise}" />đ </span>
                        </div>
                        <div class="custom_progress_bar">
                            <div class="progress">
									<c:if test="${percentTop3 >= 100}">
										<div class="progress-bar" role="progressbar"
											style="width: 100%;" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100">
											<span class="progres_count text-center"> <fmt:formatNumber
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
                        
                        <div class="infomation text-center">
                            <ul>
                                <li>Lượt quyên góp <br> <span><fmt:formatNumber
												type="number" value="${circum.circum_donations}" /></span></li>
									<li>Đạt được <br>
									<span><fmt:formatNumber
										type="number" maxFractionDigits="1" value="${percentTop3}" />%</span></li>
									<c:if test="${percentTop3 >=100}">
										<li><a href="#" data-scroll-nav='1' class="btn-Donate">Kết thúc</a></li>
									</c:if>
									<c:if test="${percentTop3 < 100}">
										<li><a href="hoan-canh-chi-tiet?id=${circum.circum_id}" 
											class="read-more">Xem chi tiết >></a></li>
									</c:if>
                                
                            </ul>
                        </div>
                        <div class="">
                            <a href="quyen-gop?id=${circum.circum_id}" class="btn-Donate-sidebar">Quyên góp</a>
                        </div>
                        <div class="horizontal_line"> </div>
                        
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <!-- partner_end  -->
<script>
	var items = document.getElementById("itemsPartner");
	items.classList.add("hide-partner") // Hiển thị toàn bộ nội dung
	items.classList.remove("show-partner") // Giấu một phần nội dung
	function showMore() {
		items.classList.remove("hide-partner") // Hiển thị toàn bộ nội dung
		items.classList.add("show-partner") // Hiển thị toàn bộ nội dung
		document.getElementById('showMoreButton').style.display = 'none';  // Ẩn nút "Hiển thị thêm"
	}
</script>