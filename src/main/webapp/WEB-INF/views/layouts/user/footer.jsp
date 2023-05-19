<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>  
<!-- footer_start  -->
<footer class="footer">
	<div class="footer_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-4 col-md-6 col-lg-4 ">
					<div class="footer_widget">
						<div class="footer_logo">
							<a href="trang-chu">
							<img src="<c:url value="/resources/user/img/footer_logo.png"/>" alt="footer_logo">
							 </a>
						</div>
						
						<p class="address_text">Địa chỉ: 572 Âu Cơ, Phường 10, Quận Tân Bình, TPHCM.</p>
						<p class="address_text">Tổng đài: 1900 5454 41 (1000 đ/phút).</p>
						<p class="address_text">Email: sonfx17102@funix.edu.vn</p>
						<p class="address_text">Hotline: 0787.668.828.</p>
						<div class="socail_links">
							<ul>
								<li><a href="#"> <i class="ti-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="ti-twitter-alt"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-dribbble"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-instagram"></i>
								</a></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-xl-4 col-md-6 col-lg-4">
					<div class="footer_widget">
						<h3 class="footer_title">Hoàn cảnh quyên góp</h3>
						<ul class="links">
							<c:forEach var="c" items="${category}">
								<li><a href="${pageContext.request.contextPath}/search?type=${c}">${c}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-xl-4 col-md-6 col-lg-4">
					<div class="footer_widget">
						<h3 class="footer_title">Blog Cuộc Sống</h3>
						<div class="contacts">
							<p>
								<a href="#">Sống Tốt</a>
							</p>
							<p>
								<a href="#">Sống Khỏe</a>
							</p>
							<p>
								<a href="#">Sống Thông Minh</a>
							</p>
							<p>
								<a href="#">Sống Vui</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copy-right_text">
		<div class="container">
			<div class="row">
				<div class="bordered_1px "></div>
				<div class="col-xl-12 d-flex justify-content-center align-items-center">
					<p class="copy_right text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="ti-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- footer_end  -->