<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<security:authentication property="name" var="username" />

<div id="navbar" class="navbar navbar-default">

	<div class="navbar-container" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="home" class="navbar-brand"> <small> <i
					class="fa fa-leaf"></i> Trang Quản Trị
			</small>
			</a>
		</div>

		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav white">
				<li><a href="${pageContext.request.contextPath}/trang-chu">Về
						trang User</a></li>

				<li><a href="${pageContext.request.contextPath}/logout">Đăng
						xuất</a></li>
			</ul>
		</div>
	</div>
	<!-- /.navbar-container -->
</div>


<script type="text/javascript">
	try {
		ace.settings.check('main-container', 'fixed')
	} catch (e) {
	}
</script>

<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<span class="welcome active"> <security:authorize
					access="hasRole('ADMIN')">
						 Welcome, ${username}
						 </security:authorize>
			</span>
		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>
	<!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">
		<li class="active"><a href="home"> <i
				class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
					Dashboard </span>
		</a> <b class="arrow"></b></li>

		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-list"></i> <span class="menu-text">
					Quản Lý </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="quan-ly-quyen-gop"> <i
						class="menu-icon fa fa-caret-right"></i> Quản lý đợt quyên góp
				</a> <b class="arrow"></b></li>
				<li class=""><a href="quan-ly-doi-tac"> <i
						class="menu-icon fa fa-caret-right"></i> Quản lý đối tác
				</a> <b class="arrow"></b></li>
				<li class=""><a href="quan-ly-tin-tuc"> <i
						class="menu-icon fa fa-caret-right"></i> Quản lý tin Tức
				</a> <b class="arrow"></b></li>
				<li class=""><a href="quan-ly-tai-khoan"> <i
						class="menu-icon fa fa-caret-right"></i> Quản lý tài khoản
				</a> <b class="arrow"></b></li>

			</ul></li>


	</ul>
	<!-- /.nav-list -->

	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
	</script>
</div>