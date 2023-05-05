<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Charifit</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/user/img/favicon.png"/>">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href='<c:url value="/resources/user/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href="<c:url value="/resources/user/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/magnific-popup.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/nice-select.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/gijgo.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/animate.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/slicknav.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/responsive.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/user/css/account-css.css"/>">
    
    <!-- jquery pagination plugin -->
    <!-- 
     -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <%--
	<script src="<c:url value="/resources/admin/assets/js/jquery.twbsPagination.js"/>"></script>
     --%>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
		type="text/javascript"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
	
	<decorator:body />

	<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>


	   <!-- JS here -->
	<script>
		// Get the modal
		var modalLogin = document.getElementById('id-login');
		var modalSignup = document.getElementById('id-signup');
		var modal = document.getElementById('id-news-1');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modalLogin) {
				modalLogin.style.display = "none";
			}
			if (event.target == modalSignup) {
				modalSignup.style.display = "none";
			}
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
    <script src="<c:url value="/resources/user/js/vendor/modernizr-3.5.0.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/vendor/jquery-1.12.4.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/popper.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/isotope.pkgd.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/ajax-form.js"/>"></script>
    <script src="<c:url value="/resources/user/js/waypoints.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.counterup.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/imagesloaded.pkgd.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/scrollIt.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.scrollUp.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/wow.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.slicknav.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.magnific-popup.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/plugins.js"/>"></script>
    <script src="<c:url value="/resources/user/js/gijgo.min.js"/>"></script>
    <!--contact js-->
    <script src="<c:url value="/resources/user/js/contact.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.ajaxchimp.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.form.js"/>"></script>
    <script src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"></script>
    <script src="<c:url value="/resources/user/js/mail-script.js"/>"></script>

    <script src="<c:url value="/resources/user/js/main.js"/>"></script>
</body>
</html>