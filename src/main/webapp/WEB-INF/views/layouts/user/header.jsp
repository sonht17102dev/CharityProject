<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!-- header-start -->
<header>
	<div class="header-area ">
		<div class="header-top_area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-6 col-md-12 col-lg-8">
						<div class="short_contact_list">
							<ul>
								<li><a href="#"> <i class="fa fa-phone"></i> +1 (454)
										556-5656
								</a></li>
								<li><a href="#"> <i class="fa fa-envelope"></i>Yourmail@gmail.com
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-6 col-md-6 col-lg-4">
						<div class="social_media_links d-none d-lg-block">
							<a href="#"> <i class="fa fa-facebook"></i>
							</a> <a href="#"> <i class="fa fa-pinterest-p"></i>
							</a> <a href="#"> <i class="fa fa-linkedin"></i>
							</a> <a href="#"> <i class="fa fa-twitter"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="col-xl-3 col-lg-3">
						<div class="logo">
							<a href="index.html"> <img
								src="<c:url value="/resources/img/momo_logo.webp"/>" alt="">
							</a>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9">
						<div class="main-menu">
							<nav>
								<ul id="navigation">
									<li><a href="trang-chu">Trang chủ</a></li>
									<li><a href="ve-chung-toi">Về chúng tôi</a></li>
									<li><a href="nhung-hoan-canh">Hoàn cảnh quyên góp <i
											class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="#">Vì Trẻ Em</a></li>
											<li><a href="#">Người Già, Người Khuyết Tật</a></li>
											<li><a href="#">Bệnh Hiểm Nghèo</a></li>
											<li><a href="#">Hoàn Cảnh Khó Khăn</a></li>
											<li><a href="#">Hỗ Trợ Giáo Dục</a></li>
											<li><a href="#">Đầu Tư Cơ Sở Vật Chất</a></li>
											<li><a href="#">Cứu Trợ Động Vật</a></li>
											<li><a href="#">Bảo Vệ Môi Trường</a></li>
										</ul></li>
									<li><a href="doi-tac">Đối tác</a></li>
									<li><a href="tin-tuc">Tin tức cộng đồng</a></li>
									<li><a href="login/">Đăng nhập <i class="ti-angle-down"></i></a>
										
									<li><a href="">Đăng xuất</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- header-end -->