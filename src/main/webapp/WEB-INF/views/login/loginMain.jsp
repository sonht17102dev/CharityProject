<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="login-form">
	<h2 class="text-center">Đăng nhập</h2>
	<!-- Check for login error -->

	<c:if test="${param.error != null}">

		<div class="alert alert-danger col-xs-offset-1 col-xs-10">
			username and password không đúng. <br>
		</div>

	</c:if>

	<!-- Check for logout -->

	<c:if test="${param.logout != null}">

		<div class="alert alert-success col-xs-offset-1 col-xs-10">Bạn đã được đăng xuất.</div>

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
		<div class="clearfix">
			<label class="float-left form-check-label"><input
				type="checkbox"> Ghi nhớ đăng nhập</label> <a href="#" class="float-right">Quên mật khẩu?</a>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	
	<p class="text-center">
		<a href="${pageContext.request.contextPath}/register">Tạo tài khoản mới</a>
	</p>
</div>
<script>

$(document).ready(function () {
	$("#formSubmit").validate({
        rules: {
        	"username": {
        		required: true
        	},
            "password": {
              required: true
            }
          },
          messages: {
        	"username": {
        		required: "Vui lòng nhập username của bạn !!!"
        	},
            "password": {
              required: "Vui lòng nhập mật khẩu của bạn !!!"
            }
          }
        });
});

</script>