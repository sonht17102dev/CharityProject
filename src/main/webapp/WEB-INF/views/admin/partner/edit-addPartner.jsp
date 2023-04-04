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
				<li class="active">Chỉnh sửa đối tác đồng hành</li>
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
								<input type="text" class="form-control" id="parner-id"
									name="partner-id" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tên
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="parner-name"
									name="parner-name" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Khẩu hiệu</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="parner-slogan" name="parner-slogan"
									value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Logo</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_logo"
									name="partner_logo" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Banner</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_banner"
									name="partner_banner" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số dự án đã thực hiện</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_number_donate"
									name="partner_number_donate" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tổng số
								tiền đã nhận quyên góp</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="partner_total_money"
									name="partner_total_money" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Giới thiệu ngắn</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="partner_introduce" name="partner_introduce"
									style="width: 820px; height: 175px"></textarea>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="partner_content"
									name="partner_content" style="width: 820px; height: 175px"></textarea>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<div class="col-sm-12">
								<input type="button" class="btn btn-white btn-warning btn-bold"
									value="Cập nhật đối tác" id="btnAddOrUpdateNew" /> 
								<input
									type="button" class="btn btn-white btn-warning btn-bold"
									value="Thêm đối tác" id="btnAddOrUpdateNew" />
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
    