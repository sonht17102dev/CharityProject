<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="nav nav-borders">
   <a class="nav-link" href="${pageContext.request.contextPath}/tai-khoan/bao-mat" >Bảo mật</a>
   <a class="nav-link active ms-0" 
href="${pageContext.request.contextPath}/tai-khoan/cap-nhat?username=<security:authentication property="principal.username" />">Cập nhật</a>
   <a class="nav-link" href="${pageContext.request.contextPath}/tai-khoan/thanh-toan?username=<security:authentication property="principal.username" />">Thanh toán</a>
</nav>
<hr class="mt-0 mb-4">