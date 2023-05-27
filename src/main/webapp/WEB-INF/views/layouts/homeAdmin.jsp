<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Admin</title>
<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/css/bootstrap.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/font-awesome/4.2.0/css/font-awesome.min.css"/>" />

<!-- page jquery/ajax -->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/admin/assets/js/jquery.twbsPagination.js"/>"></script>

<!-- text fonts -->
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/fonts/fonts.googleapis.com.css"/>" />

<!-- ace styles -->
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/css/ace.min.css" />"
	class="ace-main-stylesheet" id="main-ace-style" />

<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/css/style.css" />" />

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script
	src="<c:url value="/resources/admin/assets/js/ace-extra.min.js"/>"></script>
<!-- tool ckeditor -->
<script src="<c:url value="/resources/admin/ckeditor/ckeditor.js"/>"></script>
<style>
label.error {
	color: red !important;
}
</style>
</head>
<body>
	<div class="main-container" id="main-container">
		<%@include file="/WEB-INF/views/layouts/admin/headerAd.jsp"%>

		<decorator:body />

		<%@include file="/WEB-INF/views/layouts/admin/footerAd.jsp"%>

		<!-- basic scripts -->
	</div>
	<!-- /.main-container -->
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) 
				document.write("<script src='<c:url value="/resources/admin/assets/js/jquery.mobile.custom.min.js"/>'>"+"<"+"/script>");
		</script>
	<script
		src="<c:url value="/resources/admin/assets/js/bootstrap.min.js"/>"></script>


	<!-- page specific plugin scripts -->


	<!-- ace scripts -->
	<script
		src="<c:url value="/resources/admin/assets/js/ace-elements.min.js"/>"></script>
	<script src="<c:url value="/resources/admin/assets/js/ace.min.js"/>"></script>

	<!-- inline scripts related to this page -->
	


</body>
</html>