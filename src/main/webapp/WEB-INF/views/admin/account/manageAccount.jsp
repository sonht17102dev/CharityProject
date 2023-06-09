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
				<c:if test="${messageAccount!=null}">
					alert('${messageAccount}');
					location.assign("/CharityApp/admin/quan-ly-tai-khoan");
				</c:if>
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a
					href="home">Home</a></li>

				<li><a href="quan-ly-tai-khoan">Quản Lý</a></li>
				<li class="active">Quản Lý tài khoản</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1 class="text-center">Bảng thống kê các tài khoản</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các tài khoản đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
											<!-- /.nav-search -->
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-success dropdown-toggle"
													aria-expanded="true">
													Tìm kiếm theo role<span
														class="ace-icon fa fa-caret-down icon-on-right"></span>
												</button>
												<ul class="dropdown-menu dropdown-warning">
														<li><a href="search-account?role=ADMIN">Admin</a></li>
														<li class="divider"></li>
														<li><a href="search-account?role=USER">User</a></li>
												</ul>
											</div>
									</div>
									<div class="col-xs-6">
										<div class="nav-search " id="nav-search">
											<form id="form-search" class="form-search" action="${pageContext.request.contextPath}/admin/search-account"
												method="post">
												<span class="input-icon"> <input type="text"
													placeholder="Search Từ khóa" class="nav-search-input"
													id="nav-search-input" name="nav-search-input"
													autocomplete="off" /> <i
													class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</form>
										</div>
									</div>
								</div>
								<div id="dynamic-table_wrapper"
									class="dataTables_wrapper form-inline no-footer">
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center"><label class="pos-rel"> <input
														type="checkbox" class="checkall"
														onclick="toggleChecked(this.checked)" /> <span
														class="lbl"></span>
												</label></th>
												<th class="hidden">Id</th>
												<th class="center">Role</th>
												<th class="center">Địa chỉ Mail</th>
												<th class="center">Username</th>
												<th class="center">Số điện thoại</th>
												<th class="center">Trạng thái</th>
												<th class="center">Chức năng</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="o" items="${listTop5Account}">
												<tr class="product-brand-number">
													<td class="center"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> 
															<span class="lbl"></span>
													</label></td>

													<td class="hidden">${o.account_id}</td>
													<c:if test="${o.account_role == 'ADMIN'}">
														<td class="center">
															<span class="label label-xlg label-primary arrowed-in-right
															 arrowed-in">ADMIN</span></td>
													</c:if>
													<c:if test="${o.account_role == 'USER'}">
														<td class="center">
															<span class="label label-xlg label-success
															 arrowed-in-right arrowed-in">USER</span></td>
													</c:if>
													<td class="center">${o.account_mail}</td>
													<td class="center">${o.account_name}</td>
													<td class="center">${o.account_phone}</td>
													<td class="center">
													<c:if test = "${o.enabled == 1}">
														<c:if test="${o.account_status == 'online'}">
														<span class="label label-success arrowed">Online</span>
														</c:if>
														<c:if test="${o.account_status == 'offline'}">
														<span class="label label-inverse">Offline</span>
														</c:if>
													</c:if>
													<c:if test = "${o.enabled == 0}">
														<span class="label label-danger arrowed-in">Bị Cấm</span>
													</c:if>
													</td>
													<td class="center">
														<div class="">
															<c:if test = "${o.enabled == 1}">
															<a class="green" title="Chỉnh sửa"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> 
															<a class="red delete_single" title="Xóa"> <i
																class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
															</c:if>
															<c:if test = "${o.enabled == 0}">
															<div class="btn-group ">
																<button data-toggle="dropdown" 
																class="btn btn-success dropdown-toggle" 
																aria-expanded="false">Chuyển trạng thái
																	<span class="ace-icon fa fa-caret-down
																	 icon-on-right"></span>
																</button>
																<ul class="dropdown-menu dropdown-success
																 dropdown-menu-right">
																	<li>
																		<a class="reactivate">Được hoạt động</a>
																	</li>
																</ul>
															</div>
															</c:if>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="row">
										<div class="col-xs-6">
											<button class="btn btn-primary addAccount"
												title="Thêm tài khoản">Thêm tài khoản</button>
											<button class="btn btn-warning" 
												id = "btn-inactive-account"
												title="Xem danh sách đã xóa">Xem danh sách đã xóa</button>	
										</div>
										<div class="col-xs-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dynamic-table_paginate">
												<ul class="pagination" id="pagination">
													<li aria-controls="dynamic-table"
														id="dynamic-table_previous"><a
														class="paginate_button previous ${(tag==null||tag==1) ? "
														hidden " : "" }" href="quan-ly-tai-khoan?trang=${tag - 1}">Previous</a></li>
													<c:forEach begin="1" end="${endPage}" var="i">
														<li aria-controls="dynamic-table" tabindex="${i}"><a
															class='paginate_button ${tag == i ? "active" : ""}'
															href="quan-ly-tai-khoan?trang=${i}">${i}</a></li>
													</c:forEach>
													<li aria-controls="dynamic-table" id="dynamic-table_next"><a
														class='paginate_button next ${tag==endPage ? "hidden" : "" }'
														href="quan-ly-tai-khoan?trang=${tag + 1}">Next</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<script type="text/javascript" 
src="<c:url value="/resources/admin/assets/js/manageAccount.js"/>">
</script>


