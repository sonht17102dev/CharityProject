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
					<li class="active">Cập nhật tin tức</li>
				</ul>
				<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">

					<form id="formSubmit" action="cap-nhat-tin-tuc" method="post">
						<input type="hidden" id="news_id" name="news_id" value="${news.news_id}"/>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
							<div class="col-sm-9">
						<c:set var = "stt" value = "${news.news_status}"/>
								<select id="mySelect" class="form-control" id="news_status" 
									name="news_status" >
									<c:choose>
							         <c:when test = "${stt == 'active'}">
							           <option value="active">Đang hoạt động</option>
							           <option value="Chọn trạng thái">Chọn trạng thái </option>
							           <option value="inactive">Không hoạt động</option>
							         </c:when>
							         
							         <c:when test = "${stt == 'inactive'}">
							            <option value="inactive">Không hoạt động</option>
							            <option value="Chọn trạng thái">Chọn trạng thái </option>
							            <option value="active">Đang hoạt động</option>
							         </c:when>
							         
							         <c:otherwise>
							            <option value="Chọn trạng thái">Chọn trạng thái </option>
							            <option value="active">Đang hoạt động</option>
							            <option value="inactive">Không hoạt động</option>
							         </c:otherwise>
							      </c:choose>
								</select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tiêu đề tin tức
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_description"
									name="news_description" value="${news.news_description}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình banner</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_img_banner"
									name="news_img_banner" value="${news.news_img_banner}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Ngày đăng bài</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_post_date"
									name="news_post_date" value="${news.news_post_date}" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung bài viết</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="news_content"
									name="news_content" style="width: 820px; height: 175px"
									>${news.news_content}</textarea>
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
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- /.page-content -->
</div>
<script src="<c:url value="/resources/admin/assets/js/editNews.js"/>"></script>