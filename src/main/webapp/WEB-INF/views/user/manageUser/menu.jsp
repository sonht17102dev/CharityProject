<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="nav nav-borders">
   <a class="nav-link" href="bao-mat" >Bảo mật</a>
   <a class="nav-link active ms-0" 
href="cap-nhat?username=<security:authentication property="principal.username" />">Cập nhật</a>
   <a class="nav-link" href="thanh-toan?username=<security:authentication property="principal.username" />">Lịch sử</a>
</nav>
<hr class="mt-0 mb-4">