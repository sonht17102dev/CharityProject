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
								<li><a href="#"> <i class="fa fa-phone"></i>
										078.766.8828
								</a></li>
								<li><a href="#"> <i class="fa fa-envelope"></i>sonfx17102@funix.edu.vn
								</a></li>
								<li><security:authorize access="isAuthenticated()">
										<security:authorize access="hasRole('USER')">
											<span>Xin chào, <security:authentication
													property="principal.username" /></span>
										</security:authorize>
									</security:authorize></li>
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
							<a href="trang-chu"> <img
								src="<c:url value="/resources/user/img/logo.png"/>" alt="logo">
							</a>

						</div>
					</div>
					<div class="col-xl-9 col-lg-9">
						<div class="main-menu">
								<ul id="navigation">
									<li><a href="${pageContext.request.contextPath}/trang-chu">Trang
											chủ</a></li>
									<li><a
										href="${pageContext.request.contextPath}/nhung-hoan-canh">Hoàn
											cảnh quyên góp <i class="ti-angle-down"></i>
									</a>
										<ul class="submenu">
											<c:forEach var="c" items="${category}">
												<li>
													<a href="${pageContext.request.contextPath}/search?type=${c}">${c}</a>
												</li>
											</c:forEach>

										</ul>
									</li>
									<li><a href="${pageContext.request.contextPath}/doi-tac">Đối
											tác</a></li>
									<li><a href="${pageContext.request.contextPath}/tin-tuc">Tin
											tức cộng đồng</a></li>
									<li>
									<security:authorize access="isAuthenticated()">
										<security:authorize access="hasRole('USER')">
											<li><a
												href="${pageContext.request.contextPath}/tai-khoan/cap-nhat?username=<security:authentication property="principal.username" />">
													Thông Tin Tài khoản</a></li>
										</security:authorize>
									</security:authorize>

									<security:authorize access="!isAuthenticated()">
										<li><a href="${pageContext.request.contextPath}/login">
												Đăng nhập</a></li>
									</security:authorize>
									<security:authorize access="!isAuthenticated()">
										<li><a href="${pageContext.request.contextPath}/register">
												Đăng ký</a></li>
									</security:authorize>
									<security:authorize access="isAuthenticated()">
										<li><a href="${pageContext.request.contextPath}/logout">
												Đăng xuất</a></li>
									</security:authorize>
									<security:authorize access="hasRole('ADMIN')">
										<li>
											<!-- Add a link to point to /systems ... this is for the admins -->
											<p>
												<a href="${pageContext.request.contextPath}/admin/">Về
													trang ADMIN</a>
											</p>
										</li>
									</security:authorize>

									</li>
								</ul>
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