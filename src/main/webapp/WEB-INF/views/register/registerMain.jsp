<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>


<div class="container">
  <br>
 
  <div class="card bg-light">
    <article class="card-body mx-auto" style="max-width: 600px;">
      <h4 class="card-title mt-3 text-center">Đăng kí tài khoản</h4>
      <p class="text-center">Bắt đầu với tài khoản miễn phí của bạn</p>
      <c:if test="${!messageRegister.isEmpty()}">
	      <p class="text-center error">${messageRegister}</p>
     
       </c:if>
       <!-- 
      <p>
        <a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>  Đăng nhập Twitter</a>
        <a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Đăng nhập facebook</a>
      </p>
        -->
      <p class="divider-text">
        <span class="bg-light"></span>
      </p>
      <form id="formSubmit" action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-group input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
          </div>
          <input name="username" class="form-control" placeholder="Username" type="text">
        </div> <!-- form-group// -->
        <div class="form-group input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
          </div>
          <input name="usermail" class="form-control" placeholder="Địa chỉ mail" type="email">
        </div> <!-- form-group// -->
        <div class="form-group input-group">
          <div class="input-group-prepend" style="max-width: 297px;">
            <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
          </div>
          <input name="userphone" class="form-control" placeholder="Số điện thoại" type="text">
        </div> <!-- form-group// -->
       
       
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block"> Tạo tài khoản </button>
        </div> <!-- form-group// -->
        <p class="text-center">Bạn đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a> </p>
      </form>
    </article>
  </div> <!-- card.// -->

</div>
<!--container end.//-->
<script>

$(document).ready(function () {
	$("#formSubmit").validate({
        rules: {
        	"username": {
        		required: true
        	},
            "usermail": {
              required: true,
              email: true
            },
            "userphone": {
              required: true,
              digits: true
            }
          },
          messages: {
        	"username": {
        		required: "Vui lòng nhập họ và tên của bạn !!!"
        	},
            "usermail": {
              required: "Vui lòng nhập gmail của bạn !!!",
              email: "Vui lòng nhập địa chỉ email hợp lệ !!!"
            },
            "userphone": {
              required: "Vui lòng nhập số điện thoại của bạn !!!",
              digits: "Vui lòng nhập số !!!"
            }
          }
        });
});

</script>

  