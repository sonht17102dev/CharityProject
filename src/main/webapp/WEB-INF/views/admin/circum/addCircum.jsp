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
				<li><a href="quan-ly-quyen-gop">Quản lý quyên góp</a>
				</li>
				<li class="active">Thêm đợt quyên góp</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${messageCircum!=null}">
						<h1 class="error" >${messageCircum}</h1>
					</c:if>
					<form id="formSubmit" action="them-quyen-gop" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Thể
								loại</label>
							<div class="col-sm-9">
								<select class="form-control" id="circum_type" name="circum_type">
									<option value="">Chọn thể loại</option>
									<c:forEach items="${category}" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Id
								Đối Tác</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="parner_id"
									name="partner_id" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tiêu
								đề</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_name"
									name="circum_name" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Mô
								tả ngắn</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_des"
									name="circum_des" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Lượt
								quyên góp</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_donations"
									name="circum_donations" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số
								tiền đạt được</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_target"
									name="circum_target" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Số
								tiền mục tiêu</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_raise"
									name="circum_raise" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Thời
								gian kết thúc</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_time_end"
									name="circum_time_end" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Ngày
								bắt đầu quyên góp</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="circum_start_donate"
									name="circum_start_donate" value="" />
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình
								ảnh</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="circum_image" name="circum_image"
									style="width: 820px; height: 175px">
									</textarea>
							<!--  
									
								<input type="file" class="form-control" id="circum_image" name="circum_image" />
									-->
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội
								dung</label>
							<div class="col-sm-9">
								<textarea rows="" cols="" id="circum_content"
									name="circum_content" style="width: 820px; height: 175px"></textarea>
							</div>
						</div>
						<br /> <br />
						<hr>
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
<script src="<c:url value="/resources/admin/assets/js/addCircum.js"/>"></script>