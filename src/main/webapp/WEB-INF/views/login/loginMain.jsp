<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<script>
<c:if test="${messageRegister!=null}">
	alert('${messageRegister}');
	location.assign("/CharityApp/login");
</c:if>
</script>
<div id="login-form" class="login-form">
	<h2 class="text-center">Đăng nhập</h2>
	<!-- Check for login error -->

	<c:if test="${param.error != null}">

		<div class="alert alert-danger col-xs-offset-1 col-xs-10">
			username and password không đúng. <br>
		</div>

	</c:if>
	<c:if test='${resetMessage == ""}'>

		<div class="alert alert-danger col-xs-offset-1 col-xs-10">
			Địa chỉ email không tồn tại - vui lòng nhập lại email. <br>
		</div>

	</c:if>
	<c:if test='${resetMessage == "Mật khẩu của bạn đã được reset - Truy cập email để kiểm tra"}'>

		<div class="alert alert-success col-xs-offset-1 col-xs-10">
			Mật khẩu của bạn đã được reset - Truy cập email để kiểm tra. 
			<br>
			Sau đó về Thông tin tài khoản để thay đổi mật khẩu.
		</div>

	</c:if>
	
	<form id="formSubmit" action="${pageContext.request.contextPath}/authenticateTheUser"
		method="post">

		<div class="form-group">
			<input type="text" name="username" class="form-control"
				placeholder="Username">
		</div>
		<div class="form-group">
			<input type="password" name="password" class="form-control"
				placeholder="Password">
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
		</div>
		<div class="clearfix d-flex justify-content-center align-items-center ">
			<!--  <label class="float-left form-check-label"><input
				type="checkbox"> Ghi nhớ đăng nhập</label> -->
			<button type="button" onclick="showForgotPasswordForm()" class="btn btn-secondary">Quên mật khẩu</button>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	
	<p class="text-center">
		<a href="${pageContext.request.contextPath}/register">Tạo tài khoản mới</a>
	</p>
	<p class="text-center">
		<a href="${pageContext.request.contextPath}/trang-chu">Bạn muốn xem trang trước khi đăng nhập.</a>
	</p>
	
</div>
<div id="myModal" class="container h-100" style="display:none;">
        <div class="row h-100">
            <span class="close">&times;</span>
            <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                <div class="d-table-cell align-middle">
                    <div class="text-center mt-4">
                        <h1 class="h2">Reset password</h1>
                        <p class="lead">
                            Nhập email của bạn để thiết lập lại mật khẩu của bạn.
                        </p>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="m-sm-4">
                                <form id="formReset" 
                                	action="${pageContext.request.contextPath}/login/resetPassword" method="post">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input class="form-control form-control-lg" type="email" name="email"
                                            placeholder="Enter your email">
                                    </div>
                                    <div class="text-center mt-3">
                                        <button type="submit" id="inputReset"
                                        class="btn btn-lg btn-primary"> Reset Password </button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="<c:url value="/resources/user/js/login.js"/>"></script>
