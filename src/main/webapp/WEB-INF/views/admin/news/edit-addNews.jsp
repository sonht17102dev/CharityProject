<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>
				<li class="active">Chỉnh sửa tin tức</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">

					<div class="alert alert-${alert}"></div>

					<form id="formSubmit">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Id
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_id"
									name="news_id" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Giới thiệu ngắn
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_descritption"
									name="news_descritption" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình banner</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_img_banner"
									name="news_img_banner" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Ngày đăng bài</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="news_post_date"
									name="news_post_date" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung bài viết</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="news_content"
									name="news_content" style="width: 820px; height: 175px"></textarea>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<div class="col-sm-12">
								<input type="button" class="btn btn-white btn-warning btn-bold"
									value="Cập nhật bài viết" id="btnAddOrUpdateNew" /> <input
									type="button" class="btn btn-white btn-warning btn-bold"
									value="Thêm bài viết" id="btnAddOrUpdateNew" />
							</div>
						</div>
						<input type="hidden" value="" id="id" name="id" />
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- /.page-content -->
</div>
