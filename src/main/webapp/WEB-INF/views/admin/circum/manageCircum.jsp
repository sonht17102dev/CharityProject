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
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
				</li>

				<li><a href="quan-ly-quyen-gop">Quản Lý</a></li>
				<li class="active">Quản Lý Quyên Góp</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>Bảng thống kê các đợt quyên góp</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="hr hr-18 dotted hr-double"></div>

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các hoạt động quyên góp đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
										<div class="btn-toolbar">

											<!-- /.nav-search -->
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-success dropdown-toggle"
													aria-expanded="true">
													Thể Loại<span
														class="ace-icon fa fa-caret-down icon-on-right"></span>
												</button>
												<ul class="dropdown-menu dropdown-warning">
													<c:forEach items="${category}" var="c">
														<li><a href="search?type=${c}">${c}</a></li>
														<li class="divider"></li>
													</c:forEach>
												</ul>
											</div>

										</div>
									</div>
									<div class="col-xs-6">
										<div class="nav-search " id="nav-search">
											<form id="form-search" class="form-search" action="search" method="post">
												<span class="input-icon"> <input type="text"
													placeholder="Search Từ khóa" class="nav-search-input"
													id="nav-search-input" name="nav-search-input" autocomplete="off" /> <i
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
												<th class="center">Status</th>
												<th class="center">Tên đợt quyên góp</th>
												<th class="center">Loại quyên góp</th>
												<th class="center">Lượt quyên góp</th>
												<th class="center">Đạt được</th>

												<th class="center">Chức năng</th>
											</tr>
										</thead>

										<tbody id="tbody">
											<c:forEach items="${listTop10Circum}" var="o">
												<c:if test='${o.circum_status == "active"}'>
												<tr class="product-brand-number">
													<td class="center"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>
													<td class="hidden">${o.circum_id}</td> 
													<td><span class="label label-success arrowed">${o.circum_status}</span></td>
													<td>${o.circum_name}</td>
													<td>${o.circum_type}</td>
													<td><fmt:formatNumber type="number"
															value="${o.circum_donations}" /></td>
													<td class="hidden-480"><fmt:formatNumber type="number"
															value="${o.circum_target}" />/<fmt:formatNumber
															type="number" value="${o.circum_raise}" /></td>
													<td>
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> <a class="red delete_single"> <i
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

																<ul
																	class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li><a href="#" class="tooltip-info"
																		data-rel="tooltip" title="View"> <span
																			class="blue"> <i
																				class="ace-icon fa fa-search-plus bigger-120"></i>
																		</span>
																	</a></li>

																	<li><a class="tooltip-success" data-rel="tooltip">
																			<span class="green"> <i
																				class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																		</span>
																	</a></li>

																	<li><a class="tooltip-error" data-rel="tooltip">
																			<span class="red"> <i
																				class="ace-icon fa fa-trash-o bigger-120"></i>
																		</span>
																	</a></li>
																</ul>
															</div>
														</div>
													</td>
												</tr>
													 </c:if>
											</c:forEach>
										</tbody>
									</table>
									<div class="row">
										<div class="col-xs-6">
											<button class="deleteall btn btn-danger"
												title="dynamic-table">Xóa đã chọn</button>
											<button class="btn btn-primary addCircum"
												title="Thêm quyên góp">Thêm quyên góp</button>

										</div>
										<div class="col-xs-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dynamic-table_paginate">
												
												<ul class="pagination" id="pagination">
													<li aria-controls="dynamic-table"
														id="dynamic-table_previous"><a
														class="paginate_button previous ${(tag==null||tag==1) ? "
														hidden " : "" }" href="quan-ly-quyen-gop?trang=${tag - 1}">Previous</a></li>
													<c:forEach begin="1" end="${endPage}" var="i">
														<li aria-controls="dynamic-table" tabindex="${i}"><a
															class='paginate_button ${tag == i ? "active" : ""}'
															href="quan-ly-quyen-gop?trang=${i}">${i}</a></li>
													</c:forEach>
													<li aria-controls="dynamic-table" id="dynamic-table_next"><a
														class='paginate_button next ${tag==endPage ? "hidden" : "" }'
														href="quan-ly-quyen-gop?trang=${tag + 1}">Next</a></li>
												<%-- 
														<li aria-controls="dynamic-table" tabindex="1"><button
															class='paginate_button' id="phantrang1">1</button></li>
														<li aria-controls="dynamic-table" tabindex="2"><button
															class='paginate_button' id="phantrang2">2</button></li>
												--%> 
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
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="hr hr-18 dotted hr-double"></div>

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các hoạt động quyên góp không còn hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div id="dynamic-table_wrapper"
									class="dataTables_wrapper form-inline no-footer">
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center hidden"><label class="pos-rel"> <input
														type="checkbox" class="checkall"
														onclick="toggleChecked(this.checked)" /> <span
														class="lbl"></span>
												</label></th>
												<th class="hidden">Id</th>
												<th class="center">Status</th>
												<th class="center">Tên đợt quyên góp</th>
												<th class="center">Loại quyên góp</th>
												<th class="center">Lượt quyên góp</th>
												<th class="center">Đạt được</th>

												<th class="center">Chức năng</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${listInactive}" var="o">
												<tr class="product-brand-number">
													<td class="center hidden"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>
													<td class="hidden">${o.circum_id}</td> 
													<td class="value"><span class="label label-inverse">${o.circum_status}</span></td>
													<td>${o.circum_name}</td>
													<td>${o.circum_type}</td>
													<td><fmt:formatNumber type="number"
															value="${o.circum_donations}" /></td>
													<td class="hidden-480"><fmt:formatNumber type="number"
															value="${o.circum_target}" />/<fmt:formatNumber
															type="number" value="${o.circum_raise}" /></td>
													<td>
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> <a class="red delete_single"> <i
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

																<ul
																	class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li><a href="#" class="tooltip-info"
																		data-rel="tooltip" title="View"> <span
																			class="blue"> <i
																				class="ace-icon fa fa-search-plus bigger-120"></i>
																		</span>
																	</a></li>

																	<li><a class="tooltip-success" data-rel="tooltip">
																			<span class="green"> <i
																				class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																		</span>
																	</a></li>

																	<li><a class="tooltip-error" data-rel="tooltip">
																			<span class="red"> <i
																				class="ace-icon fa fa-trash-o bigger-120"></i>
																		</span>
																	</a></li>
																</ul>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
	$('button.addCircum').on("click", function(event) {
		location.assign("/CharityApp/admin/them-quyen-gop");
	});
	$('a.green').on(
			"click",
			function(event) {
				var idValue = this.parentNode.parentNode.parentNode
						.getElementsByTagName('td')[1].textContent;
				location.assign("/CharityApp/admin/cap-nhat-quyen-gop?id="
						+ idValue);
			});
	$(document)
			.ready(
					function() {
						<%--
						$("#phantrang1").click(function(){
							$("#tbody").load("/CharityApp/admin/quan-ly-quyen-gop?trang=1");
						});
						$("#phantrang2").click(function(){
							$("#tbody").load("/CharityApp/admin/quan-ly-quyen-gop?trang=2");
						});
						--%>
						//function is used to delete individual row
						$('a.delete_single')
								.on(
										"click",
										function(event) {
											var $this = $(this);
											var idValue = this.parentNode.parentNode.parentNode
													.getElementsByTagName('td')[1].textContent;
											var status = this.parentNode.parentNode.parentNode
											.getElementsByTagName('td')[2].textContent;
											//console.log(status);
											var c = confirm('Bạn muốn xóa dòng này chứ?\nClick Ok để tiếp tục\nClick cancle nếu bạn chưa muốn xóa !!!');
											if (c) {
												$
														.ajax({
															url : "/CharityApp/admin/quan-ly-quyen-gop",
															type : 'GET',
															data : {
																id : idValue,
																action : 'deleteCircum',
																status : status
															},
															success : function(
																	response) {
																alert('Xóa Thành Công!');
															},
															error : function() {
																alert('Xóa Thất Bại');
															}
														});
												$this.parents('tr').fadeOut(
														function() {
															$this.remove(); //remove row when animation is finished
														});
											} else {
												alert('Xóa Thất Bại');
											}
											return false;
										});

						//function is used to delete selected row
						$('button.deleteall')
								.on(
										"click",
										function(event) {
											var tb = $(this).attr('title');
											var sel = false;
											var ch = $('#' + tb)
													.find(
															'tbody input[type=checkbox]');
											var c = confirm('Bạn muốn xóa những dòng này chứ?\nClick Ok để tiếp tục!!!\nClick cancle nếu bạn chưa muốn xóa !!!');
											if (c) {
												ch
														.each(function() {
															var $this = $(this);
															var idValue = this.parentNode.parentNode.parentNode
																	.getElementsByTagName('td')[1].textContent;
															var status = this.parentNode.parentNode.parentNode
															.getElementsByTagName('td')[2].textContent;
															//console.log(status);
															if ($this
																	.is(':checked')) {
																sel = true; //set to true if there is/are selected row
																$
																		.ajax({
																			url : "/CharityApp/admin/quan-ly-quyen-gop",
																			type : 'GET',
																			data : {
																				id : idValue,
																				action : 'deleteCircum',
																				status : status
																			},
																			success : function(
																					response) {
																			}
																		});
																$this
																		.parents(
																				'tr')
																		.fadeOut(
																				function() {
																					$this
																							.remove(); //remove row when animation is finished
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


