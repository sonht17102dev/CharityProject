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
				<li><i class="ace-icon fa fa-home home-icon"></i> <a
					href="home">Home</a></li>

				<li><a href="quan-ly-tai-khoan">Quản Lý</a></li>
				<li class="active">Quản Lý tài khoản</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>Bảng thống kê các tài khoản</h1>
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
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>

													<td class="hidden">${o.account_id}</td>
													<c:if test="${o.account_role == 'ADMIN'}">
													<td class="center"><span class="label label-xlg label-primary arrowed-in-right arrowed-in">ADMIN</span></td>
													</c:if>
													<c:if test="${o.account_role == 'USER'}">
													<td class="center"><span class="label label-xlg label-success arrowed-in-right arrowed-in">USER</span></td>
													</c:if>
													<td class="center">${o.account_mail}</td>
													<td class="center">${o.account_name}</td>
													<td class="center">${o.account_phone}</td>
													<td class="center">
													<c:if test="${o.account_status == 'online'}">
													<span class="label label-success arrowed">Online</span>
													</c:if>
													<c:if test="${o.account_status == 'offline'}">
													<span class="label label-inverse">Offline</span>
													</c:if>
													</td>
													<td class="center">
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green" title="Chỉnh sửa"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> 
															<a class="red delete_single" title="Xóa"> <i
																class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button
																	class="btn btn-minier btn-yellow dropdown-toggle"
																	data-toggle="dropdown" data-position="auto">
																	<i
																		class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
																</button>

															</div>
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
<script type="text/javascript">
	$('button.addAccount').on("click", function(event) {
		location.assign("/CharityApp/admin/them-tai-khoan");
	});
	$('a.green').on("click",function(event) {
		var idValue = this.parentNode.parentNode.parentNode
			.getElementsByTagName('td')[1].textContent;
		location.assign("/CharityApp/admin/cap-nhat-tai-khoan?id="+ idValue);
	});
	$(document).ready(function() {

		//function is used to delete individual row
		$('a.delete_single').on("click",function(event) {
			var $this = $(this);
			var roleValue = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[2].textContent;
			var idValue = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[1].textContent;
			var status = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[6].textContent;
			
			//console.log(status);
			if(roleValue === 'ADMIN') {
					alert('Không được xóa admin!!!');
			} else {
				var c = confirm('Bạn muốn xóa dòng này chứ?\nClick Ok để tiếp tục\nClick cancle nếu bạn chưa muốn xóa !!!');
				if (c) {
					$.ajax({
						url : "/CharityApp/admin/quan-ly-tai-khoan",
						type : 'GET',
						data : {
							id : idValue,
							action : 'deleteAccount',
							role : roleValue
						},
						success : function(response) {
							alert('Xóa thành công !!!');
							location.assign("/CharityApp/admin/quan-ly-tai-khoan");
						}
					});
													
				} else {
					alert('Xóa Thất Bại !!!');
				}
				return false;
			}
		});

		//function is used to delete selected row
		$('button.deleteall').on("click",function(event) {
			var tb = $(this).attr('title');
			var sel = false;
			var ch = $('#' + tb).find('tbody input[type=checkbox]');
			var c = confirm('Bạn muốn xóa những dòng này chứ?\nClick Ok để tiếp tục!!!\nClick cancle nếu bạn chưa muốn xóa !!!');
			if (c) {
				ch.each(function() {
					var $this = $(this);
					var idValue = this.parentNode.parentNode.parentNode
							.getElementsByTagName('td')[1].textContent;
					var role = this.parentNode.parentNode.parentNode
							.getElementsByTagName('td')[2].textContent;
					if ($this.is(':checked')) {
						sel = true; //set to true if there is/are selected row
						$.ajax({
							url : "/CharityApp/admin/quan-ly-tai-khoan",
							type : 'GET',
							data : {
								id : idValue,
								action : 'deleteAccount',
								role : role
							},
							success : function(response) {
							}
					});
					$this.parents('tr').fadeOut(function() {
						$this.remove(); //remove row when animation is finished
					});
					}
				});
				if (sel)
					alert("Xóa Thành Công!");
				if (!sel)
					alert('Xóa Thất Bại - Không có trường nào được chọn');
			}
			return false;
		});
	});

	function toggleChecked(status) {
		$(".checkbox").each(function() {
			$(this).attr("checked", status);
		})
	}
</script>


