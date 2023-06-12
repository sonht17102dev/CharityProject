<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
					</li>
					<li><a href="home">Quản lý</a>
					</li>
					<li><a href="quan-ly-tin-tuc">Quản lý tin tức</a>
					</li>
					<li class="active">Thêm tin tức mới</li>
				</ul>
				<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${messageNews!=null}">
						<h1 class="error">${messageNews}</h1>
					</c:if>
					<form:form id="formSubmit" action="them-tin-tuc" method="post" modelAttribute="news">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tiêu đề tin tức
							</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="news_description"
									name="news_description" path="news_description" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình banner</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="news_img_banner"
									name="news_img_banner" path="news_img_banner" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Ngày đăng bài</label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" id="news_post_date"
									name="news_post_date" path="news_post_date" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung bài viết</label>
							<div class="col-sm-9">
								<form:textarea rows="" cols="" id="news_content"
									name="news_content" path="news_content" style="width: 820px; height: 175px"/>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<div class="col-sm-12">
								<input type="submit" class="btn btn-white btn-success btn-bold"
									value="Lưu" id="btnSubmit" /> 
								<button type="button"
									class="btn btn-white btn-warning btn-bold" 
									id="btnReset">Reset</button>
								<input type="button"
									class="btn btn-white btn-warning btn-bold cancle" value="Hủy"/>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>

	</div>
	<!-- /.page-content -->
</div>
<script src="<c:url value="/resources/admin/assets/js/addNews.js"/>"></script> 