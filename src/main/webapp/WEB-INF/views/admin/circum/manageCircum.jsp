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
				<c:if test="${messageCircum!=null}">
					alert('${messageCircum}');
					location.assign("/CharityApp/admin/quan-ly-quyen-gop");
				</c:if>
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
				<h1 class="text-center">Bảng thống kê các đợt quyên góp</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các hoạt động quyên góp đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
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
												<tr class="product-brand-number">
													<td class="center"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>
													<td class="hidden">${o.circum_id}</td> 
													<td class="center">
													<span class="label ${o.circum_status == 'active' ?
													 'label-success arrowed' : 'label-danger arrowed-in'}">
													 ${o.circum_status}
													 </span>
													 </td>
													 
													<td>${o.circum_name}</td>
													<td class="center">${o.circum_type}</td>
													<td class="center"><fmt:formatNumber type="number"
															value="${o.circum_donations}" /></td>
													<td class="center"><fmt:formatNumber type="number"
															value="${o.circum_target}" />/<fmt:formatNumber
															type="number" value="${o.circum_raise}" /></td>
													<td class="center">
														<div class=" ">
															<a class="green" title="Chỉnh sửa"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> 
															<c:if test="${o.circum_status =='active' }">
																<a class="red delete_single" title="Xóa"> <i
																	class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</c:if>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="row">
										<div class="col-xs-6">
											<button class="deleteall btn btn-danger"
												title="dynamic-table">Xóa đã chọn</button>
											<button class="btn btn-primary addCircum"
												title="Thêm quyên góp">Thêm quyên góp</button>
											<button class="btn btn-warning" 
												id = "btn-inactive-circum"
												title="Xem danh sách đã xóa">Xem danh sách đã xóa</button>

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
		</div>
		<!-- /.page-content -->
	</div>
</div>
<script src="<c:url value="/resources/admin/assets/js/manageCircum.js"/>"></script>
	
	


